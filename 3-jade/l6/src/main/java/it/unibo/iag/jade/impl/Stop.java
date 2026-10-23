package it.unibo.iag.jade.impl;

import jade.core.behaviours.OneShotBehaviour;

public class Stop extends OneShotBehaviour {
    @Override
    public void action() {
        myAgent.doDelete();    // the agent, not just this behaviour
    }
}
