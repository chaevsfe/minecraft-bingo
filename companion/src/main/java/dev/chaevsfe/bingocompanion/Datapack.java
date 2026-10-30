package dev.chaevsfe.bingocompanion;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.OptionalInt;
import net.minecraft.ChatFormatting;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.functions.CommandFunction;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.nbt.ListTag;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.server.permissions.Permissions;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.PlayerTeam;
import net.minecraft.world.scores.ReadOnlyScoreInfo;
import net.minecraft.world.scores.ScoreHolder;
import net.minecraft.world.scores.Scoreboard;
import net.minecraft.world.scores.criteria.ObjectiveCriteria;

final class Datapack {
    static final String START = ".bingo.start";
    static final String RULES = ".bingo.rules";
    static final String CHAT_SETTINGS = ".bingo.settings";
    static final String LEAVE_YES = "bingo.leave.game.yes";
    static final String TEAM_JOIN = "bingo.team.join.";
    static final String VOTE = "bingo.vote.";
    static final String TP_YES = "bingo.tp_yes";
    static final String TP_NO = "bingo.tp_no";
    static final String ADVANCEMENTS_ON = "bingo.dynamic.advancement.enabled";
    static final String ADVANCEMENTS_OFF = "bingo.dynamic.advancement.disabled";
    static final String LOCATOR_ON = "bingo.dynamic.locator.bar.enabled";
    static final String LOCATOR_OFF = "bingo.dynamic.locator.bar.disabled";
    static final String VERTICAL_RESET = "bingo.items_top";
    static final String UP_10 = "bingo.items_bottom_1";
    static final String UP_1 = "bingo.items_bottom_2";
    static final String DOWN_1 = "bingo.items_bottom_3";
    static final String DOWN_10 = "bingo.items_bottom_4";
    static final String LEFT_10 = "bingo.adjustment_1";
    static final String LEFT_1 = "bingo.adjustment_2";
    static final String HORIZONTAL_RESET = "bingo.adjustment_3";
    static final String RIGHT_1 = "bingo.adjustment_4";
    static final String RIGHT_10 = "bingo.adjustment_5";
    static final String SMALLER = "bingo.adjustment_6";
    static final String SCALE_RESET = "bingo.settings.icon.size_1";
    static final String BIGGER = "bingo.settings.icon.size_2";
    static final String TIMER_SHOW = "bingo.timer.game.yes";
    static final String TIMER_HIDE = "bingo.timer.game.no";
    static final String CLEAR_SETTINGS = "bingo.reset.settings";
    static final String NAME_CHECK = "bingo.name.check.list.object_";
    static final String RESET_TRIGGER = "bingo.reset";

    static final String VERTICAL = "bingo.vertical";
    static final String SPACE = "bingo.space";
    static final String ICON_SIZE = "bingo.icon.size";
    static final String TIMER_SETTING = "bingo.timer.game.settings";

    static final String COMPANION = "bingo.companion";
    static final String TIMER = "bingo.start.game.timer";
    static final String COUNT = "count_player_bingo";
    static final String VOTE_TYPE = "bingo.vote.type";
    static final String VOTE_DIFFICULTY = "bingo.vote.difficulty";
    static final String VOTE_TYPE_WIN = "bingo.vote.type.win";
    static final String VOTE_DIFFICULTY_WIN = "bingo.vote.difficulty.win";
    static final String TP_TYPE = "bingo.type.tp";
    static final String ADVANCEMENT_SCORE = "bingo.dynamic.advancement";
    static final String LOCATOR_SCORE = "bingo.dynamic.locator.bar";
    static final int LOBBY_END = 910;
    static final int VOTE_LOCK = 900;
    static final int EARLY_END = 899;

    static final String TAG_TRAINING = "bingo.game.player.training";
    static final String TAG_STARTER = "bingo.starter_game";

    static final List<String> TEAMS = List.of("red", "dark_red", "yellow", "gold", "white", "aqua", "green", "blue", "light_purple");
    static final List<String> MODES = List.of("line", "cross", "full_house");
    static final List<String> DIFFICULTIES = List.of("standart", "difficult", "hardcore");

    static final ScoreHolder MOD_HOLDER = ScoreHolder.forNameOnly("mod");
    static final ScoreHolder SECONDS_HOLDER = ScoreHolder.forNameOnly("seconds");
    static final ScoreHolder GAME_HOLDER = ScoreHolder.forNameOnly("game");
    static final ScoreHolder TIMER_HOLDER = ScoreHolder.forNameOnly("timer");
    static final ScoreHolder COUNT_HOLDER = ScoreHolder.forNameOnly("count");
    static final ScoreHolder TP_HOLDER = ScoreHolder.forNameOnly("tp");
    static final ScoreHolder RADIUS_HOLDER = ScoreHolder.forNameOnly("radius");

    private static final String LAUNCH = "bingo.start.launch.receipt";
    private static final String LOBBY = "bingo.start.enable.trigger";
    private static final List<String> SETUP = List.of(ADVANCEMENT_SCORE, LOCATOR_SCORE);
    private static final String TAG_PLAYER = "bingo.game.player";
    private static final String TAG_DEALT = "bingo.actionbar.start";
    private static final String TEAM_SUFFIX = ".bingo";
    private static final String VOTE_HOLDER = "vote.";

    private static final ScoreHolder START_HOLDER = ScoreHolder.forNameOnly("start");
    private static final ScoreHolder WIN_HOLDER = ScoreHolder.forNameOnly("win");
    private static final Identifier STORAGE = Identifier.withDefaultNamespace("bingo.macro");
    private static final Identifier RESET = Identifier.parse("koncept.bingo:reset");

    private Datapack() {
    }

    static MinecraftServer server(ServerPlayer player) {
        return player.level().getServer();
    }

    static Objective objective(MinecraftServer server, String name) {
        return server.getScoreboard().getObjective(name);
    }

    static Objective dummy(MinecraftServer server, String name) {
        Scoreboard scoreboard = server.getScoreboard();
        Objective objective = scoreboard.getObjective(name);
        if (objective == null) {
            objective = scoreboard.addObjective(name, ObjectiveCriteria.DUMMY, Component.literal(name), ObjectiveCriteria.DUMMY.getDefaultRenderType(), false, null);
        }
        return objective;
    }

    static boolean packLoaded(MinecraftServer server) {
        return objective(server, START) != null;
    }

    static OptionalInt score(MinecraftServer server, ScoreHolder holder, String name) {
        Scoreboard scoreboard = server.getScoreboard();
        Objective objective = scoreboard.getObjective(name);
        if (objective == null) {
            return OptionalInt.empty();
        }
        ReadOnlyScoreInfo info = scoreboard.getPlayerScoreInfo(holder, objective);
        return info == null ? OptionalInt.empty() : OptionalInt.of(info.value());
    }

    static OptionalInt score(ServerPlayer player, String name) {
        return score(server(player), player, name);
    }

    private static int startScore(MinecraftServer server, String name) {
        return score(server, START_HOLDER, name).orElse(0);
    }

    static boolean running(MinecraftServer server) {
        return startScore(server, LAUNCH) == 1;
    }

    static boolean gameRunning(ServerPlayer player) {
        return running(server(player));
    }

    static boolean lobbyOpen(MinecraftServer server) {
        return startScore(server, LOBBY) >= 1;
    }

    static boolean isGamePlayer(ServerPlayer player) {
        return player.entityTags().contains(TAG_PLAYER);
    }

    static void leaveGame(ServerPlayer player) {
        player.removeTag(TAG_PLAYER);
        if (team(player) != null) {
            server(player).getScoreboard().removePlayerFromTeam(player.getScoreboardName());
        }
    }

    static boolean isOp(ServerPlayer player) {
        return player.permissions().hasPermission(Permissions.COMMANDS_GAMEMASTER);
    }

    static boolean dealt(MinecraftServer server) {
        return !objectId(server, 1).isEmpty();
    }

    static ServerPlayer settingUp(MinecraftServer server) {
        ServerPlayer wizard = StartMenu.wizardOwner(server);
        if (wizard != null) {
            return wizard;
        }
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            for (String name : SETUP) {
                if (score(server, player, name).orElse(-1) == 0) {
                    return player;
                }
            }
        }
        return null;
    }

    static String settingUpText(ServerPlayer setter) {
        return "A game is being set up by " + setter.getScoreboardName();
    }

    static void setRadius(MinecraftServer server, int radius) {
        Scoreboard scoreboard = server.getScoreboard();
        Objective objective = scoreboard.getObjective(TP_TYPE);
        if (objective != null) {
            scoreboard.getOrCreatePlayerScore(RADIUS_HOLDER, objective).set(radius);
        }
    }

    static boolean canStart(ServerPlayer player) {
        MinecraftServer server = server(player);
        return !running(server) && settingUp(server) == null && !Run.active(server) && !Run.pending();
    }

    static boolean canStartAs(ServerPlayer player) {
        MinecraftServer server = server(player);
        if (running(server) || Run.active(server) || Run.pending()) {
            return false;
        }
        ServerPlayer setter = settingUp(server);
        return setter == null || setter == player;
    }

    private static boolean isWizard(ServerPlayer player) {
        MinecraftServer server = server(player);
        return !running(server) && StartMenu.wizardOwner(server) == player;
    }

    static boolean wizardTp(ServerPlayer player) {
        return isWizard(player) && score(server(player), TP_HOLDER, TP_TYPE).orElse(-1) == 0;
    }

    static boolean wizardAdvancement(ServerPlayer player) {
        return isWizard(player) && score(player, ADVANCEMENT_SCORE).orElse(-1) == 0;
    }

    static boolean wizardLocator(ServerPlayer player) {
        return isWizard(player) && score(player, LOCATOR_SCORE).orElse(-1) == 0;
    }

    static boolean always(ServerPlayer player) {
        return true;
    }

    static boolean inGame(ServerPlayer player) {
        return running(server(player)) && isGamePlayer(player);
    }

    static boolean settingsOpen(ServerPlayer player) {
        return inGame(player) && player.entityTags().contains(TAG_DEALT);
    }

    static boolean canLeave(ServerPlayer player) {
        return inGame(player) && objective(server(player), LEAVE_YES) != null;
    }

    static boolean chatSettings(ServerPlayer player) {
        return canLeave(player) && objective(server(player), CHAT_SETTINGS) != null;
    }

    static boolean lobby(MinecraftServer server) {
        return running(server) && lobbyOpen(server);
    }

    static boolean lobby(ServerPlayer player) {
        return lobby(server(player));
    }

    static boolean canChooseTeam(ServerPlayer player) {
        return lobby(player) && !(isGamePlayer(player) && dealt(server(player)));
    }

    static boolean voteMode(ServerPlayer player) {
        return lobby(player) && isGamePlayer(player) && voteOpen(server(player), VOTE_TYPE);
    }

    static boolean voteDifficulty(ServerPlayer player) {
        return lobby(player) && isGamePlayer(player) && voteOpen(server(player), VOTE_DIFFICULTY);
    }

    static boolean voteOpen(MinecraftServer server, String objective) {
        return startScore(server, objective) >= 1;
    }

    static int voteTally(MinecraftServer server, String objective, String option) {
        return score(server, ScoreHolder.forNameOnly(VOTE_HOLDER + option), objective).orElse(0);
    }

    static int voteWinner(MinecraftServer server, String winObjective) {
        return score(server, WIN_HOLDER, winObjective).orElse(0);
    }

    static String ownVote(ServerPlayer player, List<String> options) {
        for (String option : options) {
            if (player.entityTags().contains(VOTE + option)) {
                return option;
            }
        }
        return null;
    }

    static List<ServerPlayer> gamePlayers(MinecraftServer server) {
        List<ServerPlayer> players = new ArrayList<>();
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            if (isGamePlayer(player)) {
                players.add(player);
            }
        }
        return players;
    }

    static List<ServerPlayer> teamMembers(MinecraftServer server, String color) {
        List<ServerPlayer> members = new ArrayList<>();
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            if (color.equals(team(player))) {
                members.add(player);
            }
        }
        return members;
    }

    static OptionalInt lobbyTimer(MinecraftServer server) {
        return score(server, TIMER_HOLDER, TIMER);
    }

    static int secondsLeft(int timer) {
        return Math.max(0, (LOBBY_END - timer + 19) / 20);
    }

    static int playerCount(MinecraftServer server) {
        return score(server, COUNT_HOLDER, COUNT).orElse(0);
    }

    static ServerPlayer starter(MinecraftServer server) {
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            if (player.entityTags().contains(TAG_STARTER)) {
                return player;
            }
        }
        return null;
    }

    static void tell(ServerPlayer player, String text) {
        Component message = Component.literal(text).withStyle(ChatFormatting.RED);
        if (lobby(player) && isGamePlayer(player)) {
            player.sendSystemMessage(message);
        } else {
            player.sendOverlayMessage(message);
        }
    }

    static boolean nameCheck(ServerPlayer player, int cell) {
        return inGame(player) && !objectId(server(player), cell).isEmpty();
    }

    private static CompoundTag macro(MinecraftServer server) {
        return server.getCommandStorage().get(STORAGE);
    }

    static String objectId(MinecraftServer server, int cell) {
        return macro(server).getCompoundOrEmpty("data").getStringOr("object_id_" + cell, "");
    }

    static String translationKey(MinecraftServer server, int cell) {
        return macro(server).getCompoundOrEmpty("data").getStringOr("id_" + cell, "");
    }

    static ListTag collected(MinecraftServer server, String team) {
        if (team == null) {
            return new ListTag();
        }
        return macro(server).getCompoundOrEmpty("team").getListOrEmpty(team);
    }

    static boolean contains(ListTag list, String value) {
        for (int i = 0; i < list.size(); i++) {
            if (value.equals(list.getStringOr(i, null))) {
                return true;
            }
        }
        return false;
    }

    static String team(ServerPlayer player) {
        PlayerTeam team = player.getTeam();
        if (team == null) {
            return null;
        }
        String name = team.getName();
        if (!name.endsWith(TEAM_SUFFIX)) {
            return null;
        }
        String color = name.substring(0, name.length() - TEAM_SUFFIX.length());
        return TEAMS.contains(color) ? color : null;
    }

    static boolean runReset(MinecraftServer server) {
        Optional<CommandFunction<CommandSourceStack>> function = server.getFunctions().get(RESET);
        if (function.isEmpty()) {
            return false;
        }
        server.getFunctions().execute(function.get(), server.createCommandSourceStack().withSuppressedOutput());
        clearSetup(server);
        StartMenu.clear(server);
        return true;
    }

    private static void clearSetup(MinecraftServer server) {
        Scoreboard scoreboard = server.getScoreboard();
        for (String name : SETUP) {
            Objective objective = scoreboard.getObjective(name);
            if (objective == null) {
                continue;
            }
            for (ServerPlayer player : server.getPlayerList().getPlayers()) {
                ReadOnlyScoreInfo info = scoreboard.getPlayerScoreInfo(player, objective);
                if (info != null && info.value() == 0) {
                    scoreboard.resetSinglePlayerScore(player, objective);
                }
            }
        }
    }
}
