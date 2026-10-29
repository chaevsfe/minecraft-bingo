package dev.chaevsfe.bingocompanion;

import net.minecraft.network.chat.ClickEvent;
import net.minecraft.network.chat.Component;
import net.minecraft.network.chat.HoverEvent;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;

final class Hint {
    private static final String USE = "Use ";
    private static final String OR = " or ";
    private static final String SETTINGS_COMMAND = "/bingo settings";
    private static final String CARD_COMMAND = "/bingo card";
    private static final String SETTINGS_HOVER = "Open the Bingo settings";
    private static final String CARD_HOVER = "Show your Bingo card";

    private Hint() {
    }

    static void dealt(MinecraftServer server) {
        Component hint = hint();
        for (ServerPlayer player : Datapack.gamePlayers(server)) {
            player.sendSystemMessage(hint);
        }
    }

    static Component hint() {
        return Component.literal(USE).withColor(Icons.TEXT_COLOR)
                .append(command(SETTINGS_COMMAND, SETTINGS_HOVER))
                .append(Component.literal(OR).withColor(Icons.TEXT_COLOR))
                .append(command(CARD_COMMAND, CARD_HOVER));
    }

    private static Component command(String command, String hover) {
        return Component.literal(command).withStyle(style -> style.withColor(Icons.BUTTON_COLOR)
                .withClickEvent(new ClickEvent.RunCommand(command))
                .withHoverEvent(new HoverEvent.ShowText(Component.literal(hover))));
    }
}
