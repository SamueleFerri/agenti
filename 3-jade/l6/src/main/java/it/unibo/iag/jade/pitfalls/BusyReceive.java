package it.unibo.iag.jade.pitfalls;

import jade.core.behaviours.SimpleBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import java.util.Objects;

// Receive without block(): it works, but it is scheduled again and again
// while the mailbox is empty—an active wait
public class BusyReceive extends SimpleBehaviour {

    private final MessageTemplate template;
    private ACLMessage message;
    private int actions = 0;

    public BusyReceive(MessageTemplate template) {
        this.template = Objects.requireNonNull(template);
    }

    @Override
    public void action() {
        actions++;
        message = myAgent.receive(template);
        if (message != null) {
            onMessageReceived(message);
        }
    }

    public void onMessageReceived(ACLMessage message) { /* to be overridden */ }

    public int getActions() {
        return actions;
    }

    @Override
    public boolean done() {
        return message != null;
    }
}
