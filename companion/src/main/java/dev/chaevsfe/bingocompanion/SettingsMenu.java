package dev.chaevsfe.bingocompanion;

import java.util.ArrayList;
import java.util.List;
import java.util.OptionalInt;
import net.minecraft.ChatFormatting;
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
    private static final String NOT_LOADED = "Bingo datapack is not loaded";
    private static final int ARM_TICKS = 100;
    private static final int CONFIRM_DELAY_TICKS = 10;
    private static final int SLOTS = 27;

    private boolean leaveMode;
    private int armedAt = -1;

    private SettingsMenu(int id, Inventory inventory, ServerPlayer owner) {
        super(MenuType.GENERIC_9x3, id, inventory, owner, 3);
        draw();
    }

    static void open(ServerPlayer player) {
        player.addTag(Datapack.TAG_TRAINING);
        player.openMenu(new SimpleMenuProvider((id, inventory, p) -> new SettingsMenu(id, inventory, (ServerPlayer) p), Component.literal("Bingo Settings")));
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
        OptionalInt verticalScore = Datapack.score(owner, Datapack.VERTICAL);
        OptionalInt spaceScore = Datapack.score(owner, Datapack.SPACE);
        OptionalInt sizeScore = Datapack.score(owner, Datapack.ICON_SIZE);
        OptionalInt timerScore = Datapack.score(owner, Datapack.TIMER_SETTING);
        int vertical = verticalScore.orElse(0);
        int space = spaceScore.orElse(0);
        int size = sizeScore.orElse(16);
        boolean showTime = timerScore.isEmpty() || timerScore.getAsInt() == 1;
        boolean hideTime = timerScore.isPresent() && timerScore.getAsInt() == 2;

        String verticalNow = enabled ? (verticalScore.isPresent() ? signed(vertical) + " px" : "default (0)") : "-";
        put(0, Icons.button(Items.LADDER, "Vertical position",
                "Current: " + verticalNow,
                "Range -60 to " + (size == 12 ? "+6" : "+10"),
                "Positive = up"));
        put(1, control(enabled, Items.TARGET, 1, "Reset vertical", "Back to 0"));
        put(2, control(enabled, Items.DYE.lime(), 10, "Up 10", now(vertical)));
        put(3, control(enabled, Items.DYE.lime(), 1, "Up 1", now(vertical)));
        put(4, control(enabled, Items.DYE.red(), 1, "Down 1", now(vertical)));
        put(5, control(enabled, Items.DYE.red(), 10, "Down 10", now(vertical)));
        put(6, Icons.filler());
        put(7, enabled ? Icons.button(Items.CLOCK, 1, "Show game time", showTime, selected(showTime)) : Icons.disabled("Show game time", GAME_ONLY));
        put(8, enabled ? Icons.button(Items.DYE.gray(), 1, "Hide game time", hideTime, selected(hideTime)) : Icons.disabled("Hide game time", GAME_ONLY));

        put(9, Icons.button(Items.RAIL, "Horizontal position",
                "Current: " + (enabled ? horizontal(spaceScore) : "-"),
                "Positive = right"));
        put(10, control(enabled, Items.TARGET, 1, "Reset horizontal", "Back to centre (0)"));
        put(11, control(enabled, Items.DYE.lightBlue(), 10, "Left 10", now(space)));
        put(12, control(enabled, Items.DYE.lightBlue(), 1, "Left 1", now(space)));
        put(13, control(enabled, Items.DYE.orange(), 1, "Right 1", now(space)));
        put(14, control(enabled, Items.DYE.orange(), 10, "Right 10", now(space)));
        put(15, Icons.filler());
        put(16, Datapack.inGame(owner)
                ? Icons.button(Items.SPYGLASS, "Identify an item", "Shows your Bingo card with real item names")
                : Icons.disabled("Identify an item", GAME_ONLY));
        put(17, Icons.button(Items.BOOK, "Rules", "Prints the rules in chat"));

        String scaleNow = enabled ? (sizeScore.isPresent() ? size + " px (default 16, 8-32)" : "default (16 px, 8-32)") : "-";
        put(18, Icons.button(Items.ITEM_FRAME, enabled ? Math.max(1, Math.min(64, size)) : 1, "List scale", false, "Current: " + scaleNow));
        put(19, control(enabled, Items.TARGET, 1, "Reset scale", "Back to 16 px"));
        put(20, control(enabled, Items.SMALL_AMETHYST_BUD, 1, "Smaller", "2 px below 16, 4 above, min 8"));
        put(21, control(enabled, Items.AMETHYST_CLUSTER, 1, "Bigger", "2 px below 16, 4 above, max 32"));
        put(22, startOrJoin(server));
        put(23, resetButton(server));
        put(24, control(enabled, Items.BRUSH, 1, "Clear settings", "Resets position and scale (not the timer)"));
        put(25, Datapack.canLeave(owner)
                ? Icons.button(Items.OAK_DOOR, "Leave game", "Asks to confirm first")
                : Icons.disabled("Leave game", LEAVE_ONLY));
        put(26, Icons.button(Items.BARRIER, "Close"));
    }

    private void drawLeave() {
        for (int slot = 0; slot < SLOTS; slot++) {
            switch (slot) {
                case 11 -> put(slot, Icons.button(Items.CONCRETE.lime(), "Stay in the game"));
                case 13 -> put(slot, Icons.button(Items.OAK_DOOR, "Leave the Bingo game?", "You will be removed from your team and the game"));
                case 15 -> put(slot, Icons.button(Items.CONCRETE.red(), "Leave"));
                default -> put(slot, Icons.filler());
            }
        }
    }

    private ItemStack startOrJoin(MinecraftServer server) {
        if (!Datapack.running(server)) {
            ServerPlayer setter = Datapack.settingUp(server);
            if (setter != null) {
                return Icons.disabled("A game is being set up", "By " + setter.getScoreboardName() + ", in chat");
            }
            return Icons.button(Items.EMERALD, "Start a Bingo game", "Setup continues in chat");
        }
        if (Datapack.canJoin(owner)) {
            return Icons.button(Items.WOOL.lime(), "Join the game", "Pick a team in the lobby");
        }
        if (Datapack.lobby(server)) {
            return Icons.button(Items.BELL, "Lobby", "Teams, votes and ready");
        }
        return Icons.filler();
    }

    private ItemStack resetButton(MinecraftServer server) {
        if (!Datapack.isOp(owner)) {
            armedAt = -1;
            return Icons.filler();
        }
        boolean armed = armed(server);
        List<Component> lore = new ArrayList<>();
        lore.add(Icons.line("Ends the game for everyone"));
        if (armed) {
            lore.add(Icons.line("Click again within 5 s to confirm", ChatFormatting.RED));
        }
        return Icons.button(Items.TNT, 1, Component.literal("Reset game (op)"), lore, armed);
    }

    private boolean armed(MinecraftServer server) {
        if (armedAt >= 0 && server.getTickCount() < armedAt + ARM_TICKS) {
            return true;
        }
        armedAt = -1;
        return false;
    }

    @Override
    protected void onButton(int slot, int button) {
        if (leaveMode) {
            onLeaveButton(slot);
            return;
        }
        switch (slot) {
            case 1 -> setting(Datapack.VERTICAL_RESET);
            case 2 -> setting(Datapack.UP_10);
            case 3 -> setting(Datapack.UP_1);
            case 4 -> setting(Datapack.DOWN_1);
            case 5 -> setting(Datapack.DOWN_10);
            case 7 -> setting(Datapack.TIMER_SHOW);
            case 8 -> setting(Datapack.TIMER_HIDE);
            case 10 -> setting(Datapack.HORIZONTAL_RESET);
            case 11 -> setting(Datapack.LEFT_10);
            case 12 -> setting(Datapack.LEFT_1);
            case 13 -> setting(Datapack.RIGHT_1);
            case 14 -> setting(Datapack.RIGHT_10);
            case 16 -> {
                if (Datapack.inGame(owner)) {
                    TriggerQueue.navigate(owner, TriggerQueue.Nav.CARD);
                } else {
                    deny(GAME_ONLY);
                }
            }
            case 17 -> {
                TriggerQueue.enqueue(owner, Datapack.RULES, Datapack::always);
                TriggerQueue.navigate(owner, TriggerQueue.Nav.CLOSE);
            }
            case 19 -> setting(Datapack.SCALE_RESET);
            case 20 -> setting(Datapack.SMALLER);
            case 21 -> setting(Datapack.BIGGER);
            case 22 -> pressStartOrJoin();
            case 23 -> pressReset();
            case 24 -> setting(Datapack.CLEAR_SETTINGS);
            case 25 -> {
                if (Datapack.canLeave(owner)) {
                    leaveMode = true;
                    draw();
                } else {
                    deny(LEAVE_ONLY);
                }
            }
            case 26 -> TriggerQueue.navigate(owner, TriggerQueue.Nav.CLOSE);
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

    private void setting(String objective) {
        if (Datapack.settingsOpen(owner)) {
            TriggerQueue.enqueue(owner, objective, Datapack::settingsOpen);
        } else {
            deny(GAME_ONLY);
        }
    }

    private void pressStartOrJoin() {
        MinecraftServer server = server();
        if (!Datapack.running(server)) {
            ServerPlayer setter = Datapack.settingUp(server);
            if (setter != null) {
                deny(Datapack.settingUpText(setter));
                return;
            }
            TriggerQueue.enqueue(owner, Datapack.START, Datapack::canStart);
            TriggerQueue.navigate(owner, TriggerQueue.Nav.CLOSE);
        } else if (Datapack.lobby(server)) {
            TriggerQueue.navigate(owner, TriggerQueue.Nav.LOBBY);
        }
    }

    private void pressReset() {
        if (!Datapack.isOp(owner)) {
            return;
        }
        MinecraftServer server = server();
        if (armed(server)) {
            if (server.getTickCount() < armedAt + CONFIRM_DELAY_TICKS) {
                return;
            }
            armedAt = -1;
            if (!Datapack.runReset(server)) {
                deny(NOT_LOADED);
            }
        } else {
            armedAt = server.getTickCount();
        }
        draw();
    }

    private static ItemStack control(boolean enabled, ItemLike item, int count, String name, String... lore) {
        return enabled ? Icons.button(item, count, name, false, lore) : Icons.disabled(name, GAME_ONLY);
    }

    private static String[] selected(boolean selected) {
        return selected ? new String[] {"Selected"} : new String[0];
    }

    private static String signed(int value) {
        return value > 0 ? "+" + value : Integer.toString(value);
    }

    private static String now(int value) {
        return "Now " + signed(value) + " px";
    }

    private static String horizontal(OptionalInt score) {
        if (score.isEmpty()) {
            return "default (0)";
        }
        int value = score.getAsInt();
        if (value == 0) {
            return "0 px (centre)";
        }
        return Math.abs(value) + " px " + (value > 0 ? "right" : "left") + " of centre";
    }
}
