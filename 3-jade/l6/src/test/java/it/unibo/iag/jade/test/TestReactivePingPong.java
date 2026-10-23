package it.unibo.iag.jade.test;

import it.unibo.iag.jade.exercise.ReactivePinger;
import it.unibo.iag.jade.test.agents.Ponger;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.stream.Collectors;
import java.util.stream.IntStream;

import static it.unibo.iag.jade.test.JadeTestingUtils.spawnAgent;
import static it.unibo.iag.jade.test.JadeTestingUtils.spawnTestAgent;

// The same test as TestPingPong, the reactive way: it passes too
public class TestReactivePingPong {
    @BeforeClass
    public static void startPlatform() {
        JadeTestingUtils.startNewPlatform();
    }

    @Test
    public void testPingPong() throws InterruptedException {
        var ponger = spawnTestAgent("ponger", Ponger.class);
        spawnAgent("pinger", ReactivePinger.class);

        ponger.awaitTermination();

        Assert.assertEquals(
                IntStream.range(0, 2 * Ponger.ROUNDS + 1)
                        .mapToObj(i -> {
                            if (i % 2 == 0) {
                                return "Received `ping` from pinger";
                            } else {
                                return "Sent `pong` to pinger";
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
