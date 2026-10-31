package dev.chaevsfe.bingocompanion;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import net.minecraft.core.particles.DustParticleOptions;
import net.minecraft.core.particles.ParticleTypes;
import net.minecraft.network.protocol.game.ClientboundExplodePacket;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.util.random.WeightedList;
import net.minecraft.world.phys.Vec3;

final class Tether {
    private static final double SNAP = 6.0;
    private static final double PULL = 0.12;
    private static final double MAX_PULL = 0.9;
    private static final double ANCHOR = 0.25;
    private static final double GAIN = 0.6;
    private static final double MAX_PUSH = 0.6;
    private static final double MAX_OUTSTANDING = 1.2;
    private static final double CAUGHT = -0.08;
    private static final int PASSES = 4;
    private static final int SETTLE_TICKS = 40;
    private static final int TRAVEL_TICKS = 100;
    private static final int MAX_FLIGHT_TICKS = 10;
    private static final double TICK_MILLIS = 50.0;
    private static final double ROPE_HEIGHT = 0.9;
    private static final double ROPE_STEP = 0.35;
    private static final double SAG = 0.25;
    private static final double MAX_SAG = ROPE_HEIGHT + 0.3;
    private static final double PEARL_LANDING = 0.05;
    private static final int ROPE_POINTS = 64;
    private static final float ROPE_SIZE = 0.6F;
    private static final int HIDDEN_DEPTH = 64;

    private record Sent(int tick, Vec3 push) {
    }


    private static final Map<UUID, ArrayDeque<Sent>> SENT = new HashMap<>();
    private static final Map<UUID, Integer> SETTLING = new HashMap<>();
    private static final float PEARL_DAMAGE = 5.0F;
    private static final double GROUND_PROBE = 0.1;

    private Tether() {
    }

    static void clear() {
        SENT.clear();
        SETTLING.clear();
    }

    static void place(MinecraftServer server, List<ServerPlayer> chain, List<ServerPlayer> arrived, Map<UUID, Links.Track> tracks, int length, boolean sharedHealth) {
        ServerPlayer mover = null;
        boolean pearl = false;
        for (ServerPlayer player : chain) {
            Links.Track track = tracks.get(player.getUUID());
            if (arrived.contains(player) || track == null) {
                continue;
            }
            boolean landed = pearlLanded(player, track);
            boolean otherDimension = !player.level().dimension().equals(track.dimension);
            double jump = otherDimension || track.position == null ? 0.0 : player.position().distanceTo(track.position);
            boolean portalJump = !otherDimension && player.isOnPortalCooldown() && jump > length + SNAP;
            if (landed || otherDimension || portalJump) {
                mover = player;
                pearl = landed;
                break;
            }
        }
        if (mover != null && pearl) {
            settle(server, mover, SETTLE_TICKS);
            for (ServerPlayer player : chain) {
                if (player != mover) {
                    moveTo(server, player, mover);
                    if (!sharedHealth) {
                        player.hurtServer(player.level(), player.damageSources().enderPearl(), PEARL_DAMAGE);
                    }
                }
            }
        } else if (mover != null) {
            settle(server, mover, TRAVEL_TICKS);
            for (ServerPlayer player : chain) {
                if (player != mover && (player.level() != mover.level() || player.distanceTo(mover) > length)) {
                    moveTo(server, player, mover);
                }
            }
        }
        List<ServerPlayer> anchors = new ArrayList<>();
        for (ServerPlayer player : chain) {
            if (!arrived.contains(player)) {
                anchors.add(player);
            }
        }
        for (ServerPlayer player : arrived) {
            settle(server, player, SETTLE_TICKS);
            if (!anchors.isEmpty()) {
                ServerPlayer target = anchor(chain, anchors, player);
                if (player.level() != target.level() || player.distanceTo(target) > length) {
                    Links.Track track = tracks.get(target.getUUID());
                    if (safe(target)) {
                        moveTo(server, player, target);
                    } else if (track != null && track.safePosition != null) {
                        ServerLevel level = server.getLevel(track.safeDimension);
                        if (level != null) {
                            moveTo(server, player, level, track.safePosition);
                        }
                    }
                }
            }
            anchors.add(player);
        }
    }

    private static boolean pearlLanded(ServerPlayer player, Links.Track track) {
        if (track.pearls.isEmpty()) {
            return false;
        }
        Set<UUID> flying = new HashSet<>();
        player.getEnderPearls().forEach(entity -> flying.add(entity.getUUID()));
        for (Map.Entry<UUID, Links.Spot> entry : track.pearls.entrySet()) {
            Links.Spot spot = entry.getValue();
            if (!flying.contains(entry.getKey()) && player.level().dimension().equals(spot.dimension())
                    && player.position().distanceTo(spot.position()) <= PEARL_LANDING) {
                return true;
            }
        }
        return false;
    }

    private static ServerPlayer anchor(List<ServerPlayer> chain, List<ServerPlayer> anchors, ServerPlayer player) {
        int index = chain.indexOf(player);
        ServerPlayer fallback = null;
        for (int i = index - 1; i >= 0; i--) {
            ServerPlayer candidate = chain.get(i);
            if (anchors.contains(candidate)) {
                if (safe(candidate)) {
                    return candidate;
                }
                if (fallback == null) {
                    fallback = candidate;
                }
            }
        }
        for (ServerPlayer candidate : anchors) {
            if (safe(candidate)) {
                return candidate;
            }
        }
        return fallback != null ? fallback : anchors.get(0);
    }

    static boolean safe(ServerPlayer player) {
        boolean grounded = !player.level().noCollision(player, player.getBoundingBox().move(0.0, -GROUND_PROBE, 0.0));
        return grounded && !player.isInLiquid() && !player.isPassenger() && !player.isFallFlying();
    }

    private static void settle(MinecraftServer server, ServerPlayer player, int ticks) {
        int until = server.getTickCount() + ticks;
        SETTLING.merge(player.getUUID(), until, Math::max);
        SENT.remove(player.getUUID());
    }

    private static boolean settling(MinecraftServer server, ServerPlayer player) {
        Integer until = SETTLING.get(player.getUUID());
        if (until != null && server.getTickCount() >= until) {
            SETTLING.remove(player.getUUID());
            until = null;
        }
        return until != null || !player.connection.hasClientLoaded();
    }

    static void pull(MinecraftServer server, List<ServerPlayer> chain, Map<UUID, Links.Track> tracks, int length) {
        int now = server.getTickCount();
        Set<ServerPlayer> snapped = new HashSet<>();
        List<ServerPlayer[]> taut = new ArrayList<>();
        for (int i = 0; i + 1 < chain.size(); i++) {
            ServerPlayer a = chain.get(i);
            ServerPlayer b = chain.get(i + 1);
            if (a.level() != b.level() || snapped.contains(a) || snapped.contains(b)) {
                continue;
            }
            double distance = a.position().distanceTo(b.position());
            if (distance <= length) {
                continue;
            }
            if (distance > length + SNAP) {
                ServerPlayer mover = snapMover(server, a, b, tracks);
                moveTo(server, mover, mover == a ? b : a);
                snapped.add(mover);
                continue;
            }
            for (ServerPlayer end : List.of(a, b)) {
                if (end.isPassenger()) {
                    end.stopRiding();
                }
            }
            taut.add(new ServerPlayer[] {a, b});
        }
        Map<ServerPlayer, Vec3> velocity = new HashMap<>();
        Map<ServerPlayer, Vec3> impulse = new HashMap<>();
        for (int pass = 0; pass < PASSES; pass++) {
            for (ServerPlayer[] pair : taut) {
                ServerPlayer a = pair[0];
                ServerPlayer b = pair[1];
                if (snapped.contains(a) || snapped.contains(b)) {
                    continue;
                }
                Vec3 between = b.position().subtract(a.position());
                double distance = between.length();
                Vec3 toward = between.scale(1.0 / distance);
                double target = Math.min(MAX_PULL, PULL * (distance - length));
                Vec3 va = velocity.computeIfAbsent(a, p -> estimate(now, p));
                Vec3 vb = velocity.computeIfAbsent(b, p -> estimate(now, p));
                double missing = vb.subtract(va).dot(toward) + target;
                double wa = weight(server, a, b);
                double wb = weight(server, b, a);
                if (missing <= 0.0 || wa + wb <= 0.0) {
                    continue;
                }
                Vec3 pa = toward.scale(missing * wa / (wa + wb));
                Vec3 pb = toward.scale(-missing * wb / (wa + wb));
                velocity.put(a, va.add(pa));
                velocity.put(b, vb.add(pb));
                impulse.merge(a, pa, Vec3::add);
                impulse.merge(b, pb, Vec3::add);
            }
        }
        for (Map.Entry<ServerPlayer, Vec3> entry : impulse.entrySet()) {
            send(now, entry.getKey(), entry.getValue().scale(GAIN));
        }
        SENT.values().removeIf(ArrayDeque::isEmpty);
    }

    private static ServerPlayer snapMover(MinecraftServer server, ServerPlayer a, ServerPlayer b, Map<UUID, Links.Track> tracks) {
        boolean settlingA = settling(server, a);
        if (settlingA != settling(server, b)) {
            return settlingA ? b : a;
        }
        return moved(a, tracks) > moved(b, tracks) ? a : b;
    }

    private static double moved(ServerPlayer player, Map<UUID, Links.Track> tracks) {
        Links.Track track = tracks.get(player.getUUID());
        if (track == null || track.position == null || !player.level().dimension().equals(track.dimension)) {
            return 0.0;
        }
        return player.position().distanceToSqr(track.position);
    }

    private static double weight(MinecraftServer server, ServerPlayer player, ServerPlayer partner) {
        if (settling(server, player)) {
            return 0.0;
        }
        return player.onGround() && !partner.onGround() ? ANCHOR : 1.0;
    }

    private static int flightTicks(ServerPlayer player) {
        int ticks = (int) Math.ceil(player.connection.latency() / TICK_MILLIS) + 1;
        return Math.clamp(ticks, 1, MAX_FLIGHT_TICKS);
    }

    private static Vec3 inFlight(int now, ServerPlayer player) {
        ArrayDeque<Sent> sent = SENT.get(player.getUUID());
        if (sent == null) {
            return Vec3.ZERO;
        }
        int oldest = now - flightTicks(player);
        Vec3 total = Vec3.ZERO;
        Iterator<Sent> iterator = sent.iterator();
        while (iterator.hasNext()) {
            Sent entry = iterator.next();
            if (entry.tick() <= oldest) {
                iterator.remove();
            } else {
                total = total.add(entry.push());
            }
        }
        return total;
    }

    private static Vec3 estimate(int now, ServerPlayer player) {
        return player.getKnownMovement().add(inFlight(now, player));
    }

    private static void send(int now, ServerPlayer player, Vec3 push) {
        if (push.length() > MAX_PUSH) {
            push = push.normalize().scale(MAX_PUSH);
        }
        Vec3 flying = inFlight(now, player);
        if (flying.add(push).length() > MAX_OUTSTANDING) {
            push = push.scale(Math.max(0.0, MAX_OUTSTANDING - flying.length()) / push.length());
        }
        if (push.lengthSqr() < 1.0E-6) {
            return;
        }
        Vec3 away = new Vec3(player.getX(), player.level().getMinY() - HIDDEN_DEPTH, player.getZ());
        player.connection.send(new ClientboundExplodePacket(away, 0.0F, 0, Optional.of(push), ParticleTypes.BUBBLE_POP, SoundEvents.UI_BUTTON_CLICK,
                WeightedList.of(), false));
        SENT.computeIfAbsent(player.getUUID(), id -> new ArrayDeque<>()).addLast(new Sent(now, push));
        if (!player.onGround() && push.y > 0.0) {
            player.connection.resetFlyingTicks();
            if (player.getKnownMovement().add(flying).add(push).y >= CAUGHT) {
                player.resetFallDistance();
            }
        }
    }

    private static void moveTo(MinecraftServer server, ServerPlayer player, ServerPlayer target) {
        moveTo(server, player, target.level(), target.position());
    }

    private static void moveTo(MinecraftServer server, ServerPlayer player, ServerLevel level, Vec3 position) {
        if (player.isPassenger()) {
            player.stopRiding();
        }
        boolean otherDimension = player.level() != level;
        player.teleportTo(level, position.x, position.y, position.z, Set.of(), player.getYRot(), player.getXRot(), true);
        if (otherDimension) {
            player.setPortalCooldown();
        }
        player.resetFallDistance();
        settle(server, player, otherDimension ? TRAVEL_TICKS : SETTLE_TICKS);
    }

    static void rope(List<ServerPlayer> chain, int length, int color) {
        DustParticleOptions dust = new DustParticleOptions(color, ROPE_SIZE);
        for (int i = 0; i + 1 < chain.size(); i++) {
            ServerPlayer a = chain.get(i);
            ServerPlayer b = chain.get(i + 1);
            if (a.level() != b.level()) {
                continue;
            }
            Vec3 from = a.position().add(0.0, ROPE_HEIGHT, 0.0);
            Vec3 to = b.position().add(0.0, ROPE_HEIGHT, 0.0);
            double distance = from.distanceTo(to);
            int points = Math.min(ROPE_POINTS, Math.max(2, (int) Math.ceil(distance / ROPE_STEP)));
            double sag = Math.min(MAX_SAG, Math.max(0.0, length - distance) * SAG);
            ServerLevel level = a.level();
            for (int k = 1; k < points; k++) {
                double t = (double) k / points;
                double x = from.x + (to.x - from.x) * t;
                double y = from.y + (to.y - from.y) * t - sag * 4.0 * t * (1.0 - t);
                double z = from.z + (to.z - from.z) * t;
                level.sendParticles(dust, false, true, x, y, z, 1, 0.0, 0.0, 0.0, 0.0);
            }
        }
    }
}
