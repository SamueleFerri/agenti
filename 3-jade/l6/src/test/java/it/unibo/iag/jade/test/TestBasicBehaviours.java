package it.unibo.iag.jade.test;

import it.unibo.iag.jade.test.agents.*;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import static it.unibo.iag.jade.test.JadeTestingUtils.spawnTestAgent;

public class TestBasicBehaviours {
    @BeforeClass
    public static void startPlatform() {
        JadeTestingUtils.startNewPlatform();
    }

    @Test
    public void testLogging() throws InterruptedException {
        var agent = spawnTestAgent("testLoggingAgent", TestLoggingAgent.class);
        agent.awaitTermination();

        Assert.assertEquals(
                List.of("hello"),
                agent.getLogs()
        );
    }

    @Test
    public void testSequential() throws InterruptedException {
        var agent = spawnTestAgent("testSequentialAgent", TestSequentialAgent.class);
        agent.awaitTermination();

        Assert.assertEquals(
                List.of("a", "b", "c"),
                agent.getLogs()
        );
    }

    @Test
    public void testParallelAnd() throws InterruptedException {
        var agent = spawnTestAgent("testParallelAndAgent", TestParallelAndAgent.class);
        agent.awaitTermination();

        Assert.assertEquals(
                List.of("a", "1", "b", "2", "c", "3", "4", "5"),
                agent.getLogs()
        );
    }

    @Test
    public void testParallelOr() throws InterruptedException {
        var agent = spawnTestAgent("testParallelOrAgent", TestParallelOrAgent.class);
        agent.awaitTermination();

        Assert.assertEquals(
                List.of("a", "1", "b", "2", "c"),
                agent.getLogs()
        );
    }

    @Test
    public void testDoWhile() throws InterruptedException {
        var agent = spawnTestAgent("testDoWhileAgent", TestDoWhileAgent.class);
        agent.awaitTermination();

        Assert.assertEquals(
                IntStream.range(0, 10).boxed().flatMap(i -> Stream.of(i, i * 2)).map(Objects::toString).collect(Collectors.toList()),
                agent.getLogs()
        );
    }

    @Test
    public void testSendReceive() throws InterruptedException {
        var receiver = spawnTestAgent(TestReceiverAgent.PREFERRED_NAME, TestReceiverAgent.class);
        var sender = spawnTestAgent(TestSenderAgent.PREFERRED_NAME, TestSenderAgent.class);

        receiver.awaitTermination();

        Assert.assertEquals(
                List.of(String.format("Received `%s` from %s", TestSenderAgent.CONTENT, TestSenderAgent.PREFERRED_NAME)),
                receiver.getLogs()
        );

        sender.awaitTermination();

        Assert.assertEquals(
                List.of(String.format("Sent `%s` to %s", TestSenderAgent.CONTENT, TestReceiverAgent.PREFERRED_NAME)),
                sender.getLogs()
        );
    }

    @Test
    public void testMultipleSendReceive() throws InterruptedException {
        var receiver = spawnTestAgent(TestMultipleReceiverAgent.PREFERRED_NAME, TestMultipleReceiverAgent.class);
        var sender = spawnTestAgent(TestMultipleSenderAgent.PREFERRED_NAME, TestMultipleSenderAgent.class);

        receiver.awaitTermination();

        Assert.assertEquals(
                IntStream.range(0, 10)
                        .mapToObj(i -> String.format("Received `%d` from %s", i, TestMultipleSenderAgent.PREFERRED_NAME))
                        .collect(Collectors.toList()),
                receiver.getLogs()
        );

        sender.awaitTermination();

        Assert.assertEquals(
                IntStream.range(0, 10)
                        .mapToObj(i -> String.format("Sent `%d` to %s", i, TestMultipleReceiverAgent.PREFERRED_NAME))
                        .collect(Collectors.toList()),
                sender.getLogs()
        );
    }

    @AfterClass
    public static void stopPlatform() {
        JadeTestingUtils.stopPlatform();
    }
}
