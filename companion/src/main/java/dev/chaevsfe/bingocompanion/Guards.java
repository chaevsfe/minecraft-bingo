package dev.chaevsfe.bingocompanion;

import java.util.ArrayList;
import java.util.List;
import java.util.OptionalInt;
import java.util.stream.Stream;
import net.minecraft.ChatFormatting;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.ReadOnlyScoreInfo;
import net.minecraft.world.scores.Scoreboard;

final class Guards {
    private static final String RESET_DENIED = "Only operators can reset the Bingo game";
    private static final String VOTE_NEEDS_TEAM = "Pick a team before voting";
    private static final String GAME_OVER = "Your previous Bingo game is over";
    private static final List<String> WIZARD = List.of(Datapack.START, Datapack.TP_YES, Datapack.TP_NO, Datapack.ADVANCEMENTS_ON,
            Datapack.ADVANCEMENTS_OFF, Datapack.LOCATOR_ON, Datapack.LOCATOR_OFF);
    private static final List<String> VOTES = Stream.concat(Datapack.MODES.stream(), Datapack.DIFFICULTIES.stream()).toList();

    private Guards() {
    }

    static void startTick(MinecraftServer server) {
        Scoreboard scoreboard = server.getScoreboard();
        Objective reset = scoreboard.getObjective(Datapack.RESET_TRIGGER);
        List<Objective> wizard = new ArrayList<>();
        if (Run.active(server) || Run.pending()) {
            for (String name : WIZARD) {
                Objective objective = scoreboard.getObjective(name);
                if (objective != null) {
                    wizard.add(objective);
                }
            }
        }
        boolean lobby = Datapack.lobby(server);
        boolean lockTeams = lobby && Datapack.dealt(server);
        boolean running = Datapack.running(server);
        Objective companion = scoreboard.getObjective(Datapack.COMPANION);
        int game = companion == null ? 0 : Datapack.score(server, Datapack.GAME_HOLDER, Datapack.COMPANION).orElse(0);
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            if (Datapack.isGamePlayer(player)) {
                OptionalInt stamp = companion == null ? OptionalInt.empty() : Datapack.score(server, player, Datapack.COMPANION);
                if (!running || (game > 0 && stamp.isPresent() && stamp.getAsInt() != game)) {
                    Datapack.leaveGame(player);
                    if (companion != null) {
                        scoreboard.resetSinglePlayerScore(player, companion);
                    }
                    player.sendSystemMessage(Component.literal(GAME_OVER).withStyle(ChatFormatting.GRAY));
                } else if (game > 0 && stamp.isEmpty()) {
                    scoreboard.getOrCreatePlayerScore(player, companion).set(game);
                }
            } else if (companion != null && scoreboard.getPlayerScoreInfo(player, companion) != null) {
                scoreboard.resetSinglePlayerScore(player, companion);
            }
            boolean refused = false;
            for (Objective objective : wizard) {
                refused |= clear(scoreboard, player, objective);
            }
            if (refused) {
                player.sendSystemMessage(Component.literal(Run.ALREADY_RUNNING).withStyle(ChatFormatting.RED));
            }
            if (reset != null && !Datapack.isOp(player) && clear(scoreboard, player, reset)) {
                player.sendSystemMessage(Component.literal(RESET_DENIED).withStyle(ChatFormatting.RED));
            }
            if (lockTeams && Datapack.isGamePlayer(player)) {
                for (String color : Datapack.TEAMS) {
                    Objective join = scoreboard.getObjective(Datapack.TEAM_JOIN + color);
                    if (join != null) {
                        clear(scoreboard, player, join);
                    }
                }
            }
            if (lobby && !Datapack.isGamePlayer(player) && clearVotes(scoreboard, player)) {
                player.sendSystemMessage(Component.literal(VOTE_NEEDS_TEAM).withStyle(ChatFormatting.RED));
            }
        }
    }

    private static boolean clearVotes(Scoreboard scoreboard, ServerPlayer player) {
        boolean cleared = false;
        for (String option : VOTES) {
            Objective vote = scoreboard.getObjective(Datapack.VOTE + option);
            if (vote != null && clear(scoreboard, player, vote)) {
                cleared = true;
            }
        }
        return cleared;
    }

    private static boolean clear(Scoreboard scoreboard, ServerPlayer player, Objective objective) {
        ReadOnlyScoreInfo info = scoreboard.getPlayerScoreInfo(player, objective);
        if (info == null || info.value() < 1) {
            return false;
        }
        scoreboard.resetSinglePlayerScore(player, objective);
        return true;
    }
}
