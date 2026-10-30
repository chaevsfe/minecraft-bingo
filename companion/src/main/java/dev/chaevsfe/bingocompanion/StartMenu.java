package dev.chaevsfe.bingocompanion;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import net.minecraft.ChatFormatting;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.SimpleMenuProvider;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.inventory.MenuType;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;

final class StartMenu extends LockedMenu {
    static final String TITLE = "Start a game";
    private static final String START_LABEL = "Start";
    private static final String RUN_START_LABEL = "Start the run";
    private static final String STARTING = "Starting...";
    private static final String OPENING = "Opening the lobby";
    private static final String SETTING_UP = "A game is being set up";
    private static final String RUN_IN_PROGRESS = "A run is in progress";
    private static final String OPS_STOP = "Only operators can stop the run";
    private static final String KEEP = "Teleport: keep everyone at the start point";
    private static final int[] RADII = {1000, 5000, 10000, 25000, 100000};
    private static final int[] TETHERS = {4, 8, 12, 16};
    private static final String CYCLE = "Click to cycle teleport options";
    private static final String TETHER_CYCLE = "Click to cycle tether lengths";
    private static final String ADVANCEMENTS_ON = "Advancements: enabled";
    private static final String ADVANCEMENTS_OFF = "Advancements: disabled";
    private static final String LOCATOR_ON = "Player locator: enabled";
    private static final String LOCATOR_OFF = "Player locator: disabled";
    private static final int SLOTS = 27;
    private static final int MODE = 4;
    private static final int TELEPORT = 10;
    private static final int ADVANCEMENTS = 11;
    private static final int LOCATOR = 12;
    private static final int HEALTH = 14;
    private static final int HUNGER = 15;
    private static final int TETHER = 16;
    private static final int START = 22;
    private static final int WIZARD_TICKS = 20;
    private static final int CONFIRM_TICKS = 100;
    private static final int CONFIRM_GRACE = 10;

    private static UUID wizard;
    private static int wizardSince;

    private boolean run;
    private int teleport;
    private boolean advancements = true;
    private boolean locator = true;
    private boolean health;
    private boolean hunger;
    private int tether;
    private boolean starting;
    private int stopArmed = -1;
    private boolean shownRun;

    private StartMenu(int id, Inventory inventory, ServerPlayer owner) {
        super(MenuType.GENERIC_9x3, id, inventory, owner, 3);
        draw();
    }

    static boolean open(ServerPlayer player) {
        if (!Run.active(Datapack.server(player)) && !Datapack.canStart(player)) {
            return false;
        }
        Menus.open(player, new SimpleMenuProvider((id, inventory, p) -> new StartMenu(id, inventory, (ServerPlayer) p), Component.literal(TITLE)));
        return true;
    }

    static ServerPlayer wizardOwner(MinecraftServer server) {
        if (wizard == null) {
            return null;
        }
        ServerPlayer player = server.getPlayerList().getPlayer(wizard);
        if (player == null || Datapack.running(server) || server.getTickCount() - wizardSince > WIZARD_TICKS) {
            wizard = null;
            return null;
        }
        return player;
    }

    static void clear(MinecraftServer server) {
        wizard = null;
    }

    static void endTick(MinecraftServer server) {
        boolean lobby = Datapack.lobby(server);
        boolean running = Datapack.running(server);
        boolean pending = Run.pending();
        ServerPlayer owner = wizardOwner(server);
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            if (!(player.containerMenu instanceof StartMenu menu)) {
                continue;
            }
            if (lobby) {
                LobbyMenu.open(player, LobbyMenu.Page.TEAMS);
            } else if (running) {
                player.closeContainer();
            } else if (menu.starting && owner != player && !pending) {
                menu.starting = false;
                menu.refresh();
            }
        }
    }

    @Override
    protected void draw() {
        MinecraftServer server = server();
        ItemStack[] stacks = new ItemStack[SLOTS];
        Arrays.fill(stacks, ItemStack.EMPTY);
        shownRun = Run.active(server);
        if (shownRun) {
            Links.Settings settings = Links.settings(server);
            stacks[MODE] = Icons.button(Items.CLOCK, 1, "Beat the game: " + Run.clock(), false, "Deaths: " + Run.deaths(server), "Kill the Ender Dragon to win");
            stacks[HEALTH] = healthItem(settings.health(), false, true);
            stacks[HUNGER] = hungerItem(settings.hunger(), false, true);
            stacks[TETHER] = tetherItem(settings.tether(), false, true);
            stacks[START] = stopItem(server);
        } else {
            stacks[MODE] = modeItem();
            if (!run) {
                stacks[TELEPORT] = teleportItem();
                stacks[ADVANCEMENTS] = advancements
                        ? Icons.toggle(Items.KNOWLEDGE_BOOK, ADVANCEMENTS_ON, true, "Advancements trigger during the game", "Click to disable them")
                        : Icons.toggle(Items.KNOWLEDGE_BOOK, ADVANCEMENTS_OFF, false, "All advancements are disabled during the game", "Click to enable them");
                stacks[LOCATOR] = locator
                        ? Icons.toggle(Items.RECOVERY_COMPASS, LOCATOR_ON, true, "The player locator bar stays on", "Click to turn it off")
                        : Icons.toggle(Items.RECOVERY_COMPASS, LOCATOR_OFF, false, "The player locator bar is turned off during the game", "Click to keep it on");
            }
            stacks[HEALTH] = healthItem(health, true, run);
            stacks[HUNGER] = hungerItem(hunger, true, run);
            stacks[TETHER] = tetherItem(tetherLength(), true, run);
            stacks[START] = run ? runStartItem(server) : startItem(server);
        }
        for (int slot = 0; slot < SLOTS; slot++) {
            put(slot, stacks[slot]);
        }
    }

    private int tetherLength() {
        return tether == 0 ? 0 : TETHERS[tether - 1];
    }

    private ItemStack modeItem() {
        if (run) {
            return Icons.toggle(Items.DRAGON_HEAD, "Game: Beat the game", false, "Everyone works together to kill the Ender Dragon", "Respawns are on", "Click to switch to Bingo");
        }
        return Icons.toggle(Items.FILLED_MAP, "Game: Bingo", false, "Teams race to fill their Bingo card", "Click to switch to Beat the game");
    }

    private static ItemStack healthItem(boolean on, boolean clickable, boolean everyone) {
        List<String> lore = new ArrayList<>();
        if (on) {
            lore.add(everyone ? "Everyone shares one health bar" : "Each team shares one health bar");
            lore.add(everyone ? "Damage and healing count for everyone" : "Damage and healing count for the whole team");
            lore.add(everyone ? "If one player dies, everyone dies" : "If one player dies, the whole team dies");
        } else {
            lore.add("Everyone has their own health");
        }
        if (clickable) {
            lore.add(on ? "Click to turn it off" : "Click to turn it on");
        }
        return Icons.toggle(Items.GOLDEN_APPLE, "Shared health: " + (on ? "on" : "off"), on, lore.toArray(String[]::new));
    }

    private static ItemStack hungerItem(boolean on, boolean clickable, boolean everyone) {
        List<String> lore = new ArrayList<>();
        if (on) {
            lore.add(everyone ? "Everyone shares one hunger bar" : "Each team shares one hunger bar");
            lore.add(everyone ? "One player can eat for everyone" : "One player can eat for the whole team");
        } else {
            lore.add("Everyone has their own hunger");
        }
        if (clickable) {
            lore.add(on ? "Click to turn it off" : "Click to turn it on");
        }
        return Icons.toggle(Items.COOKED_BEEF, "Shared hunger: " + (on ? "on" : "off"), on, lore.toArray(String[]::new));
    }

    private static ItemStack tetherItem(int length, boolean clickable, boolean everyone) {
        List<String> lore = new ArrayList<>();
        if (length > 0) {
            lore.add(everyone ? "Everyone is tied together in join order" : "Teammates are tied together in join order");
            lore.add("Up to " + length + " blocks between neighbours");
            lore.add(everyone ? "If one player dies, everyone dies" : "If one player dies, the whole team dies");
        } else {
            lore.add(everyone ? "Everyone moves freely" : "Teammates move freely");
        }
        if (clickable) {
            lore.add(TETHER_CYCLE);
        }
        String name = length > 0 ? "Tether: " + length + " blocks" : "Tether: off";
        return Icons.button(Items.LEAD, Math.max(1, length), name, length > 0, lore.toArray(String[]::new));
    }

    private ItemStack teleportItem() {
        if (teleport == 0) {
            return Icons.toggle(Items.ENDER_PEARL, KEEP, false, "Teams spawn within 10 blocks of the start", CYCLE);
        }
        return Icons.toggle(Items.ENDER_PEARL, "Teleport: spread up to " + String.format("%,d", RADII[teleport - 1]) + " blocks", true, "Teams are spread randomly", CYCLE);
    }

    private ItemStack startItem(MinecraftServer server) {
        if (Datapack.running(server)) {
            return Icons.disabled(Lobby.GAME_STARTED, List.of());
        }
        if (starting) {
            return Icons.disabled(STARTING, OPENING);
        }
        ServerPlayer setter = Datapack.settingUp(server);
        if (setter != null) {
            return Icons.disabled(SETTING_UP, "By " + setter.getScoreboardName());
        }
        return Icons.button(Items.EMERALD, START_LABEL, "Opens the lobby for everyone", "The choices above apply to this game");
    }

    private ItemStack runStartItem(MinecraftServer server) {
        if (Datapack.running(server)) {
            return Icons.disabled(Lobby.GAME_RUNNING, List.of());
        }
        if (starting || Run.pending()) {
            return Icons.disabled(STARTING, "Starting the run");
        }
        ServerPlayer setter = Datapack.settingUp(server);
        if (setter != null) {
            return Icons.disabled(SETTING_UP, "By " + setter.getScoreboardName());
        }
        List<Component> lore = new ArrayList<>();
        lore.add(Icons.line("Starts the run for everyone online"));
        lore.add(Icons.line("Clears inventories, ender chests, levels and advancements"));
        lore.add(Icons.line("Everyone starts at the world spawn"));
        if (Run.dragonDead(server)) {
            lore.add(Icons.line("This world's dragon is already dead", ChatFormatting.RED));
            lore.add(Icons.line("Use /bingo reset world for a fresh world", ChatFormatting.RED));
        }
        return Icons.button(Items.EMERALD, 1, Component.literal(RUN_START_LABEL), lore, false);
    }

    private ItemStack stopItem(MinecraftServer server) {
        if (!Datapack.isOp(owner)) {
            return Icons.disabled(RUN_IN_PROGRESS, OPS_STOP);
        }
        if (armed(server)) {
            return Icons.button(Items.BARRIER, 1, "Click again to stop the run", true, "Ends the run for everyone");
        }
        return Icons.button(Items.BARRIER, "Stop the run", "Ends the run for everyone", "Click twice to confirm");
    }

    private boolean armed(MinecraftServer server) {
        return stopArmed >= 0 && server.getTickCount() - stopArmed <= CONFIRM_TICKS;
    }

    @Override
    protected void onButton(int slot, int button) {
        MinecraftServer server = server();
        if (shownRun != Run.active(server)) {
            draw();
            return;
        }
        if (shownRun) {
            if (slot == START) {
                pressStop(server);
            }
            return;
        }
        switch (slot) {
            case MODE -> flip(6);
            case TELEPORT -> flip(0);
            case ADVANCEMENTS -> flip(1);
            case LOCATOR -> flip(2);
            case HEALTH -> flip(3);
            case HUNGER -> flip(4);
            case TETHER -> flip(5);
            case START -> pressStart();
            default -> {
            }
        }
    }

    private void flip(int which) {
        if (starting || (run && which <= 2)) {
            return;
        }
        switch (which) {
            case 0 -> teleport = (teleport + 1) % (RADII.length + 1);
            case 1 -> advancements = !advancements;
            case 2 -> locator = !locator;
            case 3 -> health = !health;
            case 4 -> hunger = !hunger;
            case 5 -> tether = (tether + 1) % (TETHERS.length + 1);
            default -> run = !run;
        }
        draw();
    }

    private void pressStop(MinecraftServer server) {
        if (!Datapack.isOp(owner)) {
            deny(OPS_STOP);
            return;
        }
        int now = server.getTickCount();
        if (!armed(server)) {
            stopArmed = now;
        } else if (now - stopArmed >= CONFIRM_GRACE) {
            stopArmed = -1;
            Run.stop(server);
            TriggerQueue.navigate(owner, TriggerQueue.Nav.CLOSE);
            return;
        }
        draw();
    }

    private void pressStart() {
        MinecraftServer server = server();
        if (Datapack.running(server)) {
            deny(run ? Lobby.GAME_RUNNING : Lobby.GAME_STARTED);
            return;
        }
        if (starting) {
            return;
        }
        if (Run.pending()) {
            deny(Run.ALREADY_RUNNING);
            return;
        }
        ServerPlayer setter = Datapack.settingUp(server);
        if (setter != null) {
            deny(Datapack.settingUpText(setter));
            return;
        }
        Links.Settings settings = new Links.Settings(health, hunger, tetherLength());
        starting = true;
        if (run) {
            Run.request(owner, settings);
            draw();
            return;
        }
        wizard = owner.getUUID();
        wizardSince = server.getTickCount();
        boolean spread = teleport > 0;
        Links.configure(server, settings);
        Datapack.setRadius(server, spread ? RADII[teleport - 1] : RADII[0]);
        TriggerQueue.enqueue(owner, Datapack.START, Datapack::canStartAs);
        TriggerQueue.enqueue(owner, spread ? Datapack.TP_YES : Datapack.TP_NO, Datapack::wizardTp);
        TriggerQueue.enqueue(owner, advancements ? Datapack.ADVANCEMENTS_ON : Datapack.ADVANCEMENTS_OFF, Datapack::wizardAdvancement);
        TriggerQueue.enqueue(owner, locator ? Datapack.LOCATOR_ON : Datapack.LOCATOR_OFF, Datapack::wizardLocator);
        draw();
    }
}
