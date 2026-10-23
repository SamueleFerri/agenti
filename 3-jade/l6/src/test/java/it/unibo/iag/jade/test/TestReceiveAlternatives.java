package it.unibo.iag.jade.test;

import it.unibo.iag.jade.test.agents.*;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.List;

import static it.unibo.iag.jade.test.JadeTestingUtils.spawnTestAgent;

// Three ways of waiting for a message: one right, two wrong
public class TestReceiveAlternatives {
    @BeforeClass
    public static void startPlatform() {
        JadeTestingUtils.startNewPlatform();
    }

    // block(): one action on the empty mailbox, one on the message
    @Test
    public void testReceiveBlocks() throws InterruptedException {
        var receiver = spawnTestAgent(TestReceiveActionsAgent.PREFERRED_NAME, TestReceiveActionsAgent.class);
        spawnTestAgent("delayedSender1", TestDelayedSenderAgent.class, TestReceiveActionsAgent.PREFERRED_NAME);
        receiver.awaitTermination();

        Assert.assertEquals(List.of("2"), receiver.getLogs());
    }

    // no block(): actions all the time the mailbox is empty
    @Test
    public void testBusyReceiveSpins() throws InterruptedException {
        var receiver = spawnTestAgent(TestBusyReceiveAgent.PREFERRED_NAME, TestBusyReceiveAgent.class);
        spawnTestAgent("delayedSender2", TestDelayedSenderAgent.class, TestBusyReceiveAgent.PREFERRED_NAME);
        receiver.awaitTermination();

        Assert.assertEquals(1, receiver.getLogs().size());
        Assert.assertTrue(Integer.parseInt(receiver.getLogs().get(0)) > 1000);
    }

    // block() suspends the behaviour: the counter goes on
    @Test
    public void testReceiveLetsOthersRun() throws InterruptedException {
        var receiver = spawnTestAgent(TestReceiveAlongsideAgent.PREFERRED_NAME, TestReceiveAlongsideAgent.class);
        spawnTestAgent("delayedSender3", TestDelayedSenderAgent.class, TestReceiveAlongsideAgent.PREFERRED_NAME);
        receiver.awaitTermination();

        Assert.assertEquals(List.of("0", "1", "2", "received"), receiver.getLogs());
    }

    // blockingReceive() suspends the agent: the counter waits
    @Test
    public void testBlockingReceiveStopsOthers() throws InterruptedException {
        var receiver = spawnTestAgent(TestBlockingReceiveAlongsideAgent.PREFERRED_NAME, TestBlockingReceiveAlongsideAgent.class);
        spawnTestAgent("delayedSender4", TestDelayedSenderAgent.class, TestBlockingReceiveAlongsideAgent.PREFERRED_NAME);
        receiver.awaitTermination();

        Assert.assertEquals(List.of("received", "0", "1", "2"), receiver.getLogs());
    }

    @AfterClass
    public static void stopPlatform() {
        JadeTestingUtils.stopPlatform();
    }
}
