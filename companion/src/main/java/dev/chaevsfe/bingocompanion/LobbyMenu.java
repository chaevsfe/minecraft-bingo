package dev.chaevsfe.bingocompanion;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.OptionalInt;
import java.util.function.Predicate;
import net.minecraft.ChatFormatting;
import net.minecraft.network.chat.Component;
import net.minecraft.network.chat.MutableComponent;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.SimpleMenuProvider;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.inventory.MenuType;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.level.ItemLike;

final class LobbyMenu extends LockedMenu {
    enum Page {
        TEAMS("Bingo Lobby: Teams"),
        MODE("Bingo Lobby: Mode"),
        DIFFICULTY("Bingo Lobby: Difficulty");

        private final String title;

        Page(String title) {
            this.title = title;
        }
    }

    static final String TEAMS_CLOSED = "Teams are only chosen before the game starts";
    private static final String PICK_TEAM_TO_VOTE = "Pick a team to vote";
    private static final String VOTE_PENDING = "Voting is not open yet";
    private static final String VOTE_CLOSED = "Voting has closed";
    private static final String START_NOW_LABEL = "Start now (op)";
    private static final String READY_LABEL = "Ready";
    private static final String BACK_LABEL = "Back";
    private static final String BACK_TO_TEAMS = "To the team page";
    private static final String BACK_TO_MODE = "To the mode page";
    private static final int SLOTS = 27;
    private static final int CLOCK = 7;
    private static final int PLAYERS = 8;
    private static final int READY = 16;
    private static final int START_NOW = 17;
    private static final int BACK = 26;
    private static final int[] TEAM_SLOTS = {2, 3, 4, 11, 12, 13, 20, 21, 22};
    private static final int[] OPTION_SLOTS = {10, 12, 14};
    private static final int MAX_COUNT = 64;

    private enum Phase {
        PENDING,
        OPEN,
        LOCKED
    }

    private record Vote(boolean mode, String objective, String winObjective, List<String> options, List<String> labels, Predicate<ServerPlayer> gate) {
        ItemLike item(int index) {
            if (mode) {
                return switch (index) {
                    case 0 -> Items.PAPER;
                    case 1 -> Items.BLAZE_POWDER;
                    default -> Items.NETHER_STAR;
                };
            }
            return switch (index) {
                case 0 -> Items.IRON_INGOT;
                case 1 -> Items.GOLD_INGOT;
                default -> Items.NETHERITE_INGOT;
            };
        }
    }

    private static final Vote MODE = new Vote(true, Datapack.VOTE_TYPE, Datapack.VOTE_TYPE_WIN, Datapack.MODES,
            List.of("Line", "Cross", "Full House"), Datapack::voteMode);
    private static final Vote DIFFICULTY = new Vote(false, Datapack.VOTE_DIFFICULTY, Datapack.VOTE_DIFFICULTY_WIN,
            Datapack.DIFFICULTIES, List.of("Standard", "Difficult", "Hardcore"), Datapack::voteDifficulty);

    private final Page page;

    private LobbyMenu(int id, Inventory inventory, ServerPlayer owner, Page page) {
        super(MenuType.GENERIC_9x3, id, inventory, owner, 3);
        this.page = page;
        draw();
    }

    static boolean open(ServerPlayer player, Page page) {
        if (!Datapack.lobby(player)) {
            return false;
        }
        player.openMenu(new SimpleMenuProvider((id, inventory, p) -> new LobbyMenu(id, inventory, (ServerPlayer) p, page), Component.literal(page.title)));
        return true;
    }

    @Override
    protected void draw() {
        MinecraftServer server = server();
        boolean open = Datapack.lobby(server);
        boolean joined = Datapack.isGamePlayer(owner);
        OptionalInt timer = Datapack.lobbyTimer(server);
        List<ServerPlayer> players = Datapack.gamePlayers(server);
        ItemStack[] stacks = new ItemStack[SLOTS];
        Arrays.fill(stacks, ItemStack.EMPTY);
        switch (page) {
            case TEAMS -> {
                String ownTeam = Datapack.team(owner);
                for (int i = 0; i < TEAM_SLOTS.length; i++) {
                    stacks[TEAM_SLOTS[i]] = teamCell(server, Datapack.TEAMS.get(i), open, joined, ownTeam);
                }
            }
            case MODE -> drawVote(stacks, MODE, server, open, joined, timer);
            case DIFFICULTY -> drawVote(stacks, DIFFICULTY, server, open, joined, timer);
        }
        stacks[CLOCK] = clock(server, timer);
        stacks[PLAYERS] = playersItem(server, players);
        stacks[READY] = readyItem(server, open, players.size());
        stacks[START_NOW] = startNow(server, players.size());
        stacks[BACK] = back();
        for (int slot = 0; slot < SLOTS; slot++) {
            put(slot, stacks[slot]);
        }
    }

    private ItemStack teamCell(MinecraftServer server, String color, boolean open, boolean joined, String ownTeam) {
        List<ServerPlayer> members = Datapack.teamMembers(server, color);
        List<Component> lore = new ArrayList<>();
        for (ServerPlayer member : members) {
            lore.add(Icons.line(member.getScoreboardName(), ChatFormatting.WHITE));
        }
        if (members.isEmpty()) {
            lore.add(Icons.line("No players yet"));
        }
        String label = Icons.teamName(color);
        if (!Datapack.canChooseTeam(owner)) {
            lore.add(Icons.line(open ? TEAMS_CLOSED : Lobby.LOBBY_CLOSED));
            return Icons.disabled(label, lore);
        }
        boolean mine = color.equals(ownTeam);
        if (mine) {
            lore.add(Icons.line("Your team", ChatFormatting.GREEN));
        } else {
            lore.add(Icons.line(joined ? "Click to switch" : "Click to join"));
        }
        ChatFormatting teamColor = Icons.teamColor(color);
        Component name = Component.literal(label).withStyle(style -> style.withItalic(false).withColor(teamColor));
        return Icons.button(Icons.teamWool(color), Math.max(1, members.size()), name, lore, mine);
    }

    private static Phase phase(MinecraftServer server, Vote vote, OptionalInt timer) {
        if (Datapack.voteOpen(server, vote.objective())) {
            return Phase.OPEN;
        }
        if (timer.isPresent() && timer.getAsInt() < Datapack.VOTE_LOCK) {
            return Phase.PENDING;
        }
        return Phase.LOCKED;
    }

    private static int winnerIndex(MinecraftServer server, Vote vote) {
        int winner = Datapack.voteWinner(server, vote.winObjective());
        return Math.max(1, Math.min(vote.options().size(), winner)) - 1;
    }

    private void drawVote(ItemStack[] stacks, Vote vote, MinecraftServer server, boolean open, boolean joined, OptionalInt timer) {
        Phase phase = phase(server, vote, timer);
        int winner = winnerIndex(server, vote);
        String own = Datapack.ownVote(owner, vote.options());
        for (int i = 0; i < vote.options().size(); i++) {
            String option = vote.options().get(i);
            String label = vote.labels().get(i);
            int tally = Datapack.voteTally(server, vote.objective(), option);
            ItemStack stack;
            if (!open) {
                stack = Icons.disabled(label, Lobby.LOBBY_CLOSED);
            } else if (phase == Phase.PENDING) {
                stack = Icons.disabled(label, VOTE_PENDING);
            } else if (phase == Phase.LOCKED) {
                stack = i == winner
                        ? Icons.button(vote.item(i), 1, label, true, "Winner", VOTE_CLOSED)
                        : Icons.disabled(label, VOTE_CLOSED);
            } else if (!joined) {
                stack = Icons.disabled(label, List.of(Icons.line("Votes: " + tally), Icons.line(PICK_TEAM_TO_VOTE)));
            } else {
                boolean mine = option.equals(own);
                List<Component> lore = new ArrayList<>();
                lore.add(Icons.line("Votes: " + tally));
                if (mine) {
                    lore.add(Icons.line("Your vote", ChatFormatting.GREEN));
                }
                stack = Icons.button(vote.item(i), Math.max(1, tally), Component.literal(label), lore, mine);
            }
            stacks[OPTION_SLOTS[i]] = stack;
        }
    }

    private static ItemStack clock(MinecraftServer server, OptionalInt timer) {
        String name;
        int count = 1;
        if (timer.isEmpty()) {
            name = "No countdown";
        } else {
            int seconds = Datapack.secondsLeft(timer.getAsInt());
            count = Math.max(1, Math.min(MAX_COUNT, seconds));
            name = timer.getAsInt() >= Datapack.EARLY_END ? "Starting..." : "Lobby closes in " + seconds + "s";
        }
        List<Component> lore = new ArrayList<>();
        lore.add(Icons.line("Players joined: " + Datapack.playerCount(server)));
        if (timer.isEmpty()) {
            lore.add(Icons.line("Game in progress"));
        } else if (timer.getAsInt() < Datapack.VOTE_LOCK) {
            lore.add(Icons.line("Pick a team and vote"));
        } else {
            lore.add(Icons.line("Votes locked, dealing the cards"));
        }
        ServerPlayer starter = Datapack.starter(server);
        if (starter != null) {
            lore.add(Icons.line("Started by " + starter.getScoreboardName()));
        }
        return Icons.button(Items.CLOCK, count, Component.literal(name), lore, false);
    }

    private static ItemStack playersItem(MinecraftServer server, List<ServerPlayer> players) {
        List<Component> lore = new ArrayList<>();
        for (ServerPlayer player : players) {
            String team = Datapack.team(player);
            ChatFormatting color = team == null ? ChatFormatting.WHITE : Icons.teamColor(team);
            MutableComponent line = Component.literal(player.getScoreboardName()).withStyle(style -> style.withItalic(false).withColor(color));
            if (Lobby.isReady(player)) {
                line.append(Icons.line(" (ready)", ChatFormatting.GREEN));
            }
            lore.add(line);
        }
        if (players.isEmpty()) {
            lore.add(Icons.line(Lobby.NOBODY_JOINED));
        }
        int count = Datapack.playerCount(server);
        return Icons.button(Items.PLAYER_HEAD, Math.max(1, count), Component.literal("Players: " + count), lore, false);
    }

    private ItemStack startNow(MinecraftServer server, int players) {
        if (!Datapack.isOp(owner)) {
            return ItemStack.EMPTY;
        }
        String blocker = Lobby.startBlocker(server);
        if (blocker != null) {
            return Icons.disabled(START_NOW_LABEL, blocker);
        }
        return Icons.button(Items.EMERALD, START_NOW_LABEL, "Locks the votes and deals the cards now", players + " players joined");
    }

    private ItemStack readyItem(MinecraftServer server, boolean open, int players) {
        String blocker = open ? Lobby.readyBlocker(owner) : Lobby.LOBBY_CLOSED;
        if (blocker != null) {
            return Icons.disabled(READY_LABEL, blocker);
        }
        String tally = Lobby.readyCount(server) + " of " + players + " ready";
        if (Lobby.isReady(owner)) {
            return Icons.button(Items.DYE.lime(), 1, READY_LABEL, true, "You are ready", tally, "Click to unready");
        }
        return Icons.button(Items.DYE.gray(), 1, READY_LABEL, false, "Click when you are ready", tally, "The game starts when everyone is ready");
    }

    private ItemStack back() {
        return switch (page) {
            case TEAMS -> ItemStack.EMPTY;
            case MODE -> Icons.button(Items.ARROW, BACK_LABEL, BACK_TO_TEAMS);
            case DIFFICULTY -> Icons.button(Items.ARROW, BACK_LABEL, BACK_TO_MODE);
        };
    }

    private static int indexOf(int[] slots, int slot) {
        for (int i = 0; i < slots.length; i++) {
            if (slots[i] == slot) {
                return i;
            }
        }
        return -1;
    }

    @Override
    protected void onButton(int slot, int button) {
        switch (slot) {
            case READY -> pressReady();
            case START_NOW -> pressStartNow();
            case BACK -> pressBack();
            default -> pressContent(slot);
        }
    }

    private void pressContent(int slot) {
        switch (page) {
            case TEAMS -> {
                int index = indexOf(TEAM_SLOTS, slot);
                if (index >= 0) {
                    pressTeam(Datapack.TEAMS.get(index));
                }
            }
            case MODE -> {
                int index = indexOf(OPTION_SLOTS, slot);
                if (index >= 0) {
                    pressVote(MODE, index);
                }
            }
            case DIFFICULTY -> {
                int index = indexOf(OPTION_SLOTS, slot);
                if (index >= 0) {
                    pressVote(DIFFICULTY, index);
                }
            }
        }
    }

    private void pressBack() {
        switch (page) {
            case MODE -> TriggerQueue.navigate(owner, TriggerQueue.Nav.LOBBY_TEAMS);
            case DIFFICULTY -> TriggerQueue.navigate(owner, TriggerQueue.Nav.LOBBY_MODE);
            default -> {
            }
        }
    }

    private void pressTeam(String color) {
        if (!Datapack.canChooseTeam(owner)) {
            Datapack.tell(owner, Datapack.lobby(owner) ? TEAMS_CLOSED : Lobby.LOBBY_CLOSED);
            return;
        }
        if (color.equals(Datapack.team(owner)) && Datapack.isGamePlayer(owner)) {
            TriggerQueue.navigate(owner, TriggerQueue.Nav.LOBBY_MODE);
            return;
        }
        TriggerQueue.enqueue(owner, Datapack.TEAM_JOIN + color, Datapack::canChooseTeam);
        TriggerQueue.navigateAfterFlush(owner, TriggerQueue.Nav.LOBBY_MODE);
    }

    private void pressVote(Vote vote, int index) {
        MinecraftServer server = server();
        String blocker = voteBlocker(vote, server);
        if (blocker != null) {
            Datapack.tell(owner, blocker);
            return;
        }
        String option = vote.options().get(index);
        if (option.equals(Datapack.ownVote(owner, vote.options()))) {
            if (vote.mode()) {
                TriggerQueue.navigate(owner, TriggerQueue.Nav.LOBBY_DIFFICULTY);
            }
            return;
        }
        TriggerQueue.enqueue(owner, Datapack.VOTE + option, vote.gate());
        if (vote.mode()) {
            TriggerQueue.navigateAfterFlush(owner, TriggerQueue.Nav.LOBBY_DIFFICULTY);
        }
    }

    private String voteBlocker(Vote vote, MinecraftServer server) {
        if (!Datapack.lobby(server)) {
            return Lobby.LOBBY_CLOSED;
        }
        Phase phase = phase(server, vote, Datapack.lobbyTimer(server));
        if (phase == Phase.PENDING) {
            return VOTE_PENDING;
        }
        if (phase == Phase.LOCKED) {
            return VOTE_CLOSED;
        }
        if (!Datapack.isGamePlayer(owner)) {
            return PICK_TEAM_TO_VOTE;
        }
        return null;
    }

    private void pressStartNow() {
        if (!Datapack.isOp(owner)) {
            return;
        }
        Lobby.requestStart(owner);
        draw();
    }

    private void pressReady() {
        String blocker = Datapack.lobby(owner) ? Lobby.readyBlocker(owner) : Lobby.LOBBY_CLOSED;
        if (blocker != null) {
            Datapack.tell(owner, blocker);
            return;
        }
        Lobby.toggleReady(owner);
        draw();
    }
}
