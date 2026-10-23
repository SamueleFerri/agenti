package it.unibo.iag.jade.test;

import it.unibo.iag.jade.exercise.Pinger;
import it.unibo.iag.jade.test.agents.Ponger;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.List;
import java.util.Random;

import static it.unibo.iag.jade.test.JadeTestingUtils.spawnAgent;
import static it.unibo.iag.jade.test.JadeTestingUtils.spawnTestAgent;

// Pinger in TestSmartPingPong: it pings "ponger", which is not there
public class TestFixedNamePinger {
    @BeforeClass
    public static void startPlatform() {
        JadeTestingUtils.startNewPlatform();
    }

    @Test
    public void testNobodyAnswers() throws InterruptedException {
        final Random random = new Random();
        var ponger = spawnTestAgent("ponger_" + random.nextLong(), Ponger.class);
        spawnAgent("pinger_" + random.nextLong(), Pinger.class);

        ponger.awaitTermination();

        Assert.assertEquals(List.of(), ponger.getLogs());
    }

    @AfterClass
    public static void stopPlatform() {
        JadeTestingUtils.stopPlatform();
    }
}
