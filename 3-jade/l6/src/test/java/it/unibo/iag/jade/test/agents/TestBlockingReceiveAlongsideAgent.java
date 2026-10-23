package it.unibo.iag.jade.test.agents;

import it.unibo.iag.jade.pitfalls.BlockingReceive;
import it.unibo.iag.jade.test.TestingAgent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import static it.unibo.iag.jade.Behaviours.*;

// The same, with a BlockingReceive in place of the receive
public class TestBlockingReceiveAlongsideAgent extends TestingAgent {

    public static final String PREFERRED_NAME = "testBlockingReceiveAlongsideAgent";

    private int i = 0;

    @Override
    public Behaviour mainBehaviour() {
        return sequence(
                all(
                        new BlockingReceive(MessageTemplate.MatchAll()) {
                            @Override
                            public void onMessageReceived(ACLMessage message) {
                                log("received");
                            }
                        },
                        repeatWhile(atomic(() -> log("%d", i++)), () -> i < 3)
                ),
                stop()
        );
    }
}
