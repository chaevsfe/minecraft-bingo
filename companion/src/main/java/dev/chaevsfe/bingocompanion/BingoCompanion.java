package dev.chaevsfe.bingocompanion;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;

public final class BingoCompanion implements ModInitializer {
    @Override
    public void onInitialize() {
        CommandRegistrationCallback.EVENT.register(BingoCommands::register);
        ServerTickEvents.START_SERVER_TICK.register(Guards::startTick);
        ServerTickEvents.START_SERVER_TICK.register(TriggerQueue::startTick);
        ServerTickEvents.START_SERVER_TICK.register(Lobby::startTick);
        ServerTickEvents.END_SERVER_TICK.register(TriggerQueue::endTick);
        ServerTickEvents.END_SERVER_TICK.register(Lobby::endTick);
    }
}
