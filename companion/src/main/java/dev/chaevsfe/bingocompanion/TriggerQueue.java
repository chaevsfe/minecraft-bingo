package dev.chaevsfe.bingocompanion;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.function.Predicate;
import net.minecraft.ChatFormatting;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.ReadOnlyScoreInfo;
import net.minecraft.world.scores.ScoreHolder;
import net.minecraft.world.scores.Scoreboard;

final class TriggerQueue {
    enum Nav {
        CLOSE,
        SETTINGS,
        CARD,
        LOBBY
    }

    private record Action(String objective, Predicate<ServerPlayer> gate) {
    }

    private record Write(ScoreHolder holder, String objective) {
    }

    private static final String UNAVAILABLE = "Not available right now";
    private static final int CAPACITY = 8;
    private static final int REFRESH_TICKS = 10;
    private static final Map<UUID, ArrayDeque<Action>> QUEUES = new LinkedHashMap<>();
    private static final Set<UUID> DIRTY = new HashSet<>();
    private static final Map<UUID, Nav> NAVIGATION = new HashMap<>();
    private static final List<Write> WRITES = new ArrayList<>();

    private TriggerQueue() {
    }

    static void enqueue(ServerPlayer player, String objective, Predicate<ServerPlayer> gate) {
        ArrayDeque<Action> queue = QUEUES.computeIfAbsent(player.getUUID(), id -> new ArrayDeque<>());
        if (queue.size() < CAPACITY) {
            queue.addLast(new Action(objective, gate));
        }
    }

    static void navigate(ServerPlayer player, Nav nav) {
        NAVIGATION.put(player.getUUID(), nav);
    }

    static void markDirty(ServerPlayer player) {
        DIRTY.add(player.getUUID());
    }

    static void startTick(MinecraftServer server) {
        if (QUEUES.isEmpty()) {
            return;
        }
        Scoreboard scoreboard = server.getScoreboard();
        Iterator<Map.Entry<UUID, ArrayDeque<Action>>> entries = QUEUES.entrySet().iterator();
        while (entries.hasNext()) {
            Map.Entry<UUID, ArrayDeque<Action>> entry = entries.next();
            ServerPlayer player = server.getPlayerList().getPlayer(entry.getKey());
            if (player == null) {
                entries.remove();
                continue;
            }
            Action action = entry.getValue().pollFirst();
            if (entry.getValue().isEmpty()) {
                entries.remove();
            }
            if (action == null) {
                continue;
            }
            DIRTY.add(entry.getKey());
            Objective objective = scoreboard.getObjective(action.objective());
            if (objective == null || !action.gate().test(player)) {
                Datapack.tell(player, UNAVAILABLE);
                continue;
            }
            scoreboard.getOrCreatePlayerScore(player, objective).set(1);
            WRITES.add(new Write(player, action.objective()));
        }
    }

    static void endTick(MinecraftServer server) {
        if (!WRITES.isEmpty()) {
            Scoreboard scoreboard = server.getScoreboard();
            for (Write write : WRITES) {
                Objective objective = scoreboard.getObjective(write.objective());
                if (objective == null) {
                    continue;
                }
                ReadOnlyScoreInfo info = scoreboard.getPlayerScoreInfo(write.holder(), objective);
                if (info != null && info.value() >= 1) {
                    scoreboard.resetSinglePlayerScore(write.holder(), objective);
                }
            }
            WRITES.clear();
        }
        boolean everyone = server.getTickCount() % REFRESH_TICKS == 0;
        if (everyone || !DIRTY.isEmpty()) {
            for (ServerPlayer player : server.getPlayerList().getPlayers()) {
                if ((everyone || DIRTY.contains(player.getUUID())) && player.containerMenu instanceof LockedMenu menu) {
                    menu.refresh();
                }
            }
            DIRTY.clear();
        }
        if (NAVIGATION.isEmpty()) {
            return;
        }
        Map<UUID, Nav> pending = new HashMap<>(NAVIGATION);
        NAVIGATION.clear();
        for (Map.Entry<UUID, Nav> entry : pending.entrySet()) {
            ServerPlayer player = server.getPlayerList().getPlayer(entry.getKey());
            if (player == null || !(player.containerMenu instanceof LockedMenu)) {
                continue;
            }
            switch (entry.getValue()) {
                case CLOSE -> player.closeContainer();
                case SETTINGS -> SettingsMenu.open(player);
                case CARD -> {
                    if (!CardMenu.open(player)) {
                        player.sendOverlayMessage(Component.literal(SettingsMenu.GAME_ONLY).withStyle(ChatFormatting.RED));
                    }
                }
                case LOBBY -> {
                    if (!LobbyMenu.open(player)) {
                        Datapack.tell(player, Lobby.closedReason(player));
                    }
                }
            }
        }
    }
}
