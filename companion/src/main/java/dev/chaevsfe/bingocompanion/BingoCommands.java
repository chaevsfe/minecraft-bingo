package dev.chaevsfe.bingocompanion;

import com.mojang.brigadier.CommandDispatcher;
import com.mojang.brigadier.StringReader;
import com.mojang.brigadier.arguments.StringArgumentType;
import com.mojang.brigadier.builder.LiteralArgumentBuilder;
import com.mojang.brigadier.context.CommandContext;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import com.mojang.brigadier.suggestion.Suggestions;
import com.mojang.brigadier.suggestion.SuggestionsBuilder;
import java.util.concurrent.CompletableFuture;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.Commands;
import net.minecraft.commands.SharedSuggestionProvider;
import net.minecraft.commands.arguments.selector.EntitySelectorParser;
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
                    .then(transfer("send", Transfer.BINGO)));
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
                .then(transfer("return", Transfer.VANILLA)));
    }

    private static LiteralArgumentBuilder<CommandSourceStack> transfer(String name, String key) {
        return Commands.literal(name)
                .requires(Commands.hasPermission(Commands.LEVEL_ADMINS))
                .executes(c -> Transfer.send(c.getSource(), key, null))
                .then(Commands.argument("players", StringArgumentType.greedyString())
                        .suggests(BingoCommands::suggestPlayers)
                        .executes(c -> Transfer.send(c.getSource(), key, StringArgumentType.getString(c, "players"))));
    }

    private static CompletableFuture<Suggestions> suggestPlayers(CommandContext<CommandSourceStack> context, SuggestionsBuilder builder) {
        String remaining = builder.getRemaining();
        int cut = 0;
        int depth = 0;
        for (int i = 0; i < remaining.length(); i++) {
            char c = remaining.charAt(i);
            if (c == '[') {
                depth++;
            } else if (c == ']' && depth > 0) {
                depth--;
            } else if (depth == 0 && (c == ',' || Character.isWhitespace(c))) {
                cut = i + 1;
            }
        }
        StringReader reader = new StringReader(builder.getInput());
        reader.setCursor(builder.getStart() + cut);
        EntitySelectorParser parser = new EntitySelectorParser(reader, true);
        try {
            parser.parse();
        } catch (CommandSyntaxException ignored) {
        }
        return parser.fillSuggestions(builder.createOffset(builder.getStart() + cut), b -> SharedSuggestionProvider.suggest(context.getSource().getOnlinePlayerNames(), b));
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
