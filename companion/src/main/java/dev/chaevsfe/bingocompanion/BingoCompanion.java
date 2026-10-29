package dev.chaevsfe.bingocompanion;

import com.mojang.logging.LogUtils;
import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import org.slf4j.Logger;

public final class BingoCompanion implements ModInitializer {
    private static final Logger LOGGER = LogUtils.getLogger();

    @Override
    public void onInitialize() {
        Config.Role role = Config.role();
        LOGGER.info("Bingo Companion role: {}", role.name().toLowerCase());
        CommandRegistrationCallback.EVENT.register((dispatcher, context, selection) -> BingoCommands.register(dispatcher, role));
        ServerLifecycleEvents.SERVER_STOPPING.register(Wake::cancel);
        ServerTickEvents.END_SERVER_TICK.register(Wake::tick);
        if (role != Config.Role.BINGO) {
            return;
        }
        ServerTickEvents.START_SERVER_TICK.register(Guards::startTick);
        ServerTickEvents.START_SERVER_TICK.register(TriggerQueue::startTick);
        ServerTickEvents.START_SERVER_TICK.register(Lobby::startTick);
        ServerTickEvents.END_SERVER_TICK.register(TriggerQueue::endTick);
        ServerTickEvents.END_SERVER_TICK.register(Lobby::endTick);
        ServerTickEvents.END_SERVER_TICK.register(StartMenu::endTick);
        ServerLifecycleEvents.SERVER_STOPPED.register(StartMenu::clear);
        ServerLifecycleEvents.SERVER_STOPPED.register(Lobby::clear);
    }
}
