package it.unibo.iag.jade.test.agents;

import it.unibo.iag.jade.Performative;
import it.unibo.iag.jade.test.TestingAgent;
import jade.core.behaviours.Behaviour;

import static it.unibo.iag.jade.Behaviours.*;
import static it.unibo.iag.jade.Messages.localAID;

public class TestMultipleSenderAgent extends TestingAgent {

    public static final String PREFERRED_NAME = "testMultipleSenderAgent";

    private int i = 0;

    @Override
    public Behaviour mainBehaviour() {
        return sequence(
                repeatWhile(
                        sequence(
                                sendMessage(Performative.INFORM, () -> String.valueOf(i), localAID(TestMultipleReceiverAgent.PREFERRED_NAME)),
                                atomic(() -> log("Sent `%s` to %s", String.valueOf(i), TestMultipleReceiverAgent.PREFERRED_NAME)),
                                atomic(() -> i++)
                        ),
                        () -> i < 10
                ),
                stop()
        );
    }
}
