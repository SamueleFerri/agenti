package it.unibo.iag.jade.test.agents;

import it.unibo.iag.jade.impl.Receive;
import it.unibo.iag.jade.test.TestingAgent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import static it.unibo.iag.jade.Behaviours.*;

public class TestReceiveActionsAgent extends TestingAgent {

    public static final String PREFERRED_NAME = "testReceiveActionsAgent";

    private int actions = 0;

    @Override
    public Behaviour mainBehaviour() {
        return sequence(
                new Receive(MessageTemplate.MatchAll()) {
                    @Override
                    public void action() {
                        actions++;
                        super.action();
                    }

                    @Override
                    public void onMessageReceived(ACLMessage message) {
                        log("%d", actions);
                    }
                },
                stop()
        );
    }
}
