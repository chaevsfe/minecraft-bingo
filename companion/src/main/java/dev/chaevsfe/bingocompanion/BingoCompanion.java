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
        ServerTickEvents.START_SERVER_TICK.register(LobbyItem::startTick);
        LobbyItem.register();
        ServerTickEvents.END_SERVER_TICK.register(TriggerQueue::endTick);
        ServerTickEvents.END_SERVER_TICK.register(Lobby::endTick);
        ServerTickEvents.END_SERVER_TICK.register(StartMenu::endTick);
        ServerTickEvents.END_SERVER_TICK.register(Run::endTick);
        ServerTickEvents.END_SERVER_TICK.register(Links::endTick);
        ServerLifecycleEvents.SERVER_STARTED.register(Run::started);
        ServerLifecycleEvents.SERVER_STARTED.register(Links::started);
        ServerLifecycleEvents.SERVER_STOPPED.register(StartMenu::clear);
        ServerLifecycleEvents.SERVER_STOPPED.register(Lobby::clear);
        ServerLifecycleEvents.SERVER_STOPPED.register(LobbyItem::clear);
        ServerLifecycleEvents.SERVER_STOPPING.register(TeamInventory::save);
        ServerLifecycleEvents.BEFORE_SAVE.register((server, flush, force) -> TeamInventory.save(server));
        ServerLifecycleEvents.SERVER_STOPPED.register(Run::clear);
        ServerLifecycleEvents.SERVER_STOPPED.register(Links::clear);
        ServerLifecycleEvents.SERVER_STOPPED.register(WorldReset::stopped);
        ServerLifecycleEvents.SERVER_STARTING.register(WorldReset::starting);
    }
}
