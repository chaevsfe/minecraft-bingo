package dev.chaevsfe.bingocompanion;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import net.minecraft.ChatFormatting;
import net.minecraft.advancements.AdvancementHolder;
import net.minecraft.advancements.AdvancementProgress;
import net.minecraft.core.BlockPos;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.network.chat.Component;
import net.minecraft.network.protocol.game.ClientboundSetSubtitleTextPacket;
import net.minecraft.network.protocol.game.ClientboundSetTitleTextPacket;
import net.minecraft.network.protocol.game.ClientboundSetTitlesAnimationPacket;
import net.minecraft.network.protocol.game.ClientboundSoundPacket;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.PlayerAdvancements;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvent;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.world.entity.boss.enderdragon.EnderDragon;
import net.minecraft.world.entity.boss.enderdragon.phases.EnderDragonPhase;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.level.GameType;
import net.minecraft.world.level.Level;
import net.minecraft.world.level.dimension.end.EnderDragonFight;
import net.minecraft.world.level.entity.EntityTypeTest;
import net.minecraft.world.level.levelgen.Heightmap;
import net.minecraft.world.level.storage.LevelData;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.PlayerScoreEntry;
import net.minecraft.world.scores.PlayerTeam;
import net.minecraft.world.scores.ScoreHolder;

final class Run {
    static final String ALREADY_RUNNING = "A run is already in progress";
    private static final String OBJECTIVE = "bingo.run";
    private static final ScoreHolder ACTIVE = ScoreHolder.forNameOnly("active");
    private static final ScoreHolder ID = ScoreHolder.forNameOnly("id");
    private static final ScoreHolder TIME = ScoreHolder.forNameOnly("time");
    private static final ScoreHolder DEATHS = ScoreHolder.forNameOnly("deaths");
    private static final ScoreHolder KILLED = ScoreHolder.forNameOnly("killed");
    private static final ScoreHolder DYNAMIC = ScoreHolder.forNameOnly("dynamic");
    private static final Set<String> HOLDERS = Set.of("active", "id", "time", "deaths", "killed");
    private static final String STARTED = " started a run. Kill the Ender Dragon together!";
    private static final String STOPPED = "The run was stopped.";
    private static final String CLOCK = "Beat the game: ";
    private static final int MAX_FOOD = 20;
    private static final float SATURATION = 5.0F;
    private static final int SECOND = 20;

    private record Request(UUID starter, Links.Settings settings) {
    }

    private static final Set<UUID> IGNORED = new HashSet<>();
    private static Request pending;
    private static int ticks;

    private Run() {
    }

    static boolean active(MinecraftServer server) {
        return read(server, ACTIVE) == 1;
    }

    static boolean pending() {
        return pending != null;
    }

    static boolean isRunPlayer(ServerPlayer player) {
        int id = read(Datapack.server(player), ID);
        return id > 0 && Datapack.score(player, OBJECTIVE).orElse(0) == id;
    }

    static int deaths(MinecraftServer server) {
        return read(server, DEATHS);
    }

    static String clock() {
        return format(ticks);
    }

    static boolean dragonDead(MinecraftServer server) {
        ServerLevel end = server.getLevel(Level.END);
        EnderDragonFight fight = end == null ? null : end.getDragonFight();
        return fight != null && fight.hasPreviouslyKilledDragon() || !dying(server).isEmpty();
    }

    private static List<? extends EnderDragon> dying(MinecraftServer server) {
        ServerLevel end = server.getLevel(Level.END);
        if (end == null) {
            return List.of();
        }
        return end.getEntities(EntityTypeTest.forClass(EnderDragon.class),
                dragon -> !IGNORED.contains(dragon.getUUID())
                        && (dragon.getHealth() <= 0.0F || dragon.getPhaseManager().getCurrentPhase().getPhase() == EnderDragonPhase.DYING));
    }

    static void request(ServerPlayer starter, Links.Settings settings) {
        pending = new Request(starter.getUUID(), settings);
    }

    static List<String> memberNames(MinecraftServer server, boolean run, String team) {
        List<String> names = new ArrayList<>();
        if (run) {
            Objective objective = server.getScoreboard().getObjective(OBJECTIVE);
            int id = read(server, ID);
            if (objective != null) {
                for (PlayerScoreEntry entry : server.getScoreboard().listPlayerScores(objective)) {
                    if (entry.value() == id && !entry.owner().startsWith("#") && !HOLDERS.contains(entry.owner())) {
                        names.add(entry.owner());
                    }
                }
            }
            return names;
        }
        PlayerTeam players = server.getScoreboard().getPlayerTeam(team + ".bingo");
        if (players != null) {
            names.addAll(players.getPlayers());
        }
        return names;
    }

    static void countDeath(MinecraftServer server) {
        write(server, DEATHS, read(server, DEATHS) + 1);
    }

    static void started(MinecraftServer server) {
        ticks = active(server) ? read(server, TIME) * SECOND : 0;
    }

    static void clear(MinecraftServer server) {
        pending = null;
        ticks = 0;
        IGNORED.clear();
    }

    static void stop(MinecraftServer server) {
        server.getPlayerList().broadcastSystemMessage(Component.literal(STOPPED).withStyle(ChatFormatting.GRAY), false);
        end(server);
    }

    static void endTick(MinecraftServer server) {
        if (pending != null) {
            Request request = pending;
            pending = null;
            ServerPlayer starter = server.getPlayerList().getPlayer(request.starter());
            if (starter != null && !active(server) && !Datapack.running(server) && Datapack.settingUp(server) == null) {
                start(server, starter, request.settings());
            }
        }
        if (!active(server)) {
            return;
        }
        int id = read(server, ID);
        for (ServerPlayer player : List.copyOf(server.getPlayerList().getPlayers())) {
            if (Datapack.score(player, OBJECTIVE).orElse(0) != id && !player.isDeadOrDying()) {
                join(server, player, id, false);
            }
        }
        ticks++;
        if (ticks % SECOND == 0) {
            write(server, TIME, ticks / SECOND);
            Component clock = Component.literal(CLOCK + format(ticks)).withColor(Icons.TEXT_COLOR);
            for (ServerPlayer player : server.getPlayerList().getPlayers()) {
                if (isRunPlayer(player)) {
                    player.sendOverlayMessage(clock);
                }
            }
        }
        if (won(server)) {
            win(server);
        }
    }

    private static void start(MinecraftServer server, ServerPlayer starter, Links.Settings settings) {
        int id = read(server, ID) + 1;
        write(server, ID, id);
        write(server, TIME, 0);
        write(server, DEATHS, 0);
        IGNORED.clear();
        write(server, KILLED, dragonDead(server) ? 1 : 0);
        for (EnderDragon dragon : dying(server)) {
            IGNORED.add(dragon.getUUID());
        }
        write(server, ACTIVE, 1);
        ticks = 0;
        Links.configure(server, settings);
        Objective dynamic = server.getScoreboard().getObjective(Datapack.ADVANCEMENT_SCORE);
        if (dynamic != null) {
            server.getScoreboard().getOrCreatePlayerScore(DYNAMIC, dynamic).set(1);
        }
        for (ServerPlayer player : List.copyOf(server.getPlayerList().getPlayers())) {
            if (player.isDeadOrDying()) {
                continue;
            }
            join(server, player, id, true);
            title(player, Component.literal("Beat the game").withColor(Icons.TEXT_COLOR),
                    Component.literal("Kill the Ender Dragon together").withStyle(ChatFormatting.WHITE), 60);
        }
        server.getPlayerList().broadcastSystemMessage(Component.literal(starter.getScoreboardName() + STARTED).withColor(Icons.TEXT_COLOR), false);
    }

    private static void join(MinecraftServer server, ServerPlayer player, int id, boolean atSpawn) {
        server.getScoreboard().getOrCreatePlayerScore(player, Datapack.dummy(server, OBJECTIVE)).set(id);
        if (player.containerMenu != player.inventoryMenu) {
            player.closeContainer();
        }
        prepare(server, player);
        ServerPlayer friend = atSpawn ? null : friend(server, player);
        if (friend != null) {
            player.teleportTo(friend.level(), friend.getX(), friend.getY(), friend.getZ(), Set.of(), friend.getYRot(), friend.getXRot(), true);
        } else {
            toSpawn(server, player);
        }
    }

    private static ServerPlayer friend(MinecraftServer server, ServerPlayer player) {
        for (ServerPlayer other : server.getPlayerList().getPlayers()) {
            if (other != player && isRunPlayer(other) && !other.isDeadOrDying() && other.gameMode() == GameType.SURVIVAL && other.onGround()
                    && !other.isInLiquid() && !other.isPassenger()) {
                return other;
            }
        }
        return null;
    }

    private static void prepare(MinecraftServer server, ServerPlayer player) {
        if (player.isPassenger()) {
            player.stopRiding();
        }
        player.setGameMode(GameType.SURVIVAL);
        player.getInventory().clearContent();
        player.getEnderChestInventory().clearContent();
        player.inventoryMenu.getCraftSlots().clearContent();
        player.containerMenu.setCarried(ItemStack.EMPTY);
        player.removeAllEffects();
        player.setExperienceLevels(0);
        player.setExperiencePoints(0);
        player.setHealth(player.getMaxHealth());
        player.setAbsorptionAmount(0.0F);
        player.getFoodData().setFoodLevel(MAX_FOOD);
        player.getFoodData().setSaturation(SATURATION);
        player.clearFire();
        player.resetFallDistance();
        player.setRespawnPosition(null, false);
        PlayerAdvancements advancements = player.getAdvancements();
        for (AdvancementHolder holder : server.getAdvancements().getAllAdvancements()) {
            AdvancementProgress progress = advancements.getOrStartProgress(holder);
            if (!progress.hasProgress()) {
                continue;
            }
            List<String> done = new ArrayList<>();
            progress.getCompletedCriteria().forEach(done::add);
            for (String criterion : done) {
                advancements.revoke(holder, criterion);
            }
        }
        player.inventoryMenu.sendAllDataToRemote();
    }

    private static void toSpawn(MinecraftServer server, ServerPlayer player) {
        LevelData.RespawnData spawn = server.overworld().getRespawnData();
        ServerLevel level = server.getLevel(spawn.dimension());
        if (level == null) {
            level = server.overworld();
        }
        BlockPos pos = spawn.pos();
        level.getChunk(pos.getX() >> 4, pos.getZ() >> 4);
        int y = Math.max(pos.getY(), level.getHeight(Heightmap.Types.MOTION_BLOCKING_NO_LEAVES, pos.getX(), pos.getZ()));
        player.teleportTo(level, pos.getX() + 0.5, y, pos.getZ() + 0.5, Set.of(), spawn.yaw(), spawn.pitch(), true);
    }

    private static boolean won(MinecraftServer server) {
        ServerLevel end = server.getLevel(Level.END);
        if (end == null) {
            return false;
        }
        if (!dying(server).isEmpty()) {
            return true;
        }
        EnderDragonFight fight = end.getDragonFight();
        return fight != null && read(server, KILLED) == 0 && fight.hasPreviouslyKilledDragon();
    }

    private static void win(MinecraftServer server) {
        String time = format(ticks);
        int deaths = read(server, DEATHS);
        Component title = Component.literal("You beat the game!").withColor(Icons.TEXT_COLOR);
        Component subtitle = Component.literal("in " + time).withStyle(ChatFormatting.WHITE);
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            title(player, title, subtitle, 100);
            sound(player, SoundEvents.UI_TOAST_CHALLENGE_COMPLETE);
        }
        String summary = "Beat the game in " + time + " with " + deaths + (deaths == 1 ? " death." : " deaths.");
        server.getPlayerList().broadcastSystemMessage(Component.literal(summary).withColor(Icons.TEXT_COLOR), false);
        end(server);
    }

    private static void end(MinecraftServer server) {
        write(server, ACTIVE, 0);
        Links.clearSettings(server);
        pending = null;
        ticks = 0;
    }

    private static void title(ServerPlayer player, Component title, Component subtitle, int stay) {
        player.connection.send(new ClientboundSetTitlesAnimationPacket(10, stay, 20));
        player.connection.send(new ClientboundSetSubtitleTextPacket(subtitle));
        player.connection.send(new ClientboundSetTitleTextPacket(title));
    }

    private static void sound(ServerPlayer player, SoundEvent event) {
        player.connection.send(new ClientboundSoundPacket(BuiltInRegistries.SOUND_EVENT.wrapAsHolder(event), SoundSource.MASTER,
                player.getX(), player.getY(), player.getZ(), 1.0F, 1.0F, player.getRandom().nextLong()));
    }

    private static String format(int elapsed) {
        int seconds = elapsed / SECOND;
        int hours = seconds / 3600;
        int minutes = seconds % 3600 / 60;
        int rest = seconds % 60;
        return hours > 0 ? String.format("%d:%02d:%02d", hours, minutes, rest) : String.format("%d:%02d", minutes, rest);
    }

    private static int read(MinecraftServer server, ScoreHolder holder) {
        return Datapack.score(server, holder, OBJECTIVE).orElse(0);
    }

    private static void write(MinecraftServer server, ScoreHolder holder, int value) {
        server.getScoreboard().getOrCreatePlayerScore(holder, Datapack.dummy(server, OBJECTIVE)).set(value);
    }
}
