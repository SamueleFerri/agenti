package it.unibo.iag.jade.test.agents;

import it.unibo.iag.jade.test.TestingAgent;
import jade.core.behaviours.Behaviour;

import static it.unibo.iag.jade.Behaviours.*;

public class TestParallelOrAgent extends TestingAgent {
    @Override
    public Behaviour mainBehaviour() {
        return sequence(
                any(
                        sequence(
                                atomic(() -> log("a")),
                                atomic(() -> log("b")),
                                atomic(() -> log("c"))
                        ),
                        sequence(
                                atomic(() -> log("1")),
                                atomic(() -> log("2")),
                                atomic(() -> log("3")),
                                atomic(() -> log("4")),
                                atomic(() -> log("5"))
                        )
                ),
                stop()
        );
    }
}
