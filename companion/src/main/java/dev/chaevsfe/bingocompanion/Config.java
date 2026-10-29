package dev.chaevsfe.bingocompanion;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mojang.logging.LogUtils;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import net.fabricmc.loader.api.FabricLoader;
import org.slf4j.Logger;

final class Config {
    enum Role {
        BINGO,
        VANILLA
    }

    static final String FILE = "bingo-companion.json";
    private static final Logger LOGGER = LogUtils.getLogger();
    private static final String ROLE = "role";

    private Config() {
    }

    static JsonObject load() {
        Path path = FabricLoader.getInstance().getConfigDir().resolve(FILE);
        try {
            if (!Files.exists(path)) {
                Files.createDirectories(path.getParent());
                Files.writeString(path, defaults(), StandardCharsets.UTF_8);
            }
            return JsonParser.parseString(Files.readString(path, StandardCharsets.UTF_8)).getAsJsonObject();
        } catch (IOException | RuntimeException e) {
            throw new IllegalStateException("config/" + FILE + " could not be read: " + e.getMessage());
        }
    }

    static Role role() {
        JsonObject root;
        try {
            root = load();
        } catch (IllegalStateException e) {
            LOGGER.warn("{}; using role bingo", e.getMessage());
            return Role.BINGO;
        }
        JsonElement element = root.get(ROLE);
        if (element == null || element.isJsonNull()) {
            return Role.BINGO;
        }
        String value = element.isJsonPrimitive() ? element.getAsString().trim() : element.toString();
        if (value.equalsIgnoreCase(Transfer.BINGO)) {
            return Role.BINGO;
        }
        if (value.equalsIgnoreCase(Transfer.VANILLA)) {
            return Role.VANILLA;
        }
        LOGGER.warn("config/{}: unknown role {}, using bingo", FILE, value);
        return Role.BINGO;
    }

    private static String defaults() {
        JsonObject root = new JsonObject();
        root.addProperty(ROLE, Transfer.BINGO);
        for (String key : new String[] {Transfer.BINGO, Transfer.VANILLA}) {
            JsonObject entry = new JsonObject();
            entry.addProperty("host", "");
            entry.addProperty("port", Transfer.DEFAULT_PORT);
            root.add(key, entry);
        }
        root.addProperty("wake_timeout", Transfer.DEFAULT_TIMEOUT);
        return new GsonBuilder().setPrettyPrinting().create().toJson(root) + "\n";
    }
}
