package it.unibo.iag.jade.test.agents;

import it.unibo.iag.jade.test.TestingAgent;
import jade.core.behaviours.Behaviour;

import static it.unibo.iag.jade.Behaviours.*;
import static it.unibo.iag.jade.Messages.localAIDs;
import static it.unibo.iag.jade.Performative.INFORM;
import static jade.lang.acl.MessageTemplate.*;

public class TestMultipleReceiverAgent extends TestingAgent {

    public static final String PREFERRED_NAME = "testMultipleReceiverAgent";

    @Override
    public Behaviour mainBehaviour() {
        return sequence(
                listen(
                        and(
                                MatchPerformative(INFORM.getJadeValue()),
                                MatchReceiver(localAIDs(PREFERRED_NAME))
                        ),
                        msg -> {
                            log("Received `%s` from %s", msg.getContent(), msg.getSender().getLocalName());
                            var i = Integer.parseInt(msg.getContent());
                            if (i >= 10) {
                                addBehaviour(stop());
                            }
                        }
                ),
                stop()
        );
    }
}
