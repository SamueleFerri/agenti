package it.unibo.iag.jade.test;

import it.unibo.iag.jade.pitfalls.CompositeLoopPinger;
import it.unibo.iag.jade.test.agents.Ponger;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.List;

import static it.unibo.iag.jade.test.JadeTestingUtils.spawnAgent;
import static it.unibo.iag.jade.test.JadeTestingUtils.spawnTestAgent;

// Pinger's loop over a CompositeBehaviour: the second pong never wakes it up
public class TestCompositeLoopPinger {
    @BeforeClass
    public static void startPlatform() {
        JadeTestingUtils.startNewPlatform();
    }

    @Test
    public void testHangsAfterOneRound() throws InterruptedException {
        var ponger = spawnTestAgent("ponger", Ponger.class);
        spawnAgent("pinger", CompositeLoopPinger.class);

        ponger.awaitTermination();

        Assert.assertEquals(
                List.of("Received `ping` from pinger", "Sent `pong` to pinger"),
                ponger.getLogs()
        );
    }

    @AfterClass
    public static void stopPlatform() {
        JadeTestingUtils.stopPlatform();
    }
}
