package dev.chaevsfe.bingocompanion;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.network.protocol.game.ClientboundHurtAnimationPacket;
import net.minecraft.network.protocol.game.ClientboundSoundPacket;
import net.minecraft.resources.ResourceKey;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.stats.Stats;
import net.minecraft.world.Difficulty;
import net.minecraft.world.damagesource.DamageSource;
import net.minecraft.world.damagesource.DamageTypes;
import net.minecraft.world.effect.MobEffects;
import net.minecraft.world.food.FoodData;
import net.minecraft.world.item.Items;
import net.minecraft.world.level.GameType;
import net.minecraft.world.level.Level;
import net.minecraft.world.level.gamerules.GameRules;
import net.minecraft.world.phys.Vec3;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.ScoreAccess;
import net.minecraft.world.scores.ScoreHolder;
import net.minecraft.world.scores.Scoreboard;

final class Links {
    record Settings(boolean health, boolean hunger, int tether) {
        static final Settings OFF = new Settings(false, false, 0);

        boolean any() {
            return health || hunger || tether > 0;
        }

        boolean linkedDeaths() {
            return health || tether > 0;
        }
    }

    static final class Track {
        int entity;
        boolean alive;
        float health;
        int food;
        float saturation;
        int totems;
        ResourceKey<Level> dimension;
        Vec3 position;
        Set<UUID> pearls = Set.of();
        ResourceKey<Level> safeDimension;
        Vec3 safePosition;
    }

    private static final class Regen {
        int timer;
    }

    private static final class Group {
        float health = -1;
        int food = -1;
        float saturation;
        final Regen regen = new Regen();

        void reset() {
            health = -1;
            food = -1;
            regen.timer = 0;
        }
    }

    static final String RUN_GROUP = "run";
    private static final String OBJECTIVE = "bingo.links";
    private static final ScoreHolder HEALTH = ScoreHolder.forNameOnly("health");
    private static final ScoreHolder HUNGER = ScoreHolder.forNameOnly("hunger");
    private static final ScoreHolder TETHER = ScoreHolder.forNameOnly("tether");
    private static final ScoreHolder REGEN = ScoreHolder.forNameOnly("regen");
    private static final int MAX_FOOD = 20;
    private static final int REGEN_FOOD = 18;
    private static final int FAST_TICKS = 10;
    private static final int SLOW_TICKS = 80;
    private static final int PEACEFUL_TICKS = 20;
    private static final int PEACEFUL_FOOD_TICKS = 10;
    private static final float MAX_SPENT = 6.0F;
    private static final float FEEDBACK = 0.5F;
    private static final int ROPE_TICKS = 2;
    private static final Map<UUID, Track> TRACKS = new HashMap<>();
    private static final Map<String, Group> GROUPS = new HashMap<>();
    private static final String ORDER = "bingo.order";
    private static final String DOOMED = "bingo.doomed";
    private static final ScoreHolder NEXT = ScoreHolder.forNameOnly("#next");
    private static final float STORED_SCALE = 100.0F;
    private static final Map<UUID, String> GROUP_OF = new HashMap<>();
    private static final Map<UUID, Regen> SOLO = new HashMap<>();
    private static boolean live;

    private Links() {
    }

    static Settings settings(MinecraftServer server) {
        if (server.getScoreboard().getObjective(OBJECTIVE) == null) {
            return Settings.OFF;
        }
        return new Settings(read(server, HEALTH) == 1, read(server, HUNGER) == 1, Math.max(0, read(server, TETHER)));
    }

    private static int read(MinecraftServer server, ScoreHolder holder) {
        return Datapack.score(server, holder, OBJECTIVE).orElse(0);
    }

    private static void write(MinecraftServer server, ScoreHolder holder, int value) {
        server.getScoreboard().getOrCreatePlayerScore(holder, Datapack.dummy(server, OBJECTIVE)).set(value);
    }

    static void configure(MinecraftServer server, Settings settings) {
        Scoreboard scoreboard = server.getScoreboard();
        Objective objective = Datapack.dummy(server, OBJECTIVE);
        scoreboard.getOrCreatePlayerScore(HEALTH, objective).set(settings.health() ? 1 : 0);
        scoreboard.getOrCreatePlayerScore(HUNGER, objective).set(settings.hunger() ? 1 : 0);
        scoreboard.getOrCreatePlayerScore(TETHER, objective).set(settings.tether());
    }

    static void clearSettings(MinecraftServer server) {
        if (settings(server).any()) {
            configure(server, Settings.OFF);
        }
    }

    static void started(MinecraftServer server) {
        if (!Run.active(server) && !Datapack.running(server)) {
            clearSettings(server);
            naturalRegen(server, false);
            forget(server);
        }
    }

    static void clear(MinecraftServer server) {
        TRACKS.clear();
        GROUPS.clear();
        GROUP_OF.clear();
        SOLO.clear();
        Tether.clear();
        live = false;
    }

    private static void forget(MinecraftServer server) {
        Scoreboard scoreboard = server.getScoreboard();
        for (String name : List.of(ORDER, DOOMED)) {
            Objective objective = scoreboard.getObjective(name);
            if (objective != null) {
                scoreboard.removeObjective(objective);
            }
        }
    }

    static void endTick(MinecraftServer server) {
        boolean run = Run.active(server);
        boolean bingo = !run && Datapack.packLoaded(server) && Datapack.running(server);
        if (!run && !bingo) {
            if (live || StartMenu.wizardOwner(server) == null) {
                clearSettings(server);
            }
            naturalRegen(server, false);
            if (live) {
                forget(server);
            }
            clear(server);
            return;
        }
        live = true;
        Settings settings = settings(server);
        boolean ownRegen = naturalRegen(server, settings.health());
        Map<String, List<ServerPlayer>> groups = collect(server, run);
        Set<UUID> seen = new HashSet<>();
        if (run || settings.any()) {
            boolean rope = server.getTickCount() % ROPE_TICKS == 0;
            for (Map.Entry<String, List<ServerPlayer>> entry : groups.entrySet()) {
                process(server, entry.getKey(), entry.getValue(), settings, run, rope, ownRegen);
                for (ServerPlayer player : entry.getValue()) {
                    seen.add(player.getUUID());
                }
            }
        }
        TRACKS.keySet().retainAll(seen);
        if (ownRegen) {
            soloRegen(server, seen);
        } else {
            SOLO.clear();
        }
    }

    private static boolean naturalRegen(MinecraftServer server, boolean take) {
        GameRules rules = server.getGameRules();
        boolean on = rules.get(GameRules.NATURAL_HEALTH_REGENERATION);
        boolean ours = server.getScoreboard().getObjective(OBJECTIVE) != null && read(server, REGEN) == 1;
        if (take && on) {
            rules.set(GameRules.NATURAL_HEALTH_REGENERATION, false, server);
            write(server, REGEN, 1);
            return true;
        }
        if (!take && ours) {
            if (!on) {
                rules.set(GameRules.NATURAL_HEALTH_REGENERATION, true, server);
            }
            write(server, REGEN, 0);
            return false;
        }
        return take && ours;
    }

    private static Map<String, List<ServerPlayer>> collect(MinecraftServer server, boolean run) {
        Map<String, List<ServerPlayer>> groups = new LinkedHashMap<>();
        Scoreboard scoreboard = server.getScoreboard();
        Objective order = Datapack.dummy(server, ORDER);
        boolean dealt = !run && Datapack.dealt(server);
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            String name = run ? (Run.isRunPlayer(player) ? RUN_GROUP : null) : (Datapack.isGamePlayer(player) ? Datapack.team(player) : null);
            UUID id = player.getUUID();
            String previous = GROUP_OF.get(id);
            if (name == null) {
                if (previous != null) {
                    GROUP_OF.remove(id);
                }
                if (scoreboard.getPlayerScoreInfo(player, order) != null) {
                    scoreboard.resetSinglePlayerScore(player, order);
                }
                undoom(server, player);
                continue;
            }
            if (!name.equals(previous)) {
                if (previous != null || scoreboard.getPlayerScoreInfo(player, order) == null) {
                    ScoreAccess next = scoreboard.getOrCreatePlayerScore(NEXT, order);
                    next.set(next.get() + 1);
                    scoreboard.getOrCreatePlayerScore(player, order).set(next.get());
                }
                GROUP_OF.put(id, name);
            }
            if (player.gameMode() == GameType.SURVIVAL && (run || (dealt && Datapack.settingsOpen(player)))) {
                groups.computeIfAbsent(name, key -> new ArrayList<>()).add(player);
            }
        }
        for (List<ServerPlayer> members : groups.values()) {
            members.sort(Comparator.comparingInt(player -> Datapack.score(server, player, ORDER).orElse(Integer.MAX_VALUE)));
        }
        return groups;
    }

    private static boolean doomed(MinecraftServer server, ServerPlayer player) {
        return Datapack.score(server, player, DOOMED).orElse(0) == 1;
    }

    private static void doom(MinecraftServer server, ScoreHolder holder) {
        server.getScoreboard().getOrCreatePlayerScore(holder, Datapack.dummy(server, DOOMED)).set(1);
    }

    private static void undoom(MinecraftServer server, ServerPlayer player) {
        Objective objective = server.getScoreboard().getObjective(DOOMED);
        if (objective != null && server.getScoreboard().getPlayerScoreInfo(player, objective) != null) {
            server.getScoreboard().resetSinglePlayerScore(player, objective);
        }
    }

    private static Group group(MinecraftServer server, String name) {
        Group group = GROUPS.get(name);
        if (group == null) {
            group = new Group();
            group.health = stored(server, "#h." + name);
            group.food = Math.round(stored(server, "#f." + name));
            group.saturation = Math.max(0.0F, stored(server, "#s." + name));
            GROUPS.put(name, group);
        }
        return group;
    }

    private static float stored(MinecraftServer server, String holder) {
        return Datapack.score(server, ScoreHolder.forNameOnly(holder), ORDER).orElse(-(int) STORED_SCALE) / STORED_SCALE;
    }

    private static void store(MinecraftServer server, String name, Group group) {
        Scoreboard scoreboard = server.getScoreboard();
        Objective order = Datapack.dummy(server, ORDER);
        int health = Math.round(group.health * STORED_SCALE);
        int food = group.food < 0 ? -(int) STORED_SCALE : group.food * (int) STORED_SCALE;
        int saturation = Math.round(group.saturation * STORED_SCALE);
        storeOne(scoreboard, order, "#h." + name, health);
        storeOne(scoreboard, order, "#f." + name, food);
        storeOne(scoreboard, order, "#s." + name, saturation);
    }

    private static void storeOne(Scoreboard scoreboard, Objective objective, String holder, int value) {
        ScoreAccess score = scoreboard.getOrCreatePlayerScore(ScoreHolder.forNameOnly(holder), objective);
        if (score.get() != value) {
            score.set(value);
        }
    }

    private static void process(MinecraftServer server, String name, List<ServerPlayer> members, Settings settings, boolean run, boolean rope, boolean ownRegen) {
        Group group = group(server, name);
        List<ServerPlayer> alive = new ArrayList<>();
        List<ServerPlayer> stable = new ArrayList<>();
        List<ServerPlayer> arrived = new ArrayList<>();
        boolean death = false;
        for (ServerPlayer player : members) {
            if (player.isRemoved()) {
                continue;
            }
            Track track = TRACKS.get(player.getUUID());
            boolean same = track != null && track.entity == player.getId();
            if (player.isDeadOrDying()) {
                if (same && track.alive) {
                    death = true;
                    if (run) {
                        Run.countDeath(server);
                    }
                }
                undoom(server, player);
                continue;
            }
            if (doomed(server, player)) {
                undoom(server, player);
                if (settings.linkedDeaths()) {
                    kill(player);
                    continue;
                }
            }
            alive.add(player);
            if (same && track.alive) {
                stable.add(player);
            } else if (track == null || !track.alive) {
                arrived.add(player);
            }
        }
        if (death && settings.linkedDeaths()) {
            wipe(server, name, group, alive, members, run);
            store(server, name, group);
            record(members);
            return;
        }
        if (settings.tether() > 0) {
            Tether.place(server, name, alive, arrived, TRACKS, settings.tether());
        }
        if (settings.health() && !shareHealth(server, group, alive, stable, ownRegen)) {
            if (run) {
                Run.countDeath(server);
            }
            wipe(server, name, group, alive, members, run);
            store(server, name, group);
            record(members);
            return;
        }
        if (settings.hunger()) {
            shareHunger(group, alive, stable);
        }
        if (settings.tether() > 0 && !Tether.following(name)) {
            Tether.pull(server, alive, TRACKS, settings.tether());
            if (rope) {
                Tether.rope(alive, settings.tether(), run ? Icons.TEXT_COLOR : Icons.teamRgb(name));
            }
        }
        store(server, name, group);
        record(members);
    }

    private static void wipe(MinecraftServer server, String name, Group group, List<ServerPlayer> alive, List<ServerPlayer> members, boolean run) {
        for (ServerPlayer player : alive) {
            kill(player);
        }
        for (ServerPlayer player : members) {
            if (player.isRemoved()) {
                doom(server, player);
            }
        }
        group.reset();
        for (String player : Run.memberNames(server, run, name)) {
            if (server.getPlayerList().getPlayerByName(player) == null) {
                doom(server, ScoreHolder.forNameOnly(player));
            }
        }
    }

    private static boolean shareHealth(MinecraftServer server, Group group, List<ServerPlayer> alive, List<ServerPlayer> stable, boolean ownRegen) {
        if (alive.isEmpty()) {
            group.health = -1;
            return true;
        }
        float cap = 0.0F;
        for (ServerPlayer player : alive) {
            cap = Math.max(cap, player.getMaxHealth());
        }
        float previous = group.health;
        float health;
        if (previous < 0.0F) {
            health = cap;
            for (ServerPlayer player : alive) {
                health = Math.min(health, player.getHealth());
            }
        } else {
            health = previous;
            boolean totem = false;
            boolean hard = false;
            for (ServerPlayer player : stable) {
                Track track = TRACKS.get(player.getUUID());
                float change = player.getHealth() - track.health;
                health += change;
                if (totems(player) > track.totems) {
                    totem = true;
                }
                if (change < 0.0F && !soft(player)) {
                    hard = true;
                }
            }
            if (health <= 0.0F && (totem || !hard)) {
                health = 1.0F;
            }
            if (ownRegen && health > 0.0F) {
                health += teamRegen(server, group, alive, health < cap);
            }
        }
        if (health <= 0.0F) {
            return false;
        }
        health = Math.min(health, cap);
        for (ServerPlayer player : alive) {
            float before = player.getHealth();
            boolean hit = stable.contains(player) && before < TRACKS.get(player.getUUID()).health;
            if (before != health) {
                player.setHealth(health);
            }
            if (stable.contains(player) && !hit && before - player.getHealth() >= FEEDBACK) {
                feedback(player);
            }
        }
        group.health = health;
        return true;
    }

    private static boolean soft(ServerPlayer player) {
        DamageSource source = player.getLastDamageSource();
        return source != null && (source.is(DamageTypes.STARVE) || (source.is(DamageTypes.MAGIC) && player.hasEffect(MobEffects.POISON)));
    }

    private static int totems(ServerPlayer player) {
        return player.getStats().getValue(Stats.ITEM_USED.get(Items.TOTEM_OF_UNDYING));
    }

    private static float teamRegen(MinecraftServer server, Group group, List<ServerPlayer> alive, boolean hurt) {
        ServerPlayer source = alive.get(0);
        for (ServerPlayer player : alive) {
            if (better(player.getFoodData(), source.getFoodData())) {
                source = player;
            }
        }
        return naturalHeal(server, source, group.regen, hurt);
    }

    private static boolean better(FoodData a, FoodData b) {
        if (tier(a) != tier(b)) {
            return tier(a) > tier(b);
        }
        if (a.getFoodLevel() != b.getFoodLevel()) {
            return a.getFoodLevel() > b.getFoodLevel();
        }
        return a.getSaturationLevel() > b.getSaturationLevel();
    }

    private static int tier(FoodData food) {
        if (food.getFoodLevel() >= MAX_FOOD && food.getSaturationLevel() > 0.0F) {
            return 2;
        }
        return food.getFoodLevel() >= REGEN_FOOD ? 1 : 0;
    }

    private static float naturalHeal(MinecraftServer server, ServerPlayer player, Regen regen, boolean hurt) {
        FoodData food = player.getFoodData();
        float heal = 0.0F;
        if (player.level().getDifficulty() == Difficulty.PEACEFUL) {
            int tick = server.getTickCount();
            if (tick % PEACEFUL_TICKS == 0) {
                if (hurt) {
                    heal += 1.0F;
                }
                if (food.getSaturationLevel() < MAX_FOOD) {
                    food.setSaturation(food.getSaturationLevel() + 1.0F);
                }
            }
            if (food.needsFood() && tick % PEACEFUL_FOOD_TICKS == 0) {
                food.setFoodLevel(food.getFoodLevel() + 1);
            }
        }
        if (hurt && food.getSaturationLevel() > 0.0F && food.getFoodLevel() >= MAX_FOOD) {
            if (++regen.timer >= FAST_TICKS) {
                float spent = Math.min(food.getSaturationLevel(), MAX_SPENT);
                food.addExhaustion(spent);
                regen.timer = 0;
                heal += spent / MAX_SPENT;
            }
        } else if (hurt && food.getFoodLevel() >= REGEN_FOOD) {
            if (++regen.timer >= SLOW_TICKS) {
                food.addExhaustion(MAX_SPENT);
                regen.timer = 0;
                heal += 1.0F;
            }
        } else {
            regen.timer = 0;
        }
        return heal;
    }

    private static void soloRegen(MinecraftServer server, Set<UUID> linked) {
        Set<UUID> online = new HashSet<>();
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            UUID id = player.getUUID();
            if (linked.contains(id) || player.isRemoved() || player.isDeadOrDying() || player.isSpectator() || player.isCreative()) {
                continue;
            }
            online.add(id);
            float heal = naturalHeal(server, player, SOLO.computeIfAbsent(id, key -> new Regen()), player.getHealth() < player.getMaxHealth());
            if (heal > 0.0F) {
                player.heal(heal);
            }
        }
        SOLO.keySet().retainAll(online);
    }

    private static void shareHunger(Group group, List<ServerPlayer> alive, List<ServerPlayer> stable) {
        if (alive.isEmpty()) {
            group.food = -1;
            return;
        }
        int food;
        float saturation;
        if (group.food < 0) {
            food = MAX_FOOD;
            saturation = MAX_FOOD;
            for (ServerPlayer player : alive) {
                food = Math.min(food, player.getFoodData().getFoodLevel());
                saturation = Math.min(saturation, player.getFoodData().getSaturationLevel());
            }
            saturation = Math.min(saturation, (float) food);
        } else {
            food = group.food;
            saturation = group.saturation;
            for (ServerPlayer player : stable) {
                Track track = TRACKS.get(player.getUUID());
                FoodData data = player.getFoodData();
                food += data.getFoodLevel() - track.food;
                saturation += data.getSaturationLevel() - track.saturation;
            }
            food = Math.clamp(food, 0, MAX_FOOD);
            saturation = Math.clamp(saturation, 0.0F, (float) food);
        }
        for (ServerPlayer player : alive) {
            FoodData data = player.getFoodData();
            if (data.getFoodLevel() != food) {
                data.setFoodLevel(food);
            }
            if (data.getSaturationLevel() != saturation) {
                data.setSaturation(saturation);
            }
        }
        group.food = food;
        group.saturation = saturation;
    }

    private static void kill(ServerPlayer player) {
        if (player.isRemoved() || player.isDeadOrDying()) {
            return;
        }
        player.setHealth(0.0F);
        player.die(player.damageSources().generic());
    }

    private static void feedback(ServerPlayer player) {
        player.connection.send(new ClientboundHurtAnimationPacket(player));
        player.connection.send(new ClientboundSoundPacket(BuiltInRegistries.SOUND_EVENT.wrapAsHolder(SoundEvents.PLAYER_HURT), SoundSource.PLAYERS,
                player.getX(), player.getY(), player.getZ(), 1.0F, 1.0F, player.getRandom().nextLong()));
    }

    private static void record(List<ServerPlayer> members) {
        for (ServerPlayer player : members) {
            Track track = TRACKS.computeIfAbsent(player.getUUID(), id -> new Track());
            track.entity = player.getId();
            track.alive = !player.isDeadOrDying();
            track.health = player.getHealth();
            FoodData food = player.getFoodData();
            track.food = food.getFoodLevel();
            track.saturation = food.getSaturationLevel();
            track.totems = totems(player);
            track.dimension = player.level().dimension();
            track.position = player.position();
            Set<UUID> pearls = new HashSet<>();
            player.getEnderPearls().forEach(pearl -> pearls.add(pearl.getUUID()));
            track.pearls = pearls;
            if (Tether.safe(player)) {
                track.safeDimension = track.dimension;
                track.safePosition = track.position;
            }
        }
    }
}
