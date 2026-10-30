package dev.chaevsfe.bingocompanion;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import net.fabricmc.fabric.api.event.player.UseBlockCallback;
import net.fabricmc.fabric.api.event.player.UseItemCallback;
import net.minecraft.ChatFormatting;
import net.minecraft.core.component.DataComponents;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.util.Prediction;
import net.minecraft.world.InteractionHand;
import net.minecraft.world.InteractionResult;
import net.minecraft.world.entity.item.ItemEntity;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.inventory.CraftingContainer;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.item.component.CustomData;
import net.minecraft.world.item.component.ItemLore;
import net.minecraft.world.level.entity.EntityTypeTest;

final class LobbyItem {
    private static final String MARKER = "bingo_lobby";
    private static final String NAME = "Bingo Lobby";
    private static final String HINT = "Right-click to open the lobby";
    private static final int SLOT = 8;
    private static final int DEBOUNCE_TICKS = 2;
    private static final int RESYNC_DELAY = 5;
    private static final Map<UUID, Integer> OPENED = new HashMap<>();
    private static boolean active;
    private static int resyncAt = -1;

    private LobbyItem() {
    }

    static void register() {
        UseItemCallback.EVENT.register((player, level, hand) -> use(player, hand));
        UseBlockCallback.EVENT.register((player, level, hand, hit) -> use(player, hand));
    }

    private static InteractionResult use(Player player, InteractionHand hand) {
        if (!(player instanceof ServerPlayer serverPlayer) || !isMarked(player.getItemInHand(hand))) {
            return InteractionResult.PASS;
        }
        MinecraftServer server = Datapack.server(serverPlayer);
        int now = server.getTickCount();
        Integer last = OPENED.get(serverPlayer.getUUID());
        if (last == null || now - last > DEBOUNCE_TICKS) {
            OPENED.put(serverPlayer.getUUID(), now);
            if (!LobbyMenu.open(serverPlayer, LobbyMenu.lastPage(serverPlayer))) {
                Datapack.tell(serverPlayer, Lobby.closedReason(serverPlayer));
            }
        }
        return InteractionResult.FAIL;
    }

    static void startTick(MinecraftServer server) {
        if (!Datapack.packLoaded(server)) {
            return;
        }
        boolean open = Datapack.lobby(server) && !Datapack.dealt(server);
        List<ServerPlayer> players = server.getPlayerList().getPlayers();
        if (open && !active) {
            active = true;
            for (ServerPlayer player : players) {
                player.getInventory().clearContent();
                player.containerMenu.setCarried(ItemStack.EMPTY);
                player.inventoryMenu.sendAllDataToRemote();
            }
        }
        if (open) {
            for (ServerPlayer player : players) {
                place(player);
            }
            sweep(server);
            return;
        }
        if (active) {
            active = false;
            sweep(server);
            resyncAt = server.getTickCount() + RESYNC_DELAY;
        }
        for (ServerPlayer player : players) {
            remove(player);
        }
        if (resyncAt >= 0 && server.getTickCount() >= resyncAt) {
            resyncAt = -1;
            for (ServerPlayer player : players) {
                player.inventoryMenu.sendAllDataToRemote();
            }
        }
    }

    static void clear(MinecraftServer server) {
        active = false;
        resyncAt = -1;
        OPENED.clear();
    }

    private static void place(ServerPlayer player) {
        Inventory inventory = player.getInventory();
        strip(player, SLOT);
        if (isMarked(inventory.getItem(SLOT))) {
            return;
        }
        ItemStack displaced = inventory.getItem(SLOT);
        inventory.setItem(SLOT, stack());
        if (!displaced.isEmpty()) {
            inventory.placeItemBackInInventory(displaced, Prediction.SERVER_ONLY);
        }
    }

    private static void remove(ServerPlayer player) {
        strip(player, -1);
    }

    private static void strip(ServerPlayer player, int keep) {
        Inventory inventory = player.getInventory();
        for (int i = 0; i < inventory.getContainerSize(); i++) {
            if (i != keep && isMarked(inventory.getItem(i))) {
                inventory.setItem(i, ItemStack.EMPTY);
            }
        }
        if (isMarked(player.containerMenu.getCarried())) {
            player.containerMenu.setCarried(ItemStack.EMPTY);
        }
        CraftingContainer grid = player.inventoryMenu.getCraftSlots();
        for (int i = 0; i < grid.getContainerSize(); i++) {
            if (isMarked(grid.getItem(i))) {
                grid.setItem(i, ItemStack.EMPTY);
            }
        }
    }

    private static void sweep(MinecraftServer server) {
        for (ServerLevel level : server.getAllLevels()) {
            for (ItemEntity entity : level.getEntities(EntityTypeTest.forClass(ItemEntity.class), item -> isMarked(item.getItem()))) {
                entity.discard();
            }
        }
    }

    private static ItemStack stack() {
        ItemStack stack = new ItemStack(Items.KNOWLEDGE_BOOK);
        stack.set(DataComponents.ITEM_MODEL, Identifier.withDefaultNamespace("nether_star"));
        stack.set(DataComponents.MAX_STACK_SIZE, 1);
        stack.set(DataComponents.ITEM_NAME, Component.literal(NAME).withStyle(style -> style.withItalic(false).withColor(Icons.TEXT_COLOR)));
        stack.set(DataComponents.LORE, new ItemLore(List.of(Icons.line(HINT, ChatFormatting.GRAY))));
        stack.set(DataComponents.ENCHANTMENT_GLINT_OVERRIDE, true);
        CompoundTag tag = new CompoundTag();
        tag.putBoolean(MARKER, true);
        stack.set(DataComponents.CUSTOM_DATA, CustomData.of(tag));
        return stack;
    }

    static boolean isMarked(ItemStack stack) {
        if (stack.isEmpty()) {
            return false;
        }
        CustomData data = stack.get(DataComponents.CUSTOM_DATA);
        return data != null && data.copyTag().getBooleanOr(MARKER, false);
    }
}
