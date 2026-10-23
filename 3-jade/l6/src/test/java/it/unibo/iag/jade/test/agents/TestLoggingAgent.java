package it.unibo.iag.jade.test.agents;

import it.unibo.iag.jade.test.TestingAgent;
import jade.core.behaviours.Behaviour;

import static it.unibo.iag.jade.Behaviours.*;

public class TestLoggingAgent extends TestingAgent {
    @Override
    public Behaviour mainBehaviour() {
        return sequence(
                atomic(() -> log("hello")),
                stop()
        );
    }
}
