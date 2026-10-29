package dev.chaevsfe.bingocompanion;

import java.util.ArrayList;
import java.util.List;
import net.minecraft.ChatFormatting;
import net.minecraft.core.component.DataComponents;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.item.component.CustomData;
import net.minecraft.world.item.component.ItemLore;
import net.minecraft.world.level.ItemLike;

final class Icons {
    static final int TEXT_COLOR = 0xffcc64;
    static final int BUTTON_COLOR = 0x8CF657;
    private static final String MARKER = "bingo_companion";

    private Icons() {
    }

    static Component line(String text) {
        return line(text, ChatFormatting.GRAY);
    }

    static Component line(String text, ChatFormatting color) {
        return Component.literal(text).withStyle(style -> style.withItalic(false).withColor(color));
    }

    static ItemStack button(ItemLike item, int count, Component name, List<Component> lore, boolean glint) {
        ItemStack stack = new ItemStack(item, count);
        stack.set(DataComponents.ITEM_NAME, name);
        if (!lore.isEmpty()) {
            stack.set(DataComponents.LORE, new ItemLore(lore));
        }
        if (glint) {
            stack.set(DataComponents.ENCHANTMENT_GLINT_OVERRIDE, true);
        }
        return mark(stack);
    }

    static ItemStack button(ItemLike item, int count, String name, boolean glint, String... lore) {
        List<Component> lines = new ArrayList<>(lore.length);
        for (String text : lore) {
            lines.add(line(text));
        }
        return button(item, count, Component.literal(name), lines, glint);
    }

    static ItemStack button(ItemLike item, String name, String... lore) {
        return button(item, 1, name, false, lore);
    }

    static ItemStack toggle(ItemLike item, String name, boolean on, String... lore) {
        return button(item, 1, name, on, lore);
    }

    static ItemStack disabled(String label, String reason) {
        return disabled(label, List.of(line(reason)));
    }

    static ItemStack disabled(String label, List<Component> lore) {
        return button(Items.STAINED_GLASS_PANE.gray(), 1, Component.literal(label).withStyle(ChatFormatting.GRAY), lore, false);
    }

    static Item teamWool(String team) {
        return switch (team) {
            case "red" -> Items.WOOL.red();
            case "dark_red" -> Items.NETHER_WART_BLOCK;
            case "yellow" -> Items.WOOL.yellow();
            case "gold" -> Items.WOOL.orange();
            case "aqua" -> Items.WOOL.lightBlue();
            case "green" -> Items.WOOL.lime();
            case "blue" -> Items.WOOL.blue();
            case "light_purple" -> Items.WOOL.magenta();
            default -> Items.WOOL.white();
        };
    }

    static ChatFormatting teamColor(String team) {
        return switch (team) {
            case "red" -> ChatFormatting.RED;
            case "dark_red" -> ChatFormatting.DARK_RED;
            case "yellow" -> ChatFormatting.YELLOW;
            case "gold" -> ChatFormatting.GOLD;
            case "aqua" -> ChatFormatting.AQUA;
            case "green" -> ChatFormatting.GREEN;
            case "blue" -> ChatFormatting.BLUE;
            case "light_purple" -> ChatFormatting.LIGHT_PURPLE;
            default -> ChatFormatting.WHITE;
        };
    }

    static String teamName(String team) {
        StringBuilder name = new StringBuilder();
        for (String word : team.split("_")) {
            if (!name.isEmpty()) {
                name.append(' ');
            }
            name.append(Character.toUpperCase(word.charAt(0))).append(word.substring(1));
        }
        return name.toString();
    }

    static ItemStack mark(ItemStack stack) {
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
