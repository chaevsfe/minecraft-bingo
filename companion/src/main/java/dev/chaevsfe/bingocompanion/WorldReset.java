package dev.chaevsfe.bingocompanion;

import com.mojang.logging.LogUtils;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Stream;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.world.level.storage.LevelResource;
import org.slf4j.Logger;

final class WorldReset {
    private static final Logger LOGGER = LogUtils.getLogger();
    private static final String MARKER = "bingo-reset-world";
    private static final List<String> WIPE = List.of("session.lock", "region", "entities", "poi", "DIM-1", "DIM1", "dimensions", "data", "players", "playerdata", "stats", "advancements", "generated", "level.dat_old", "level.dat");
    private static final String ARMED = "The world will be regenerated the next time the server stops. Run /bingo reset world again to cancel.";
    private static final String CANCELLED = "World regeneration cancelled.";
    private static final String DEDICATED_ONLY = "World regeneration only works on a dedicated server";

    private WorldReset() {
    }

    static int toggle(CommandSourceStack source) {
        if (!source.getServer().isDedicatedServer()) {
            source.sendFailure(Component.literal(DEDICATED_ONLY));
            return 0;
        }
        Path marker = marker(source.getServer());
        try {
            if (Files.deleteIfExists(marker)) {
                LOGGER.info(CANCELLED);
                source.sendSystemMessage(Component.literal(CANCELLED));
                return 1;
            }
            Files.createDirectories(marker.getParent());
            Files.writeString(marker, source.getTextName() + "\n");
        } catch (IOException e) {
            source.sendFailure(Component.literal("Could not write " + marker + ": " + e.getMessage()));
            return 0;
        }
        LOGGER.warn("{} armed a world regeneration ({})", source.getTextName(), marker);
        source.sendSystemMessage(Component.literal(ARMED));
        return 1;
    }

    static void stopped(MinecraftServer server) {
        Path root = server.getWorldPath(LevelResource.ROOT);
        Path marker = marker(server);
        if (!server.isDedicatedServer() || !Files.exists(marker)) {
            return;
        }
        LOGGER.warn("Regenerating the world: wiping {}", root);
        for (String name : WIPE) {
            if (!delete(root.resolve(name))) {
                LOGGER.error("World regeneration stopped at {}; the marker stays and the next stop retries", name);
                return;
            }
        }
        delete(marker);
        LOGGER.warn("World wiped, the next start generates a new one");
    }

    static void starting(MinecraftServer server) {
        Path marker = marker(server);
        if (Files.exists(marker)) {
            LOGGER.warn("Ignoring a world regeneration armed in an earlier run ({})", marker);
            delete(marker);
        }
    }

    private static Path marker(MinecraftServer server) {
        return server.getWorldPath(LevelResource.ROOT).resolve(MARKER);
    }

    private static boolean delete(Path path) {
        if (!Files.exists(path)) {
            return true;
        }
        try (Stream<Path> walk = Files.walk(path)) {
            for (Path entry : walk.sorted(Comparator.reverseOrder()).toList()) {
                Files.deleteIfExists(entry);
            }
            LOGGER.info("Deleted {}", path);
            return true;
        } catch (IOException | UncheckedIOException e) {
            LOGGER.error("Could not delete {}: {}", path, e.toString());
            return false;
        }
    }
}
