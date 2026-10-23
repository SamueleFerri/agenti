package it.unibo.iag.jade.test;

import it.unibo.iag.jade.exercise.SmartPinger;
import it.unibo.iag.jade.test.agents.Ponger;
import org.junit.*;

import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import static it.unibo.iag.jade.test.JadeTestingUtils.spawnAgent;
import static it.unibo.iag.jade.test.JadeTestingUtils.spawnTestAgent;

public class TestSmartPingPong {
    @BeforeClass
    public static void startPlatform() {
        JadeTestingUtils.startNewPlatform();
    }

    @Test
    public void testPingPong() throws InterruptedException {
        final Random random = new Random();
        var pongerName = "ponger_" + random.nextLong();
        var ponger = spawnTestAgent(pongerName, Ponger.class);

        var pingerName = "pinger_" + random.nextLong();
        spawnAgent(pingerName, SmartPinger.class);

        ponger.awaitTermination();

        Assert.assertEquals(
                IntStream.range(0, 2 * Ponger.ROUNDS + 1)
                        .mapToObj(i -> {
                            if (i % 2 == 0) {
                                return "Received `ping` from " + pingerName;
                            } else {
                                return "Sent `pong` to " + pingerName;
                            }
                        }).collect(Collectors.toList()),
                ponger.getLogs()
        );
    }

    @AfterClass
    public static void stopPlatform() {
        JadeTestingUtils.stopPlatform();
    }
}
