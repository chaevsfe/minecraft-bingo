package dev.chaevsfe.bingocompanion;

import java.util.HashSet;
import java.util.List;
import java.util.OptionalInt;
import java.util.Set;
import java.util.UUID;
import net.minecraft.network.chat.ClickEvent;
import net.minecraft.network.chat.Component;
import net.minecraft.network.chat.HoverEvent;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.ScoreAccess;
import net.minecraft.world.scores.Scoreboard;
import net.minecraft.world.scores.criteria.ObjectiveCriteria;

final class Lobby {
    static final String LOBBY_CLOSED = "No lobby is open";
    static final String GAME_RUNNING = "A Bingo game is already running";
    static final String GAME_STARTED = "The game has already started";
    static final String PICK_TEAM_FIRST = "Pick a team first";
    static final String NO_COUNTDOWN = "No countdown in this lobby";
    static final String STARTING = "The game is starting";
    static final String NOBODY_JOINED = "Nobody has joined yet";
    private static final String ALL_READY = "Everyone is ready, the game starts now.";
    private static final String OP_START = " started the game now.";
    private static final String ANNOUNCE = " started a Bingo game. ";
    private static final String OPEN_LOBBY = "[Open lobby]";
    private static final String OPEN_LOBBY_HINT = "Click to open the Bingo lobby";
    private static final String OPEN_LOBBY_COMMAND = "/bingo join";
    private static final String UNKNOWN_STARTER = "Someone";
    private static final int ANNOUNCE_UNTIL = 2;

    private static final Set<UUID> READY = new HashSet<>();
    private static UUID startRequest;
    private static boolean wasOpen;
    private static boolean announced;
    private static int pausedAt = -1;

    private Lobby() {
    }

    static boolean isReady(ServerPlayer player) {
        return READY.contains(player.getUUID());
    }

    static int readyCount(MinecraftServer server) {
        int count = 0;
        for (ServerPlayer player : Datapack.gamePlayers(server)) {
            if (READY.contains(player.getUUID())) {
                count++;
            }
        }
        return count;
    }

    static String closedReason(ServerPlayer player) {
        if (!Datapack.running(Datapack.server(player))) {
            return LOBBY_CLOSED;
        }
        return Datapack.isGamePlayer(player) ? GAME_STARTED : GAME_RUNNING;
    }

    static String readyBlocker(ServerPlayer player) {
        MinecraftServer server = Datapack.server(player);
        if (!Datapack.lobby(server)) {
            return closedReason(player);
        }
        if (!Datapack.isGamePlayer(player)) {
            return PICK_TEAM_FIRST;
        }
        return countdownBlocker(Datapack.lobbyTimer(server));
    }

    static String startBlocker(MinecraftServer server) {
        if (!Datapack.lobby(server)) {
            return LOBBY_CLOSED;
        }
        if (Datapack.gamePlayers(server).isEmpty()) {
            return NOBODY_JOINED;
        }
        return countdownBlocker(Datapack.lobbyTimer(server));
    }

    private static String countdownBlocker(OptionalInt timer) {
        if (timer.isEmpty()) {
            return NO_COUNTDOWN;
        }
        if (timer.getAsInt() >= Datapack.EARLY_END) {
            return STARTING;
        }
        return null;
    }

    static boolean toggleReady(ServerPlayer player) {
        UUID id = player.getUUID();
        if (READY.remove(id)) {
            return false;
        }
        READY.add(id);
        return true;
    }

    static boolean paused() {
        return pausedAt >= 0;
    }

    static void togglePause(ServerPlayer player) {
        MinecraftServer server = Datapack.server(player);
        if (!Datapack.lobby(server)) {
            Datapack.tell(player, closedReason(player));
            return;
        }
        OptionalInt timer = Datapack.lobbyTimer(server);
        String blocker = countdownBlocker(timer);
        if (blocker != null) {
            Datapack.tell(player, blocker);
            return;
        }
        pausedAt = pausedAt >= 0 ? -1 : Math.max(2, timer.getAsInt());
        for (ServerPlayer other : server.getPlayerList().getPlayers()) {
            if (other.containerMenu instanceof LobbyMenu) {
                TriggerQueue.markDirty(other);
            }
        }
    }

    private static void holdPause(MinecraftServer server, Scoreboard scoreboard) {
        if (pausedAt < 0) {
            return;
        }
        OptionalInt timer = Datapack.lobbyTimer(server);
        if (timer.isEmpty() || timer.getAsInt() >= Datapack.EARLY_END) {
            pausedAt = -1;
            return;
        }
        scoreboard.getOrCreatePlayerScore(Datapack.TIMER_HOLDER, scoreboard.getObjective(Datapack.TIMER)).set(pausedAt - 1);
    }

    static void requestStart(ServerPlayer op) {
        if (!Datapack.isOp(op)) {
            return;
        }
        String blocker = startBlocker(Datapack.server(op));
        if (blocker != null) {
            Datapack.tell(op, blocker);
            return;
        }
        startRequest = op.getUUID();
    }

    static void startTick(MinecraftServer server) {
        if (!Datapack.packLoaded(server)) {
            return;
        }
        Scoreboard scoreboard = server.getScoreboard();
        assertFlag(scoreboard);
        READY.removeIf(id -> server.getPlayerList().getPlayer(id) == null);
        if (!Datapack.lobby(server)) {
            startRequest = null;
            return;
        }
        endEarly(server, scoreboard);
        OptionalInt timer = Datapack.lobbyTimer(server);
        if (timer.isPresent()) {
            int seconds = Datapack.secondsLeft(timer.getAsInt());
            if (Datapack.score(server, Datapack.SECONDS_HOLDER, Datapack.COMPANION).orElse(-1) != seconds) {
                scoreboard.getOrCreatePlayerScore(Datapack.SECONDS_HOLDER, scoreboard.getObjective(Datapack.COMPANION)).set(seconds);
            }
        }
        holdPause(server, scoreboard);
    }

    private static void assertFlag(Scoreboard scoreboard) {
        Objective flag = scoreboard.getObjective(Datapack.COMPANION);
        if (flag == null) {
            flag = scoreboard.addObjective(Datapack.COMPANION, ObjectiveCriteria.DUMMY, Component.literal(Datapack.COMPANION),
                    ObjectiveCriteria.DUMMY.getDefaultRenderType(), false, null);
        }
        ScoreAccess mod = scoreboard.getOrCreatePlayerScore(Datapack.MOD_HOLDER, flag);
        if (mod.get() != 1) {
            mod.set(1);
        }
    }

    private static void endEarly(MinecraftServer server, Scoreboard scoreboard) {
        ServerPlayer op = startRequest == null ? null : server.getPlayerList().getPlayer(startRequest);
        startRequest = null;
        OptionalInt timer = Datapack.lobbyTimer(server);
        if (timer.isEmpty() || timer.getAsInt() >= Datapack.EARLY_END) {
            return;
        }
        List<ServerPlayer> players = Datapack.gamePlayers(server);
        if (players.isEmpty()) {
            return;
        }
        boolean allReady = true;
        for (ServerPlayer player : players) {
            if (!READY.contains(player.getUUID())) {
                allReady = false;
                break;
            }
        }
        if (!allReady && op == null) {
            return;
        }
        scoreboard.getOrCreatePlayerScore(Datapack.TIMER_HOLDER, scoreboard.getObjective(Datapack.TIMER)).set(Datapack.EARLY_END);
        String text = op != null ? op.getScoreboardName() + OP_START : ALL_READY;
        server.getPlayerList().broadcastSystemMessage(Component.literal(text).withColor(Icons.TEXT_COLOR), false);
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            if (player.containerMenu instanceof LobbyMenu) {
                TriggerQueue.markDirty(player);
            }
        }
    }

    static void endTick(MinecraftServer server) {
        boolean open = Datapack.lobby(server);
        if (!open) {
            for (ServerPlayer player : server.getPlayerList().getPlayers()) {
                if (player.containerMenu instanceof LobbyMenu) {
                    player.closeContainer();
                }
            }
            if (wasOpen) {
                reset();
                if (Datapack.running(server)) {
                    Hint.dealt(server);
                }
            }
            wasOpen = false;
            return;
        }
        if (!wasOpen) {
            reset();
        }
        wasOpen = true;
        OptionalInt timer = Datapack.lobbyTimer(server);
        if (announced || timer.isEmpty() || timer.getAsInt() > ANNOUNCE_UNTIL) {
            return;
        }
        announced = true;
        Objective companion = server.getScoreboard().getObjective(Datapack.COMPANION);
        if (companion != null) {
            ScoreAccess game = server.getScoreboard().getOrCreatePlayerScore(Datapack.GAME_HOLDER, companion);
            game.set(game.get() + 1);
        }
        ServerPlayer starter = Datapack.starter(server);
        String name = starter == null ? UNKNOWN_STARTER : starter.getScoreboardName();
        server.getPlayerList().broadcastSystemMessage(announcement(name), false);
        if (starter != null && LobbyMenu.open(starter, LobbyMenu.Page.TEAMS)) {
            TriggerQueue.markDirty(starter);
        }
    }

    private static void reset() {
        READY.clear();
        announced = false;
        startRequest = null;
        pausedAt = -1;
    }

    static void clear(MinecraftServer server) {
        reset();
        wasOpen = false;
    }

    static Component announcement(String starter) {
        return Component.literal(starter + ANNOUNCE).withColor(Icons.TEXT_COLOR)
                .append(Component.literal(OPEN_LOBBY).withStyle(style -> style.withColor(Icons.BUTTON_COLOR)
                        .withClickEvent(new ClickEvent.RunCommand(OPEN_LOBBY_COMMAND))
                        .withHoverEvent(new HoverEvent.ShowText(Component.literal(OPEN_LOBBY_HINT)))));
    }
}
