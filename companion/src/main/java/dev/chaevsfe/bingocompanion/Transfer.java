package dev.chaevsfe.bingocompanion;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import net.fabricmc.loader.api.FabricLoader;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.network.chat.Component;
import net.minecraft.network.protocol.common.ClientboundTransferPacket;
import net.minecraft.server.level.ServerPlayer;

final class Transfer {
    static final String FILE = "bingo-companion.json";
    static final String BINGO = "bingo";
    static final String VANILLA = "vanilla";

    private Transfer() {
    }

    static int send(CommandSourceStack source, String key) {
        Target target;
        try {
            target = read(key);
        } catch (IllegalStateException e) {
            source.sendFailure(Component.literal(e.getMessage()));
            return 0;
        }
        List<ServerPlayer> players = List.copyOf(source.getServer().getPlayerList().getPlayers());
        if (players.isEmpty()) {
            source.sendFailure(Component.literal("No players online"));
            return 0;
        }
        source.sendSuccess(() -> Component.literal("Sending " + players.size() + " player(s) to " + target.host() + ":" + target.port()), true);
        for (ServerPlayer player : players) {
            player.connection.send(new ClientboundTransferPacket(target.host(), target.port()));
        }
        return players.size();
    }

    private static Target read(String key) {
        Path path = FabricLoader.getInstance().getConfigDir().resolve(FILE);
        JsonObject root;
        try {
            if (!Files.exists(path)) {
                Files.createDirectories(path.getParent());
                Files.writeString(path, defaults(), StandardCharsets.UTF_8);
            }
            root = JsonParser.parseString(Files.readString(path, StandardCharsets.UTF_8)).getAsJsonObject();
        } catch (IOException | RuntimeException e) {
            throw new IllegalStateException("config/" + FILE + " could not be read: " + e.getMessage());
        }
        if (!root.has(key) || !root.get(key).isJsonObject()) {
            throw new IllegalStateException("config/" + FILE + " has no \"" + key + "\" entry");
        }
        JsonObject entry = root.getAsJsonObject(key);
        String host = entry.has("host") ? entry.get("host").getAsString().trim() : "";
        int port = entry.has("port") ? entry.get("port").getAsInt() : 25565;
        if (host.isEmpty()) {
            throw new IllegalStateException("Set " + key + ".host in config/" + FILE);
        }
        if (port < 1 || port > 65535) {
            throw new IllegalStateException("Set " + key + ".port in config/" + FILE + " to 1-65535");
        }
        return new Target(host, port);
    }

    private static String defaults() {
        JsonObject root = new JsonObject();
        for (String key : new String[] {BINGO, VANILLA}) {
            JsonObject entry = new JsonObject();
            entry.addProperty("host", "");
            entry.addProperty("port", 25565);
            root.add(key, entry);
        }
        return new GsonBuilder().setPrettyPrinting().create().toJson(root) + "\n";
    }

    private record Target(String host, int port) {
    }
}
