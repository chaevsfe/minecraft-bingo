package dev.chaevsfe.bingocompanion;

import com.google.gson.JsonObject;
import java.util.List;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.network.chat.Component;
import net.minecraft.network.protocol.common.ClientboundTransferPacket;
import net.minecraft.server.level.ServerPlayer;

final class Transfer {
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
        JsonObject root = Config.load();
        if (!root.has(key) || !root.get(key).isJsonObject()) {
            throw new IllegalStateException("config/" + Config.FILE + " has no \"" + key + "\" entry");
        }
        JsonObject entry = root.getAsJsonObject(key);
        String host = entry.has("host") ? entry.get("host").getAsString().trim() : "";
        int port = entry.has("port") ? entry.get("port").getAsInt() : 25565;
        if (host.isEmpty()) {
            throw new IllegalStateException("Set " + key + ".host in config/" + Config.FILE);
        }
        if (port < 1 || port > 65535) {
            throw new IllegalStateException("Set " + key + ".port in config/" + Config.FILE + " to 1-65535");
        }
        return new Target(host, port);
    }

    private record Target(String host, int port) {
    }
}
