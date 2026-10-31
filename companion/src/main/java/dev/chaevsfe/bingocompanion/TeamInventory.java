package dev.chaevsfe.bingocompanion;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import net.minecraft.core.NonNullList;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.nbt.ListTag;
import net.minecraft.nbt.NbtOps;
import net.minecraft.nbt.Tag;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.RegistryOps;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.util.Prediction;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.ScoreHolder;
import net.minecraft.world.scores.Scoreboard;

final class TeamInventory {
    private static final Identifier STORAGE = Identifier.parse("bingo_companion:inventories");
    private static final String STALE = "bingo.stale";
    private static final String SLOT = "slot";
    private static final String ITEM = "item";
    private static final Map<String, NonNullList<ItemStack>> SHARED = new HashMap<>();
    private static final Map<UUID, String> ATTACHED = new HashMap<>();

    private TeamInventory() {
    }

    static void clear() {
        SHARED.clear();
        ATTACHED.clear();
    }

    static boolean attached(ServerPlayer player) {
        return ATTACHED.containsKey(player.getUUID());
    }

    static boolean stale(MinecraftServer server, ServerPlayer player) {
        Objective objective = server.getScoreboard().getObjective(STALE);
        return objective != null && server.getScoreboard().getPlayerScoreInfo(player, objective) != null;
    }

    static void attach(MinecraftServer server, String group, ServerPlayer player, boolean merge) {
        Inventory inventory = player.getInventory();
        NonNullList<ItemStack> list = SHARED.get(group);
        if (list == null) {
            list = load(server, group, inventory.items.size());
            if (list == null && stale(server, player)) {
                list = NonNullList.withSize(inventory.items.size(), ItemStack.EMPTY);
                merge = false;
            } else if (list == null) {
                list = inventory.items;
                merge = false;
            }
            SHARED.put(group, list);
        }
        if (inventory.items == list && group.equals(ATTACHED.get(player.getUUID()))) {
            return;
        }
        if (inventory.items.size() != list.size()) {
            return;
        }
        NonNullList<ItemStack> own = inventory.items;
        inventory.items = list;
        if (merge && own != list) {
            for (ItemStack stack : own) {
                if (stack.isEmpty()) {
                    continue;
                }
                inventory.add(stack);
                if (!stack.isEmpty()) {
                    player.drop(stack, false, Prediction.SERVER_ONLY);
                }
            }
        }
        refresh(player);
        ATTACHED.put(player.getUUID(), group);
        mark(server, player, true);
    }

    static void sync(MinecraftServer server, Map<String, Set<UUID>> members, boolean run) {
        Map<String, List<ServerPlayer>> leaving = new HashMap<>();
        for (UUID id : Set.copyOf(ATTACHED.keySet())) {
            ServerPlayer player = server.getPlayerList().getPlayer(id);
            String group = ATTACHED.get(id);
            if (player == null) {
                ATTACHED.remove(id);
            } else if (!members.getOrDefault(group, Set.of()).contains(id)) {
                leaving.computeIfAbsent(group, key -> new ArrayList<>()).add(player);
            }
        }
        for (Map.Entry<String, List<ServerPlayer>> entry : leaving.entrySet()) {
            String group = entry.getKey();
            boolean gone = members.getOrDefault(group, Set.of()).isEmpty() && offline(server, run, group).isEmpty();
            if (gone) {
                retire(server, group, entry.getValue(), List.of());
            } else {
                for (ServerPlayer player : entry.getValue()) {
                    detach(server, player, false);
                }
            }
        }
    }

    static void release(MinecraftServer server, boolean run) {
        Map<String, List<ServerPlayer>> online = new HashMap<>();
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            String group = ATTACHED.get(player.getUUID());
            if (group != null) {
                online.computeIfAbsent(group, key -> new ArrayList<>()).add(player);
            }
        }
        for (String group : Set.copyOf(SHARED.keySet())) {
            retire(server, group, online.getOrDefault(group, List.of()), offline(server, run, group));
        }
        for (String group : server.getCommandStorage().get(STORAGE).keySet()) {
            List<String> names = offline(server, run, group);
            if (!names.isEmpty()) {
                unmark(server, names.get(0));
            }
        }
        clear();
        clearStored(server);
    }

    private static List<String> offline(MinecraftServer server, boolean run, String group) {
        List<String> names = new ArrayList<>();
        for (String name : Run.memberNames(server, run, group)) {
            if (server.getPlayerList().getPlayerByName(name) == null) {
                names.add(name);
            }
        }
        return names;
    }

    private static void retire(MinecraftServer server, String group, List<ServerPlayer> online, Collection<String> offlineNames) {
        NonNullList<ItemStack> list = SHARED.remove(group);
        ServerPlayer keeper = null;
        for (ServerPlayer player : online) {
            if (keeper == null && list != null && !player.isDeadOrDying() && !player.isRemoved() && player.getInventory().items == list) {
                keeper = player;
            }
        }
        for (ServerPlayer player : online) {
            if (player == keeper) {
                ATTACHED.remove(player.getUUID());
                mark(server, player, false);
            } else {
                detach(server, player, false);
            }
        }
        if (keeper == null && list != null) {
            if (!online.isEmpty()) {
                ServerPlayer holder = online.get(0);
                for (ItemStack stack : list) {
                    if (!stack.isEmpty()) {
                        holder.drop(stack.copy(), false, Prediction.SERVER_ONLY);
                    }
                }
            } else if (!offlineNames.isEmpty()) {
                unmark(server, offlineNames.iterator().next());
            }
        }
        removeStored(server, group);
    }

    static void emptyStale(MinecraftServer server, ServerPlayer player) {
        if (attached(player)) {
            detach(server, player, false);
            return;
        }
        Inventory inventory = player.getInventory();
        for (int slot = 0; slot < inventory.items.size(); slot++) {
            inventory.items.set(slot, ItemStack.EMPTY);
        }
        refresh(player);
    }

    static void sweep(MinecraftServer server) {
        Scoreboard scoreboard = server.getScoreboard();
        Objective stale = scoreboard.getObjective(STALE);
        if (stale == null) {
            return;
        }
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            if (!attached(player) && scoreboard.getPlayerScoreInfo(player, stale) != null) {
                emptyStale(server, player);
                scoreboard.resetSinglePlayerScore(player, stale);
            }
        }
    }

    private static void detach(MinecraftServer server, ServerPlayer player, boolean keep) {
        ATTACHED.remove(player.getUUID());
        Inventory inventory = player.getInventory();
        if (!keep) {
            inventory.items = NonNullList.withSize(inventory.items.size(), ItemStack.EMPTY);
            refresh(player);
        }
        mark(server, player, false);
    }

    private static void mark(MinecraftServer server, ServerPlayer player, boolean stale) {
        if (stale) {
            server.getScoreboard().getOrCreatePlayerScore(player, Datapack.dummy(server, STALE)).set(1);
        } else {
            unmark(server, player.getScoreboardName());
        }
    }

    private static void unmark(MinecraftServer server, String name) {
        Scoreboard scoreboard = server.getScoreboard();
        Objective objective = scoreboard.getObjective(STALE);
        ScoreHolder holder = ScoreHolder.forNameOnly(name);
        if (objective != null && scoreboard.getPlayerScoreInfo(holder, objective) != null) {
            scoreboard.resetSinglePlayerScore(holder, objective);
        }
    }

    private static void refresh(ServerPlayer player) {
        player.inventoryMenu.sendAllDataToRemote();
        if (player.containerMenu != player.inventoryMenu) {
            player.containerMenu.sendAllDataToRemote();
        }
    }

    static void save(MinecraftServer server) {
        if (SHARED.isEmpty()) {
            return;
        }
        RegistryOps<Tag> ops = server.registryAccess().createSerializationContext(NbtOps.INSTANCE);
        CompoundTag root = server.getCommandStorage().get(STORAGE).copy();
        for (Map.Entry<String, NonNullList<ItemStack>> entry : SHARED.entrySet()) {
            ListTag items = new ListTag();
            NonNullList<ItemStack> list = entry.getValue();
            for (int slot = 0; slot < list.size(); slot++) {
                ItemStack stack = list.get(slot);
                if (stack.isEmpty()) {
                    continue;
                }
                int index = slot;
                ItemStack.CODEC.encodeStart(ops, stack).result().ifPresent(tag -> {
                    CompoundTag item = new CompoundTag();
                    item.putInt(SLOT, index);
                    item.put(ITEM, tag);
                    items.add(item);
                });
            }
            root.put(entry.getKey(), items);
        }
        server.getCommandStorage().set(STORAGE, root);
    }

    private static void removeStored(MinecraftServer server, String group) {
        CompoundTag root = server.getCommandStorage().get(STORAGE);
        if (root.contains(group)) {
            CompoundTag copy = root.copy();
            copy.remove(group);
            server.getCommandStorage().set(STORAGE, copy);
        }
    }

    static void clearStored(MinecraftServer server) {
        if (!server.getCommandStorage().get(STORAGE).isEmpty()) {
            server.getCommandStorage().set(STORAGE, new CompoundTag());
        }
    }

    private static NonNullList<ItemStack> load(MinecraftServer server, String group, int size) {
        CompoundTag root = server.getCommandStorage().get(STORAGE);
        if (!root.contains(group)) {
            return null;
        }
        RegistryOps<Tag> ops = server.registryAccess().createSerializationContext(NbtOps.INSTANCE);
        NonNullList<ItemStack> list = NonNullList.withSize(size, ItemStack.EMPTY);
        ListTag items = root.getListOrEmpty(group);
        for (int i = 0; i < items.size(); i++) {
            CompoundTag item = items.getCompoundOrEmpty(i);
            int slot = item.getIntOr(SLOT, -1);
            Tag tag = item.get(ITEM);
            if (slot < 0 || slot >= size || tag == null) {
                continue;
            }
            ItemStack.CODEC.parse(ops, tag).result().ifPresent(stack -> list.set(slot, stack));
        }
        return list;
    }
}
