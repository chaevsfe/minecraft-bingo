package dev.chaevsfe.bingocompanion;

import java.util.Arrays;
import java.util.OptionalInt;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.SimpleMenuProvider;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.inventory.MenuType;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.level.ItemLike;

final class SettingsMenu extends LockedMenu {
    static final String GAME_ONLY = "Available while you are in a running Bingo game";
    static final String LEAVE_ONLY = "Available once the game has begun";
    private static final String TITLE = "Bingo Settings";
    private static final String TIME_LABEL = "Game time";
    private static final String IDENTIFY_LABEL = "Identify an item";
    private static final String RULES_LABEL = "Rules";
    private static final String CHAT_SETTINGS_LABEL = "Settings in chat";
    private static final String JOIN_LABEL = "Join game";
    private static final String LEAVE_LABEL = "Leave game";
    private static final String CLEAR_LABEL = "Clear settings";
    private static final int SLOTS = 27;
    private static final int DEFAULT_SIZE = 16;
    private static final int HIDDEN = 2;
    private static final int IDENTIFY = 7;
    private static final int RULES = 8;
    private static final int JOIN_LEAVE = 16;
    private static final int CLEAR = 17;
    private static final int TIME = 25;
    private static final int CHAT_SETTINGS = 26;

    private boolean leaveMode;

    private SettingsMenu(int id, Inventory inventory, ServerPlayer owner) {
        super(MenuType.GENERIC_9x3, id, inventory, owner, 3);
        draw();
    }

    static void open(ServerPlayer player) {
        player.addTag(Datapack.TAG_TRAINING);
        player.openMenu(new SimpleMenuProvider((id, inventory, p) -> new SettingsMenu(id, inventory, (ServerPlayer) p), Component.literal(TITLE)));
    }

    @Override
    protected void draw() {
        if (leaveMode && !Datapack.canLeave(owner)) {
            leaveMode = false;
        }
        if (leaveMode) {
            drawLeave();
        } else {
            drawMain();
        }
    }

    private void drawMain() {
        MinecraftServer server = server();
        boolean enabled = Datapack.settingsOpen(owner);
        int vertical = Datapack.score(owner, Datapack.VERTICAL).orElse(0);
        int space = Datapack.score(owner, Datapack.SPACE).orElse(0);
        int size = Datapack.score(owner, Datapack.ICON_SIZE).orElse(DEFAULT_SIZE);
        boolean shown = timeShown();
        ItemStack[] stacks = new ItemStack[SLOTS];
        Arrays.fill(stacks, ItemStack.EMPTY);

        stacks[0] = reset(enabled, "Reset vertical", signed(vertical) + " px", "Back to 0", "Range -30 to +10", "Positive = up");
        stacks[1] = control(enabled, Items.DYE.lime(), 10, "Up 10", nowVertical(vertical));
        stacks[2] = control(enabled, Items.DYE.lime(), 1, "Up 1", nowVertical(vertical));
        stacks[3] = control(enabled, Items.DYE.red(), 1, "Down 1", nowVertical(vertical));
        stacks[4] = control(enabled, Items.DYE.red(), 10, "Down 10", nowVertical(vertical));
        stacks[IDENTIFY] = Datapack.inGame(owner)
                ? Icons.button(Items.SPYGLASS, IDENTIFY_LABEL, "Shows your Bingo card with real item names")
                : Icons.disabled(IDENTIFY_LABEL, GAME_ONLY);
        stacks[RULES] = Icons.button(Items.BOOK, RULES_LABEL, "Prints the rules in chat");

        stacks[9] = reset(enabled, "Reset horizontal", horizontal(space), "Back to centre (0)", "Positive = right");
        stacks[10] = control(enabled, Items.DYE.lightBlue(), 10, "Left 10", nowHorizontal(space));
        stacks[11] = control(enabled, Items.DYE.lightBlue(), 1, "Left 1", nowHorizontal(space));
        stacks[12] = control(enabled, Items.DYE.orange(), 1, "Right 1", nowHorizontal(space));
        stacks[13] = control(enabled, Items.DYE.orange(), 10, "Right 10", nowHorizontal(space));
        stacks[JOIN_LEAVE] = joinOrLeave(server);
        stacks[CLEAR] = control(enabled, Items.BRUSH, 1, CLEAR_LABEL, "Resets position and scale (not the timer)");

        stacks[18] = reset(enabled, "Reset scale", size + " px", "Back to 16 px", "12 to 24 px, steps of 4");
        stacks[19] = control(enabled, Items.SMALL_AMETHYST_BUD, 1, "Smaller", "-4 px, min 12");
        stacks[20] = control(enabled, Items.AMETHYST_CLUSTER, 1, "Bigger", "+4 px, max 24");
        stacks[TIME] = enabled
                ? Icons.toggle(Items.CLOCK, TIME_LABEL + ": " + (shown ? "shown" : "hidden"), shown,
                        shown ? "Click to hide the game clock" : "Click to show the game clock")
                : Icons.disabled(TIME_LABEL, GAME_ONLY);
        stacks[CHAT_SETTINGS] = Datapack.chatSettings(owner)
                ? Icons.button(Items.WRITABLE_BOOK, CHAT_SETTINGS_LABEL, "Prints the datapack's text menu in chat")
                : Icons.disabled(CHAT_SETTINGS_LABEL, LEAVE_ONLY);

        for (int slot = 0; slot < SLOTS; slot++) {
            put(slot, stacks[slot]);
        }
    }

    private void drawLeave() {
        for (int slot = 0; slot < SLOTS; slot++) {
            put(slot, switch (slot) {
                case 11 -> Icons.button(Items.CONCRETE.lime(), "Stay in the game");
                case 13 -> Icons.button(Items.OAK_DOOR, "Leave the Bingo game?", "You will be removed from your team and the game");
                case 15 -> Icons.button(Items.CONCRETE.red(), "Leave");
                default -> ItemStack.EMPTY;
            });
        }
    }

    private ItemStack joinOrLeave(MinecraftServer server) {
        if (Datapack.canLeave(owner)) {
            return Icons.button(Items.OAK_DOOR, LEAVE_LABEL, "Asks to confirm first");
        }
        if (Datapack.lobby(server)) {
            return Icons.button(Items.WOOL.lime(), JOIN_LABEL,
                    Datapack.isGamePlayer(owner) ? "Back to the lobby (teams and votes)" : "Pick a team in the lobby");
        }
        if (Datapack.inGame(owner)) {
            return Icons.disabled(LEAVE_LABEL, LEAVE_ONLY);
        }
        if (Datapack.running(server)) {
            return Icons.disabled(JOIN_LABEL, Lobby.GAME_RUNNING);
        }
        return Icons.disabled(JOIN_LABEL, Lobby.LOBBY_CLOSED);
    }

    @Override
    protected void onButton(int slot, int button) {
        if (leaveMode) {
            onLeaveButton(slot);
            return;
        }
        switch (slot) {
            case 0 -> setting(Datapack.VERTICAL_RESET);
            case 1 -> setting(Datapack.UP_10);
            case 2 -> setting(Datapack.UP_1);
            case 3 -> setting(Datapack.DOWN_1);
            case 4 -> setting(Datapack.DOWN_10);
            case IDENTIFY -> {
                if (Datapack.inGame(owner)) {
                    TriggerQueue.navigate(owner, TriggerQueue.Nav.CARD);
                } else {
                    deny(GAME_ONLY);
                }
            }
            case RULES -> {
                TriggerQueue.enqueue(owner, Datapack.RULES, Datapack::always);
                TriggerQueue.navigate(owner, TriggerQueue.Nav.CLOSE);
            }
            case 9 -> setting(Datapack.HORIZONTAL_RESET);
            case 10 -> setting(Datapack.LEFT_10);
            case 11 -> setting(Datapack.LEFT_1);
            case 12 -> setting(Datapack.RIGHT_1);
            case 13 -> setting(Datapack.RIGHT_10);
            case JOIN_LEAVE -> pressJoinOrLeave();
            case CLEAR -> setting(Datapack.CLEAR_SETTINGS);
            case 18 -> setting(Datapack.SCALE_RESET);
            case 19 -> setting(Datapack.SMALLER);
            case 20 -> setting(Datapack.BIGGER);
            case TIME -> setting(timeShown() ? Datapack.TIMER_HIDE : Datapack.TIMER_SHOW);
            case CHAT_SETTINGS -> {
                if (Datapack.chatSettings(owner)) {
                    TriggerQueue.enqueue(owner, Datapack.CHAT_SETTINGS, Datapack::chatSettings);
                    TriggerQueue.navigate(owner, TriggerQueue.Nav.CLOSE);
                } else {
                    deny(LEAVE_ONLY);
                }
            }
            default -> {
            }
        }
    }

    private void onLeaveButton(int slot) {
        if (slot == 11) {
            leaveMode = false;
            draw();
        } else if (slot == 15) {
            if (Datapack.canLeave(owner)) {
                TriggerQueue.enqueue(owner, Datapack.LEAVE_YES, Datapack::canLeave);
                TriggerQueue.navigate(owner, TriggerQueue.Nav.CLOSE);
            } else {
                deny(LEAVE_ONLY);
                leaveMode = false;
                draw();
            }
        }
    }

    private void pressJoinOrLeave() {
        MinecraftServer server = server();
        if (Datapack.canLeave(owner)) {
            leaveMode = true;
            draw();
        } else if (Datapack.lobby(server)) {
            TriggerQueue.navigate(owner, TriggerQueue.Nav.LOBBY_TEAMS);
        } else if (Datapack.inGame(owner)) {
            deny(LEAVE_ONLY);
        } else if (Datapack.running(server)) {
            deny(Lobby.GAME_RUNNING);
        } else {
            deny(Lobby.LOBBY_CLOSED);
        }
    }

    private void setting(String objective) {
        if (Datapack.settingsOpen(owner)) {
            TriggerQueue.enqueue(owner, objective, Datapack::settingsOpen);
        } else {
            deny(GAME_ONLY);
        }
    }

    private boolean timeShown() {
        OptionalInt setting = Datapack.score(owner, Datapack.TIMER_SETTING);
        return setting.isEmpty() || setting.getAsInt() != HIDDEN;
    }

    private static ItemStack reset(boolean enabled, String label, String value, String... lore) {
        return enabled ? Icons.button(Items.TARGET, 1, label + " (" + value + ")", false, lore) : Icons.disabled(label, GAME_ONLY);
    }

    private static ItemStack control(boolean enabled, ItemLike item, int count, String name, String... lore) {
        return enabled ? Icons.button(item, count, name, false, lore) : Icons.disabled(name, GAME_ONLY);
    }

    private static String signed(int value) {
        return value > 0 ? "+" + value : Integer.toString(value);
    }

    private static String nowVertical(int value) {
        return "Now " + signed(value) + " px";
    }

    private static String horizontal(int value) {
        if (value == 0) {
            return "0 px";
        }
        return Math.abs(value) + " px " + (value > 0 ? "right" : "left");
    }

    private static String nowHorizontal(int value) {
        return "Now " + horizontal(value);
    }
}
