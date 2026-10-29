package dev.chaevsfe.bingocompanion;

import java.util.List;
import java.util.UUID;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.SimpleMenuProvider;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.inventory.MenuType;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;

final class StartMenu extends LockedMenu {
    static final String TITLE = "Start a Bingo game";
    private static final String START_LABEL = "Start";
    private static final String STARTING = "Starting...";
    private static final String OPENING = "Opening the lobby";
    private static final String SETTING_UP = "A game is being set up";
    private static final String SPREAD = "Teleport: spread randomly";
    private static final String KEEP = "Teleport: keep everyone at the start point";
    private static final String ADVANCEMENTS_ON = "Advancements: enabled";
    private static final String ADVANCEMENTS_OFF = "Advancements: disabled";
    private static final String LOCATOR_ON = "Player locator: enabled";
    private static final String LOCATOR_OFF = "Player locator: disabled";
    private static final int SLOTS = 9;
    private static final int TELEPORT = 1;
    private static final int ADVANCEMENTS = 3;
    private static final int LOCATOR = 5;
    private static final int START = 7;
    private static final int WIZARD_TICKS = 20;

    private static UUID wizard;
    private static int wizardSince;

    private boolean spread = true;
    private boolean advancements = true;
    private boolean locator = true;
    private boolean starting;

    private StartMenu(int id, Inventory inventory, ServerPlayer owner) {
        super(MenuType.GENERIC_9x1, id, inventory, owner, 1);
        draw();
    }

    static boolean open(ServerPlayer player) {
        if (!Datapack.canStart(player)) {
            return false;
        }
        player.openMenu(new SimpleMenuProvider((id, inventory, p) -> new StartMenu(id, inventory, (ServerPlayer) p), Component.literal(TITLE)));
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
        ServerPlayer owner = wizardOwner(server);
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            if (!(player.containerMenu instanceof StartMenu menu)) {
                continue;
            }
            if (lobby) {
                LobbyMenu.open(player, LobbyMenu.Page.TEAMS);
            } else if (running) {
                player.closeContainer();
            } else if (menu.starting && owner != player) {
                menu.starting = false;
                menu.refresh();
            }
        }
    }

    @Override
    protected void draw() {
        for (int slot = 0; slot < SLOTS; slot++) {
            put(slot, switch (slot) {
                case TELEPORT -> spread
                        ? Icons.toggle(Items.ENDER_PEARL, SPREAD, true, "Teams are spread up to 1000 blocks apart", "Click to keep everyone at the start point")
                        : Icons.toggle(Items.ENDER_PEARL, KEEP, false, "Teams spawn within 10 blocks of the start point", "Click to spread the teams randomly");
                case ADVANCEMENTS -> advancements
                        ? Icons.toggle(Items.KNOWLEDGE_BOOK, ADVANCEMENTS_ON, true, "Advancements trigger during the game", "Click to disable them")
                        : Icons.toggle(Items.KNOWLEDGE_BOOK, ADVANCEMENTS_OFF, false, "All advancements are disabled during the game", "Click to enable them");
                case LOCATOR -> locator
                        ? Icons.toggle(Items.RECOVERY_COMPASS, LOCATOR_ON, true, "The player locator bar stays on", "Click to turn it off")
                        : Icons.toggle(Items.RECOVERY_COMPASS, LOCATOR_OFF, false, "The player locator bar is turned off during the game", "Click to keep it on");
                case START -> startItem();
                default -> ItemStack.EMPTY;
            });
        }
    }

    private ItemStack startItem() {
        MinecraftServer server = server();
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

    @Override
    protected void onButton(int slot, int button) {
        switch (slot) {
            case TELEPORT -> flip(0);
            case ADVANCEMENTS -> flip(1);
            case LOCATOR -> flip(2);
            case START -> pressStart();
            default -> {
            }
        }
    }

    private void flip(int which) {
        if (starting) {
            return;
        }
        switch (which) {
            case 0 -> spread = !spread;
            case 1 -> advancements = !advancements;
            default -> locator = !locator;
        }
        draw();
    }

    private void pressStart() {
        MinecraftServer server = server();
        if (Datapack.running(server)) {
            deny(Lobby.GAME_STARTED);
            return;
        }
        if (starting) {
            return;
        }
        ServerPlayer setter = Datapack.settingUp(server);
        if (setter != null) {
            deny(Datapack.settingUpText(setter));
            return;
        }
        wizard = owner.getUUID();
        wizardSince = server.getTickCount();
        starting = true;
        TriggerQueue.enqueue(owner, Datapack.START, Datapack::canStartAs);
        TriggerQueue.enqueue(owner, spread ? Datapack.TP_YES : Datapack.TP_NO, Datapack::wizardTp);
        TriggerQueue.enqueue(owner, advancements ? Datapack.ADVANCEMENTS_ON : Datapack.ADVANCEMENTS_OFF, Datapack::wizardAdvancement);
        TriggerQueue.enqueue(owner, locator ? Datapack.LOCATOR_ON : Datapack.LOCATOR_OFF, Datapack::wizardLocator);
        draw();
    }
}
