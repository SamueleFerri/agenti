package it.unibo.iag.jade.impl;

import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import java.util.Objects;

public class Listen extends CyclicBehaviour {

    private final MessageTemplate template;

    public Listen(MessageTemplate template) {
        this.template = Objects.requireNonNull(template);
    }

    @Override
    public void action() {
        var message = myAgent.receive(template);
        if (message != null) {
            onMessageReceived(message);
        } else {
            block();    // until the next message arrives
        }
    }

    public void onMessageReceived(ACLMessage message) { /* to be overridden */ }
}
