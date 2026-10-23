package it.unibo.iag.jade.test;

import jade.core.Agent;
import jade.core.behaviours.Behaviour;

import java.time.Duration;
import java.util.*;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

public abstract class TestingAgent extends Agent {

    private static final Duration MAX_WAIT = Duration.ofSeconds(3);
    private static final Map<String, TestingAgent> INSTANCES = Collections.synchronizedMap(new TreeMap<>());

    public static TestingAgent getInstanceByName(String name) throws InterruptedException {
        Objects.requireNonNull(name);
        synchronized (INSTANCES) {
            while (!INSTANCES.containsKey(name)) {
                INSTANCES.wait();
            }
            return INSTANCES.get(name);
        }
    }

    // a new platform must not find the agents of the previous one
    public static void forgetInstances() {
        synchronized (INSTANCES) {
            INSTANCES.clear();
        }
    }

    public static void indexInstanceByName(TestingAgent agent) {
        synchronized (INSTANCES) {
            INSTANCES.put(agent.getName(), agent);
            INSTANCES.put(agent.getLocalName(), agent);
            INSTANCES.notifyAll();
        }
    }

    private final Semaphore terminationSignal = new Semaphore(0);
    private final List<String> logs = Collections.synchronizedList(new LinkedList<>());

    protected final void log(final String format, Object... args) {
        logs.add(String.format(format, args));
        System.out.println("[" + getAID().getLocalName() + "]: " + String.format(format, args));
    }

    public List<String> getLogs() {
        synchronized (logs) {
            return new ArrayList<>(logs);
        }
    }

    public abstract Behaviour mainBehaviour();

    @Override
    protected final void setup() {
        super.setup();
        indexInstanceByName(this);
        addBehaviour(mainBehaviour());
    }

    @Override
    protected final void takeDown() {
        super.takeDown();
        terminationSignal.release();
    }

    public final void awaitTermination() throws InterruptedException {
        terminationSignal.tryAcquire(MAX_WAIT.toMillis(), TimeUnit.MILLISECONDS);
    }
}
