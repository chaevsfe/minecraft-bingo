package dev.chaevsfe.bingocompanion;

import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.MenuProvider;

final class Menus {
    private Menus() {
    }

    static void open(ServerPlayer player, MenuProvider provider) {
        if (player.containerMenu != player.inventoryMenu) {
            player.doCloseContainer();
        }
        player.openMenu(provider);
    }
}
