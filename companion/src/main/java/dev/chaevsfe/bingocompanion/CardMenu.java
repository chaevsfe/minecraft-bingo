package dev.chaevsfe.bingocompanion;

import java.util.List;
import net.minecraft.ChatFormatting;
import net.minecraft.core.component.DataComponents;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.nbt.ListTag;
import net.minecraft.network.chat.Component;
import net.minecraft.network.protocol.game.ClientboundSoundPacket;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.world.SimpleMenuProvider;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.inventory.MenuType;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.item.alchemy.PotionContents;
import net.minecraft.world.item.alchemy.Potions;
import net.minecraft.world.item.component.ChargedProjectiles;
import net.minecraft.world.item.component.ItemLore;

final class CardMenu extends LockedMenu {
    private static final String TITLE = "Bingo Card";
    private static final String RESULT_KEY = "bingo.list.check.result";
    private static final String RESULT_FALLBACK = "This is ";
    private static final int SLOTS = 54;
    private static final int TEAM = 49;

    private CardMenu(int id, Inventory inventory, ServerPlayer owner) {
        super(MenuType.GENERIC_9x6, id, inventory, owner, 6);
        draw();
    }

    static boolean open(ServerPlayer player) {
        if (!Datapack.inGame(player)) {
            return false;
        }
        player.openMenu(new SimpleMenuProvider((id, inventory, p) -> new CardMenu(id, inventory, (ServerPlayer) p), Component.literal(TITLE)));
        return true;
    }

    private static int cellAt(int slot) {
        int row = slot / 9;
        int column = slot % 9 - 2;
        if (row > 4 || column < 0 || column > 4) {
            return 0;
        }
        return 5 * row + column + 1;
    }

    @Override
    protected void draw() {
        MinecraftServer server = server();
        String team = Datapack.team(owner);
        ListTag collected = Datapack.collected(server, team);
        for (int slot = 0; slot < SLOTS; slot++) {
            int cell = cellAt(slot);
            if (cell > 0) {
                put(slot, cell(server, cell, collected));
            } else if (slot == TEAM && team != null) {
                put(slot, teamBadge(team, collected.size()));
            } else {
                put(slot, ItemStack.EMPTY);
            }
        }
    }

    @Override
    protected void onButton(int slot, int button) {
        int cell = cellAt(slot);
        if (cell == 0) {
            if (slot == TEAM) {
                TriggerQueue.navigate(owner, TriggerQueue.Nav.SETTINGS);
            }
            return;
        }
        if (!Datapack.inGame(owner)) {
            deny(SettingsMenu.GAME_ONLY);
        } else if (!Datapack.nameCheck(owner, cell)) {
            deny("Not dealt yet");
        } else {
            String key = Datapack.translationKey(server(), cell);
            Component name = key.isEmpty() ? Component.literal(Datapack.objectId(server(), cell)) : Component.translatable(key);
            owner.sendSystemMessage(Component.translatableWithFallback(RESULT_KEY, RESULT_FALLBACK).withColor(Icons.TEXT_COLOR).append(name.copy().withColor(Icons.TEXT_COLOR)));
            owner.connection.send(new ClientboundSoundPacket(SoundEvents.UI_BUTTON_CLICK, SoundSource.MASTER, owner.getX(), owner.getY(), owner.getZ(), 1.0F, 1.0F, owner.getRandom().nextLong()));
        }
    }

    private static ItemStack cell(MinecraftServer server, int cell, ListTag collected) {
        String object = Datapack.objectId(server, cell);
        if (object.isEmpty()) {
            return Icons.button(Items.STAINED_GLASS_PANE.lightGray(), "Not dealt yet", "Card #" + cell);
        }
        ItemStack stack = objectStack(object, Datapack.translationKey(server, cell));
        boolean done = Datapack.contains(collected, object);
        stack.set(DataComponents.LORE, new ItemLore(List.of(
                Icons.line("Card #" + cell),
                done ? Icons.line("Collected by your team", ChatFormatting.GREEN) : Icons.line("Not collected yet"))));
        if (done) {
            stack.set(DataComponents.ENCHANTMENT_GLINT_OVERRIDE, true);
        }
        return Icons.mark(stack);
    }

    private static ItemStack objectStack(String object, String key) {
        switch (object) {
            case "crossbow_arrow":
                return charged(Items.ARROW);
            case "crossbow_firework":
                return charged(Items.FIREWORK_ROCKET);
            case "potion_water": {
                ItemStack potion = new ItemStack(Items.POTION);
                potion.set(DataComponents.POTION_CONTENTS, new PotionContents(Potions.WATER));
                return potion;
            }
            case "scute":
                return new ItemStack(Items.TURTLE_SCUTE);
            default:
                break;
        }
        Identifier id = Identifier.tryBuild("minecraft", object);
        Item item = id == null ? null : BuiltInRegistries.ITEM.getOptional(id).filter(found -> found != Items.AIR).orElse(null);
        if (item != null) {
            return new ItemStack(item);
        }
        ItemStack paper = new ItemStack(Items.PAPER);
        paper.set(DataComponents.ITEM_NAME, key.isEmpty() ? Component.literal(object) : Component.translatable(key));
        return paper;
    }

    private static ItemStack charged(Item projectile) {
        ItemStack crossbow = new ItemStack(Items.CROSSBOW);
        crossbow.set(DataComponents.CHARGED_PROJECTILES, ChargedProjectiles.ofNonEmpty(List.of(new ItemStack(projectile))));
        return crossbow;
    }

    private static ItemStack teamBadge(String team, int collected) {
        ChatFormatting color = Icons.teamColor(team);
        Component name = Component.literal("Team: " + Icons.teamName(team)).withStyle(style -> style.withItalic(false).withColor(color));
        return Icons.button(Icons.teamWool(team), 1, name, List.of(Icons.line("Collected " + collected + " / 25")), false);
    }
}
