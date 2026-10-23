package it.unibo.iag.jason;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Runs a MAS in a JVM of its own, headless, and collects what its agents print.
 * Used by the tests: start it, wait for the lines expected, stop it.
 */
public final class MasRun implements AutoCloseable {

    private final Process process;
    private final List<String> lines = new ArrayList<>();

    private MasRun(Process process) {
        this.process = process;
        Thread reader = new Thread(() -> {
            try (BufferedReader in = new BufferedReader(
                    new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8))) {
                String line;
                while ((line = in.readLine()) != null) {
                    System.out.println(line);
                    synchronized (lines) {
                        lines.add(line);
                        lines.notifyAll();
                    }
                }
            } catch (IOException ignored) { }
        });
        reader.setDaemon(true);
        reader.start();
    }

    /** Starts the MAS described by a .mas2j file, in the current directory. */
    public static MasRun start(String mas2j) throws IOException {
        Path logging = Files.createTempFile("jason-logging", ".properties");
        Files.writeString(logging, String.join("\n",
                "handlers = java.util.logging.ConsoleHandler",
                ".level = INFO",
                "java.util.logging.ConsoleHandler.level = INFO",
                "java.util.logging.ConsoleHandler.formatter = jason.runtime.MASConsoleLogFormatter"));
        logging.toFile().deleteOnExit();
        String java = Path.of(System.getProperty("java.home"), "bin", "java").toString();
        ProcessBuilder pb = new ProcessBuilder(Arrays.asList(java,
                "-Djava.awt.headless=true",
                "-cp", System.getProperty("java.class.path"),
                "jason.infra.local.RunLocalMAS", mas2j,
                "--log-conf", logging.toString(), "--no-net", "--no-mbean"));
        pb.redirectErrorStream(true);
        return new MasRun(pb.start());
    }

    /** Starts a MAS from the text of a .mas2j, written to a temporary file. */
    public static MasRun startText(String mas2jText) throws IOException {
        File dir = new File("build/tmp/mas");
        dir.mkdirs();
        File mas2j = File.createTempFile("test", ".mas2j", dir);
        mas2j.deleteOnExit();
        Files.writeString(mas2j.toPath(), mas2jText);
        return start(mas2j.getPath());
    }

    /** Waits until a line containing {@code text} is printed; true if it was, false on time-out. */
    public boolean await(String text, long timeoutMillis) throws InterruptedException {
        long deadline = System.currentTimeMillis() + timeoutMillis;
        synchronized (lines) {
            while (lines.stream().noneMatch(l -> l.contains(text))) {
                long left = deadline - System.currentTimeMillis();
                if (left <= 0) return false;
                lines.wait(left);
            }
            return true;
        }
    }

    /** Waits for {@code millis}, then returns everything printed so far. */
    public List<String> after(long millis) throws InterruptedException {
        Thread.sleep(millis);
        return lines();
    }

    /** Everything printed so far. */
    public List<String> lines() {
        synchronized (lines) {
            return new ArrayList<>(lines);
        }
    }

    /** The index of the first line containing {@code text}, or -1. */
    public int indexOf(String text) {
        List<String> all = lines();
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).contains(text)) return i;
        }
        return -1;
    }

    @Override
    public void close() throws InterruptedException {
        process.destroy();
        if (!process.waitFor(3, TimeUnit.SECONDS)) {
            process.destroyForcibly();
        }
    }
}
