package dev.chaevsfe.bingocompanion;

import com.mojang.logging.LogUtils;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.SimpleContainer;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.inventory.ChestMenu;
import net.minecraft.world.inventory.ContainerInput;
import net.minecraft.world.inventory.MenuType;
import net.minecraft.world.inventory.Slot;
import net.minecraft.world.item.ItemStack;
import org.slf4j.Logger;

abstract class LockedMenu extends ChestMenu {
    private static final Logger LOGGER = LogUtils.getLogger();

    protected final ServerPlayer owner;
    private final SimpleContainer box;
    private final int size;

    protected LockedMenu(MenuType<?> type, int id, Inventory inventory, ServerPlayer owner, int rows) {
        this(type, id, inventory, owner, rows, new SimpleContainer(rows * 9));
    }

    private LockedMenu(MenuType<?> type, int id, Inventory inventory, ServerPlayer owner, int rows, SimpleContainer box) {
        super(type, id, inventory, box, rows);
        this.owner = owner;
        this.box = box;
        this.size = rows * 9;
    }

    protected abstract void draw();

    protected abstract void onButton(int slot, int button);

    protected final MinecraftServer server() {
        return Datapack.server(owner);
    }

    protected final void put(int slot, ItemStack stack) {
        if (!ItemStack.matches(box.getItem(slot), stack)) {
            box.setItem(slot, stack);
        }
    }

    protected final void deny(String text) {
        Datapack.tell(owner, text);
    }

    final void refresh() {
        draw();
        broadcastChanges();
    }

    @Override
    public void clicked(int slot, int button, ContainerInput input, Player player) {
        if (input == ContainerInput.PICKUP && (button == 0 || button == 1) && slot >= 0 && slot < size && player == owner) {
            onButton(slot, button);
        }
    }

    @Override
    public ItemStack quickMoveStack(Player player, int slot) {
        return ItemStack.EMPTY;
    }

    @Override
    public boolean canTakeItemForPickAll(ItemStack stack, Slot slot) {
        return false;
    }

    @Override
    public boolean canDragTo(Slot slot) {
        return false;
    }

    @Override
    public boolean stillValid(Player player) {
        return true;
    }

    @Override
    public void removed(Player player) {
        if (Icons.isMarked(getCarried())) {
            LOGGER.warn("Discarded a Bingo Companion menu item carried by {}", player.getScoreboardName());
            setCarried(ItemStack.EMPTY);
        }
        super.removed(player);
        box.clearContent();
        Inventory inventory = player.getInventory();
        for (int i = 0; i < inventory.getContainerSize(); i++) {
            if (Icons.isMarked(inventory.getItem(i))) {
                LOGGER.warn("Removed a leaked Bingo Companion menu item from {}", player.getScoreboardName());
                inventory.setItem(i, ItemStack.EMPTY);
            }
        }
    }
}
