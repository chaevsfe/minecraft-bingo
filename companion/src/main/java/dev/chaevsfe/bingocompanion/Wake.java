package dev.chaevsfe.bingocompanion;

import com.mojang.logging.LogUtils;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.naming.NameNotFoundException;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import net.minecraft.SharedConstants;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.network.chat.Component;
import net.minecraft.network.protocol.common.ClientboundTransferPacket;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import org.slf4j.Logger;

final class Wake implements Runnable {
    private enum Reply {
        UP,
        ASLEEP,
        REFUSED
    }

    private static final Logger LOGGER = LogUtils.getLogger();
    private static final AtomicReference<Wake> ACTIVE = new AtomicReference<>();
    private static final String PROBE_NAME = "BingoWake";
    private static final UUID PROBE_ID = UUID.nameUUIDFromBytes(("OfflinePlayer:" + PROBE_NAME).getBytes(StandardCharsets.UTF_8));
    private static final int LOGIN = 2;
    private static final int TRANSFER = 3;
    private static final long PROBE_INTERVAL_NANOS = 3_000_000_000L;
    private static final long DRAIN_NANOS = 500_000_000L;
    private static final long REASON_NANOS = 1_000_000_000L;
    private static final int CONNECT_TIMEOUT_MS = 2000;
    private static final int READ_TIMEOUT_MS = 4000;
    private static final int DRAIN_TIMEOUT_MS = 200;
    private static final int MAX_BYTES = 1 << 16;
    private static final Pattern TEXT = Pattern.compile("\"(?:text|translate)\"\\s*:\\s*\"((?:[^\"\\\\]|\\\\.)*)\"");

    private final MinecraftServer server;
    private final CommandSourceStack source;
    private final String label;
    private final Transfer.Target target;
    private final Set<UUID> selection;
    private final List<CommandSourceStack> sources = new CopyOnWriteArrayList<>();
    private final int timeoutSeconds;
    private final long started = System.nanoTime();
    private volatile boolean cancelled;
    private volatile boolean waking;
    private volatile String reason = "";
    private volatile String failure = "";

    private Wake(MinecraftServer server, CommandSourceStack source, String label, Transfer.Target target, Set<UUID> selection, int timeoutSeconds) {
        this.server = server;
        this.source = source;
        this.label = label;
        this.target = target;
        this.selection = selection;
        this.timeoutSeconds = timeoutSeconds;
        sources.add(source);
    }

    static void start(CommandSourceStack source, String label, Transfer.Target target, Set<UUID> selection, int timeoutSeconds) {
        Wake wake = new Wake(source.getServer(), source, label, target, ConcurrentHashMap.newKeySet(), timeoutSeconds);
        wake.selection.addAll(selection);
        if (timeoutSeconds <= 0) {
            wake.transfer();
            return;
        }
        while (!ACTIVE.compareAndSet(null, wake)) {
            Wake active = ACTIVE.get();
            if (active == null) {
                continue;
            }
            if (!active.target.equals(target)) {
                source.sendFailure(Component.literal("Already waking " + label));
                return;
            }
            int added = 0;
            for (UUID id : selection) {
                if (active.selection.add(id)) {
                    added++;
                }
            }
            active.sources.add(source);
            int count = added;
            source.sendSystemMessage(Component.literal("Already waking " + label + ", added " + count + " player(s)"));
            return;
        }
        Thread thread = new Thread(wake, "bingo-wake");
        thread.setDaemon(true);
        thread.start();
    }

    static void cancel(MinecraftServer server) {
        Wake wake = ACTIVE.get();
        if (wake != null) {
            wake.cancelled = true;
        }
    }

    static void tick(MinecraftServer server) {
        Wake wake = ACTIVE.get();
        if (wake != null && wake.waking && server.getTickCount() % 20 == 0) {
            wake.overlay("Waking " + wake.label + " (" + wake.elapsedSeconds() + "s)");
        }
    }

    @Override
    public void run() {
        try {
            Transfer.Target resolved = null;
            long nextProbe = started;
            while (!cancelled && server.isRunning()) {
                if (System.nanoTime() - nextProbe >= 0) {
                    if (resolved == null) {
                        resolved = resolve(target);
                    }
                    Transfer.Target probe = resolved == null ? target : resolved;
                    Reply reply = probe(probe, LOGIN);
                    if (reply == Reply.UP) {
                        reply = probe(probe, TRANSFER);
                    }
                    if (reply == Reply.UP) {
                        server.execute(this::transfer);
                        return;
                    }
                    if (reply == Reply.REFUSED) {
                        server.execute(this::refused);
                        return;
                    }
                    nextProbe = System.nanoTime() + PROBE_INTERVAL_NANOS;
                    waking = true;
                }
                if (elapsedSeconds() >= timeoutSeconds) {
                    server.execute(this::timeout);
                    return;
                }
                Thread.sleep(250);
            }
            ACTIVE.compareAndSet(this, null);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            ACTIVE.compareAndSet(this, null);
        }
    }

    private long elapsedSeconds() {
        return (System.nanoTime() - started) / 1_000_000_000L;
    }

    private String sentence() {
        return Character.toUpperCase(label.charAt(0)) + label.substring(1);
    }

    private void transfer() {
        ACTIVE.compareAndSet(this, null);
        List<ServerPlayer> players = players();
        if (players.isEmpty()) {
            fail("None of those players are online");
            return;
        }
        Component message = Component.literal("Sending " + players.size() + " player(s) to " + target.host() + ":" + target.port());
        LOGGER.info(message.getString());
        for (CommandSourceStack requester : sources) {
            requester.sendSystemMessage(message);
        }
        for (ServerPlayer player : players) {
            player.connection.send(new ClientboundTransferPacket(target.host(), target.port()));
        }
    }

    private void timeout() {
        ACTIVE.compareAndSet(this, null);
        String last = reason.isEmpty() ? "" : " (last reply: " + reason + ")";
        fail(sentence() + " did not answer within " + timeoutSeconds + " seconds" + last);
        overlay(sentence() + " did not wake up");
    }

    private void refused() {
        ACTIVE.compareAndSet(this, null);
        fail(failure);
        overlay(failure);
    }

    private void fail(String message) {
        LOGGER.warn(message);
        for (CommandSourceStack requester : sources) {
            requester.sendFailure(Component.literal(message));
        }
    }

    private List<ServerPlayer> players() {
        List<ServerPlayer> out = new ArrayList<>();
        for (ServerPlayer player : server.getPlayerList().getPlayers()) {
            if (selection.contains(player.getUUID())) {
                out.add(player);
            }
        }
        return out;
    }

    private void overlay(String text) {
        Component message = Component.literal(text);
        for (ServerPlayer player : players()) {
            player.sendOverlayMessage(message);
        }
    }

    private static Transfer.Target resolve(Transfer.Target target) {
        if (target.port() != Transfer.DEFAULT_PORT) {
            return target;
        }
        Hashtable<String, String> env = new Hashtable<>();
        env.put("java.naming.factory.initial", "com.sun.jndi.dns.DnsContextFactory");
        env.put("java.naming.provider.url", "dns:");
        env.put("com.sun.jndi.dns.timeout.retries", "1");
        DirContext context = null;
        try {
            context = new InitialDirContext(env);
            Attributes attributes = context.getAttributes("_minecraft._tcp." + target.host(), new String[] {"SRV"});
            Attribute srv = attributes.get("srv");
            if (srv == null) {
                return target;
            }
            String[] parts = srv.get().toString().trim().split("\\s+");
            if (parts.length < 4) {
                return target;
            }
            String host = parts[3].endsWith(".") ? parts[3].substring(0, parts[3].length() - 1) : parts[3];
            return new Transfer.Target(host, Integer.parseInt(parts[2]));
        } catch (NameNotFoundException e) {
            return target;
        } catch (NamingException | RuntimeException e) {
            LOGGER.warn("SRV lookup for {} failed: {}", target.host(), e.toString());
            return null;
        } finally {
            close(context);
        }
    }

    private static void close(DirContext context) {
        if (context == null) {
            return;
        }
        try {
            context.close();
        } catch (NamingException e) {
            LOGGER.debug("DNS context close failed", e);
        }
    }

    private Reply probe(Transfer.Target target, int intent) {
        try (Socket socket = new Socket()) {
            socket.connect(new InetSocketAddress(target.host(), target.port()), CONNECT_TIMEOUT_MS);
            socket.setSoTimeout(READ_TIMEOUT_MS);
            OutputStream out = socket.getOutputStream();
            ByteArrayOutputStream handshake = new ByteArrayOutputStream();
            DataOutputStream data = new DataOutputStream(handshake);
            writeVarInt(data, 0);
            writeVarInt(data, SharedConstants.getProtocolVersion());
            writeString(data, target.host());
            data.writeShort(target.port());
            writeVarInt(data, intent);
            frame(out, handshake.toByteArray());
            ByteArrayOutputStream hello = new ByteArrayOutputStream();
            data = new DataOutputStream(hello);
            writeVarInt(data, 0);
            writeString(data, PROBE_NAME);
            data.writeLong(PROBE_ID.getMostSignificantBits());
            data.writeLong(PROBE_ID.getLeastSignificantBits());
            frame(out, hello.toByteArray());
            out.flush();
            InputStream in = socket.getInputStream();
            if (readVarInt(in) <= 0) {
                return Reply.ASLEEP;
            }
            if (readVarInt(in) != 0) {
                drain(socket, in);
                return Reply.UP;
            }
            String json = new String(read(in, readVarInt(in)), StandardCharsets.UTF_8);
            drain(socket, in);
            return classify(json);
        } catch (IOException | RuntimeException e) {
            return Reply.ASLEEP;
        }
    }

    private Reply classify(String json) {
        Matcher matcher = TEXT.matcher(json);
        reason = matcher.find() ? matcher.group(1) : json.strip();
        if (json.contains("multiplayer.disconnect.not_whitelisted") || json.contains("multiplayer.disconnect.banned")) {
            return Reply.UP;
        }
        if (json.contains("multiplayer.disconnect.server_full")) {
            failure = sentence() + " is full";
            return Reply.REFUSED;
        }
        if (json.contains("multiplayer.disconnect.transfers_disabled")) {
            failure = sentence() + " does not accept transfers (accepts-transfers=false)";
            return Reply.REFUSED;
        }
        if (json.contains("multiplayer.disconnect.outdated_") || json.contains("multiplayer.disconnect.incompatible")) {
            failure = sentence() + " runs a different Minecraft version";
            return Reply.REFUSED;
        }
        return Reply.ASLEEP;
    }

    private static byte[] read(InputStream in, int size) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        long deadline = System.nanoTime() + REASON_NANOS;
        int remaining = Math.min(Math.max(size, 0), MAX_BYTES);
        while (remaining > 0 && System.nanoTime() - deadline < 0) {
            int read = in.read(buffer, 0, Math.min(buffer.length, remaining));
            if (read < 0) {
                break;
            }
            out.write(buffer, 0, read);
            remaining -= read;
        }
        return out.toByteArray();
    }

    private static void drain(Socket socket, InputStream in) {
        try {
            socket.setSoTimeout(DRAIN_TIMEOUT_MS);
            byte[] buffer = new byte[256];
            long deadline = System.nanoTime() + DRAIN_NANOS;
            int total = 0;
            int read = 0;
            while (read >= 0 && total < MAX_BYTES && System.nanoTime() - deadline < 0) {
                read = in.read(buffer);
                total += Math.max(read, 0);
            }
        } catch (IOException e) {
            return;
        }
    }

    private static void frame(OutputStream out, byte[] payload) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        DataOutputStream data = new DataOutputStream(buffer);
        writeVarInt(data, payload.length);
        data.write(payload);
        out.write(buffer.toByteArray());
    }

    private static void writeString(DataOutputStream out, String value) throws IOException {
        byte[] bytes = value.getBytes(StandardCharsets.UTF_8);
        writeVarInt(out, bytes.length);
        out.write(bytes);
    }

    private static void writeVarInt(DataOutputStream out, int value) throws IOException {
        while ((value & ~0x7F) != 0) {
            out.writeByte((value & 0x7F) | 0x80);
            value >>>= 7;
        }
        out.writeByte(value);
    }

    private static int readVarInt(InputStream in) throws IOException {
        int value = 0;
        int shift = 0;
        while (true) {
            int read = in.read();
            if (read < 0) {
                throw new IOException("end of stream");
            }
            value |= (read & 0x7F) << shift;
            if ((read & 0x80) == 0) {
                return value;
            }
            shift += 7;
            if (shift >= 35) {
                throw new IOException("varint too long");
            }
        }
    }
}
