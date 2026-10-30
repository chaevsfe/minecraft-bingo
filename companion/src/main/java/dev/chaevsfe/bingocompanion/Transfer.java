package dev.chaevsfe.bingocompanion;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.mojang.brigadier.StringReader;
import com.mojang.brigadier.exceptions.CommandSyntaxException;
import com.mojang.brigadier.exceptions.DynamicCommandExceptionType;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.arguments.selector.EntitySelector;
import net.minecraft.commands.arguments.selector.EntitySelectorParser;
import net.minecraft.network.chat.Component;
import net.minecraft.server.level.ServerPlayer;

final class Transfer {
    static final String BINGO = "bingo";
    static final String VANILLA = "vanilla";
    static final int DEFAULT_PORT = 25565;
    private static final String TIMEOUT = "wake_timeout";
    static final int DEFAULT_TIMEOUT = 180;
    static final List<String> SELECTORS = List.of("@a", "@s");
    private static final DynamicCommandExceptionType NO_SUCH_PLAYER = new DynamicCommandExceptionType(name -> Component.literal("No player named " + name + " is online"));
    private static final DynamicCommandExceptionType SELECTOR_NOT_ALLOWED = new DynamicCommandExceptionType(token -> Component.literal("Use @a, @s or player names, not " + token));

    private Transfer() {
    }

    static int send(CommandSourceStack source, String key, String selection) throws CommandSyntaxException {
        Target target;
        int timeout;
        try {
            JsonObject root = Config.load();
            target = read(root, key);
            timeout = root.has(TIMEOUT) ? number(root.get(TIMEOUT), "Set " + TIMEOUT + " in config/" + Config.FILE + " to a number of seconds") : DEFAULT_TIMEOUT;
        } catch (IllegalStateException e) {
            source.sendFailure(Component.literal(e.getMessage()));
            return 0;
        }
        Set<UUID> players = selection == null ? Set.of(source.getPlayerOrException().getUUID()) : select(source, selection);
        if (players.isEmpty()) {
            source.sendFailure(Component.literal("No players matched"));
            return 0;
        }
        Wake.start(source, key.equals(BINGO) ? "the Bingo server" : "the main server", target, players, timeout);
        return 1;
    }

    private static Set<UUID> select(CommandSourceStack source, String text) throws CommandSyntaxException {
        Set<UUID> out = new LinkedHashSet<>();
        for (String token : tokens(text)) {
            if (token.startsWith("@") && SELECTORS.stream().noneMatch(allowed -> token.equals(allowed) || token.startsWith(allowed + "["))) {
                throw SELECTOR_NOT_ALLOWED.create(token);
            }
            StringReader reader = new StringReader(token);
            EntitySelector selector = new EntitySelectorParser(reader, true).parse();
            if (reader.canRead()) {
                throw CommandSyntaxException.BUILT_IN_EXCEPTIONS.dispatcherUnknownArgument().createWithContext(reader);
            }
            List<ServerPlayer> found = selector.findPlayers(source);
            if (found.isEmpty() && !token.startsWith("@")) {
                throw NO_SUCH_PLAYER.create(token);
            }
            for (ServerPlayer player : found) {
                out.add(player.getUUID());
            }
        }
        return out;
    }

    static List<String> tokens(String text) {
        List<String> out = new ArrayList<>();
        StringBuilder current = new StringBuilder();
        int depth = 0;
        for (char c : text.toCharArray()) {
            if (c == '[') {
                depth++;
            } else if (c == ']' && depth > 0) {
                depth--;
            }
            if (depth == 0 && (c == ',' || Character.isWhitespace(c))) {
                if (!current.isEmpty()) {
                    out.add(current.toString());
                    current.setLength(0);
                }
                continue;
            }
            current.append(c);
        }
        if (!current.isEmpty()) {
            out.add(current.toString());
        }
        return out;
    }

    private static Target read(JsonObject root, String key) {
        if (!root.has(key) || !root.get(key).isJsonObject()) {
            throw new IllegalStateException("config/" + Config.FILE + " has no \"" + key + "\" entry");
        }
        JsonObject entry = root.getAsJsonObject(key);
        String range = "Set " + key + ".port in config/" + Config.FILE + " to 1-65535";
        String host = entry.has("host") && entry.get("host").isJsonPrimitive() ? entry.get("host").getAsString().trim() : "";
        int port = entry.has("port") ? number(entry.get("port"), range) : DEFAULT_PORT;
        if (host.isEmpty()) {
            throw new IllegalStateException("Set " + key + ".host in config/" + Config.FILE);
        }
        if (port < 1 || port > 65535) {
            throw new IllegalStateException(range);
        }
        return new Target(host, port);
    }

    private static int number(JsonElement element, String message) {
        if (!element.isJsonPrimitive() || !element.getAsJsonPrimitive().isNumber()) {
            throw new IllegalStateException(message);
        }
        return (int) element.getAsDouble();
    }

    record Target(String host, int port) {
    }
}
