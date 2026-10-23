package it.unibo.iag.jade.test.agents;

import it.unibo.iag.jade.pitfalls.BusyReceive;
import it.unibo.iag.jade.test.TestingAgent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import static it.unibo.iag.jade.Behaviours.*;

public class TestBusyReceiveAgent extends TestingAgent {

    public static final String PREFERRED_NAME = "testBusyReceiveAgent";

    @Override
    public Behaviour mainBehaviour() {
        return sequence(
                new BusyReceive(MessageTemplate.MatchAll()) {
                    @Override
                    public void onMessageReceived(ACLMessage message) {
                        log("%d", getActions());
                    }
                },
                stop()
        );
    }
}
