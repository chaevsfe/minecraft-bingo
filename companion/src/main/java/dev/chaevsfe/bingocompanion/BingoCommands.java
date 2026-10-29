package dev.chaevsfe.bingocompanion;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.builder.LiteralArgumentBuilder;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import java.util.function.Function;
import java.util.function.Predicate;
import net.minecraft.commands.CommandBuildContext;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.Commands;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;

final class BingoCommands {
    private static final String NOT_LOADED = "Bingo datapack is not loaded";
    private static final String NOT_IN_GAME = "You are not in a Bingo game";
    private static final String MODE_CLOSED = "Mode voting is not open";
    private static final String DIFFICULTY_CLOSED = "Difficulty voting is not open";
    private static final String READY_ON = "You are ready";
    private static final String READY_OFF = "You are no longer ready";

    private BingoCommands() {
    }

    static void register(CommandDispatcher<CommandSourceStack> dispatcher, CommandBuildContext context, Commands.CommandSelection selection) {
        LiteralArgumentBuilder<CommandSourceStack> team = Commands.literal("team");
        for (String color : Datapack.TEAMS) {
            team.then(Commands.literal(color)
                    .executes(c -> fire(c.getSource(), Datapack.TEAM_JOIN + color, Datapack::canChooseTeam, LobbyMenu.TEAMS_CLOSED)));
        }

        LiteralArgumentBuilder<CommandSourceStack> vote = Commands.literal("vote");
        for (String mode : new String[] {"line", "cross", "full_house"}) {
            vote.then(Commands.literal(mode)
                    .executes(c -> fire(c.getSource(), Datapack.VOTE + mode, Datapack::voteMode, MODE_CLOSED)));
        }
        vote.then(Commands.literal("standard")
                .executes(c -> fire(c.getSource(), Datapack.VOTE + "standart", Datapack::voteDifficulty, DIFFICULTY_CLOSED)));
        for (String difficulty : new String[] {"difficult", "hardcore"}) {
            vote.then(Commands.literal(difficulty)
                    .executes(c -> fire(c.getSource(), Datapack.VOTE + difficulty, Datapack::voteDifficulty, DIFFICULTY_CLOSED)));
        }

        dispatcher.register(Commands.literal("bingo")
                .executes(c -> openSettings(c.getSource()))
                .then(Commands.literal("settings")
                        .executes(c -> openSettings(c.getSource())))
                .then(Commands.literal("card")
                        .executes(c -> openCard(c.getSource())))
                .then(Commands.literal("start")
                        .executes(c -> fire(c.getSource(), Datapack.START, Datapack::canStart, BingoCommands::startFailure)))
                .then(Commands.literal("rules")
                        .executes(c -> fire(c.getSource(), Datapack.RULES, Datapack::always, NOT_LOADED)))
                .then(Commands.literal("leave")
                        .executes(c -> fire(c.getSource(), Datapack.LEAVE_ASK, Datapack::canLeaveAsk, BingoCommands::leaveFailure))
                        .then(Commands.literal("confirm")
                                .executes(c -> fire(c.getSource(), Datapack.LEAVE_YES, Datapack::canLeave, BingoCommands::leaveFailure))))
                .then(Commands.literal("join")
                        .executes(c -> openLobby(c.getSource())))
                .then(Commands.literal("lobby")
                        .executes(c -> openLobby(c.getSource())))
                .then(Commands.literal("ready")
                        .executes(c -> ready(c.getSource())))
                .then(team)
                .then(vote)
                .then(Commands.literal("reset")
                        .requires(Commands.hasPermission(Commands.LEVEL_GAMEMASTERS))
                        .executes(c -> reset(c.getSource())))
                .then(Commands.literal("send")
                        .requires(Commands.hasPermission(Commands.LEVEL_ADMINS))
                        .executes(c -> Transfer.send(c.getSource(), Transfer.BINGO)))
                .then(Commands.literal("return")
                        .requires(Commands.hasPermission(Commands.LEVEL_ADMINS))
                        .executes(c -> Transfer.send(c.getSource(), Transfer.VANILLA))));
    }

    private static int fail(CommandSourceStack source, String message) {
        source.sendFailure(Component.literal(message));
        return 0;
    }

    private static int openSettings(CommandSourceStack source) throws CommandSyntaxException {
        ServerPlayer player = source.getPlayerOrException();
        if (!Datapack.packLoaded(source.getServer())) {
            return fail(source, NOT_LOADED);
        }
        SettingsMenu.open(player);
        return 1;
    }

    private static int openCard(CommandSourceStack source) throws CommandSyntaxException {
        ServerPlayer player = source.getPlayerOrException();
        if (!Datapack.packLoaded(source.getServer())) {
            return fail(source, NOT_LOADED);
        }
        if (!CardMenu.open(player)) {
            return fail(source, NOT_IN_GAME);
        }
        return 1;
    }

    private static String startFailure(ServerPlayer player) {
        ServerPlayer setter = Datapack.settingUp(Datapack.server(player));
        return setter == null ? "A game is being set up" : Datapack.settingUpText(setter);
    }

    private static String leaveFailure(ServerPlayer player) {
        return Datapack.inGame(player) ? SettingsMenu.LEAVE_ONLY : NOT_IN_GAME;
    }

    private static int fire(CommandSourceStack source, String objective, Predicate<ServerPlayer> gate, String failure) throws CommandSyntaxException {
        return fire(source, objective, gate, player -> failure);
    }

    private static int fire(CommandSourceStack source, String objective, Predicate<ServerPlayer> gate, Function<ServerPlayer, String> failure) throws CommandSyntaxException {
        ServerPlayer player = source.getPlayerOrException();
        if (!Datapack.packLoaded(source.getServer())) {
            return fail(source, NOT_LOADED);
        }
        if (!gate.test(player)) {
            return fail(source, failure.apply(player));
        }
        TriggerQueue.enqueue(player, objective, gate);
        return 1;
    }

    private static int openLobby(CommandSourceStack source) throws CommandSyntaxException {
        ServerPlayer player = source.getPlayerOrException();
        if (!Datapack.packLoaded(source.getServer())) {
            return fail(source, NOT_LOADED);
        }
        if (!LobbyMenu.open(player)) {
            return fail(source, Lobby.closedReason(player));
        }
        return 1;
    }

    private static int ready(CommandSourceStack source) throws CommandSyntaxException {
        ServerPlayer player = source.getPlayerOrException();
        MinecraftServer server = source.getServer();
        if (!Datapack.packLoaded(server)) {
            return fail(source, NOT_LOADED);
        }
        String blocker = Lobby.readyBlocker(player);
        if (blocker != null) {
            return fail(source, blocker);
        }
        boolean ready = Lobby.toggleReady(player);
        String tally = " (" + Lobby.readyCount(server) + " of " + Datapack.gamePlayers(server).size() + ")";
        player.sendSystemMessage(Component.literal((ready ? READY_ON : READY_OFF) + tally).withColor(Lobby.TEXT_COLOR));
        TriggerQueue.markDirty(player);
        return 1;
    }

    private static int reset(CommandSourceStack source) {
        if (!Datapack.runReset(source.getServer())) {
            return fail(source, NOT_LOADED);
        }
        return 1;
    }
}
