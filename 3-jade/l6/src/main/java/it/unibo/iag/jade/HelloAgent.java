package it.unibo.iag.jade;

import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.core.behaviours.CyclicBehaviour;
import jade.core.behaviours.OneShotBehaviour;
import jade.core.behaviours.TickerBehaviour;

public class HelloAgent extends Agent {
    private int i;

    @Override
    protected void setup() {
        addBehaviour(oneShotBehaviour());
//        addBehaviour(cyclicBehaviour());
//        addBehaviour(periodicBehaviour(+1));
//        addBehaviour(periodicBehaviour(-1));
    }

    private Behaviour oneShotBehaviour() {
        return new OneShotBehaviour() {
            @Override
            public void action() {
                log("Hello world!");
            }
        };
    }

    private Behaviour cyclicBehaviour() {
        return new CyclicBehaviour() {
            int i = 0;

            @Override
            public void action() {
                log("Hello World %d", i++);
            }
        };
    }

    private Behaviour periodicBehaviour(int delta) {
        return new TickerBehaviour(this, 2000L) {
            int i = 0;

            @Override
            protected void onTick() {
                log("Periodic Hello World %d", i);
                i += delta;
            }
        };
    }

    private void log(final String format, Object... args) {
        System.out.println("[" + getAID().getLocalName() + "]: " + String.format(format, args));
    }
}
