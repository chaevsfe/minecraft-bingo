package dev.chaevsfe.bingocompanion;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.Commands;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;

final class BingoCommands {
    private static final String NOT_LOADED = "Bingo datapack is not loaded";
    private static final String NOT_IN_GAME = "You are not in a Bingo game";

    private BingoCommands() {
    }

    static void register(CommandDispatcher<CommandSourceStack> dispatcher, Config.Role role) {
        if (role == Config.Role.VANILLA) {
            dispatcher.register(Commands.literal("bingo")
                    .then(Commands.literal("send")
                            .requires(Commands.hasPermission(Commands.LEVEL_ADMINS))
                            .executes(c -> Transfer.send(c.getSource(), Transfer.BINGO))));
            return;
        }
        dispatcher.register(Commands.literal("bingo")
                .executes(c -> openSettings(c.getSource()))
                .then(Commands.literal("settings")
                        .executes(c -> openSettings(c.getSource())))
                .then(Commands.literal("card")
                        .executes(c -> openCard(c.getSource())))
                .then(Commands.literal("start")
                        .executes(c -> start(c.getSource())))
                .then(Commands.literal("join")
                        .executes(c -> openLobby(c.getSource())))
                .then(Commands.literal("reset")
                        .requires(Commands.hasPermission(Commands.LEVEL_GAMEMASTERS))
                        .executes(c -> reset(c.getSource())))
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

    private static int start(CommandSourceStack source) throws CommandSyntaxException {
        ServerPlayer player = source.getPlayerOrException();
        MinecraftServer server = source.getServer();
        if (!Datapack.packLoaded(server)) {
            return fail(source, NOT_LOADED);
        }
        if (Datapack.running(server)) {
            TriggerQueue.enqueue(player, Datapack.START, Datapack::gameRunning);
            return 1;
        }
        ServerPlayer setter = Datapack.settingUp(server);
        if (setter != null) {
            return fail(source, Datapack.settingUpText(setter));
        }
        StartMenu.open(player);
        return 1;
    }

    private static int openLobby(CommandSourceStack source) throws CommandSyntaxException {
        ServerPlayer player = source.getPlayerOrException();
        if (!Datapack.packLoaded(source.getServer())) {
            return fail(source, NOT_LOADED);
        }
        if (!LobbyMenu.open(player, LobbyMenu.Page.TEAMS)) {
            return fail(source, Lobby.closedReason(player));
        }
        return 1;
    }

    private static int reset(CommandSourceStack source) {
        if (!Datapack.runReset(source.getServer())) {
            return fail(source, NOT_LOADED);
        }
        return 1;
    }
}
