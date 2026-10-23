package it.unibo.iag.jade.test.agents;

import it.unibo.iag.jade.test.TestingAgent;
import jade.core.behaviours.Behaviour;

import static it.unibo.iag.jade.Behaviours.*;

// A receive and a counter, side by side
public class TestReceiveAlongsideAgent extends TestingAgent {

    public static final String PREFERRED_NAME = "testReceiveAlongsideAgent";

    private int i = 0;

    @Override
    public Behaviour mainBehaviour() {
        return sequence(
                all(
                        receiveMessage(msg -> log("received")),
                        repeatWhile(atomic(() -> log("%d", i++)), () -> i < 3)
                ),
                stop()
        );
    }
}
