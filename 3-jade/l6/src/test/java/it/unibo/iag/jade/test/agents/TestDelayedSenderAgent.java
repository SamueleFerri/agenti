package it.unibo.iag.jade.test.agents;

import it.unibo.iag.jade.Performative;
import it.unibo.iag.jade.test.TestingAgent;
import jade.core.behaviours.Behaviour;
import jade.core.behaviours.WakerBehaviour;

import static it.unibo.iag.jade.Behaviours.*;
import static it.unibo.iag.jade.Messages.localAID;

// Sends one message to the agent named by its argument, after DELAY ms
public class TestDelayedSenderAgent extends TestingAgent {

    public static final long DELAY = 500L;

    @Override
    public Behaviour mainBehaviour() {
        var receiver = getArguments()[0].toString();
        return sequence(
                new WakerBehaviour(this, DELAY) { },
                sendMessage(Performative.INFORM, "message", localAID(receiver)),
                stop()
        );
    }
}
