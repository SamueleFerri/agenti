package it.unibo.iag.jade.impl;

import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;

public abstract class Send extends OneShotBehaviour {
    @Override
    public void action() {
        myAgent.send(getMessage());
    }

    public abstract ACLMessage getMessage();
}
