package it.unibo.iag.jade.impl;

import jade.core.behaviours.SimpleBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import java.util.Objects;

public class Receive extends SimpleBehaviour {

    private final MessageTemplate template;
    private ACLMessage message;

    public Receive(MessageTemplate template) {
        this.template = Objects.requireNonNull(template);
    }

    @Override
    public void action() {
        message = myAgent.receive(template);
        if (message != null) {
            onMessageReceived(message);
        } else {
            block();    // until the next message arrives
        }
    }

    public void onMessageReceived(ACLMessage message) { /* to be overridden */ }

    @Override
    public boolean done() {
        return message != null;    // one message, and done
    }

    @Override
    public void reset() {
        super.reset();
        message = null;    // a repeated Receive waits for a new message
    }
}
