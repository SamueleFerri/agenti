package it.unibo.iag.jade.pitfalls;

import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import java.util.Objects;

// blockingReceive() inside a behaviour: it suspends the agent's thread,
// so every other behaviour of the agent waits too
public class BlockingReceive extends OneShotBehaviour {

    private final MessageTemplate template;

    public BlockingReceive(MessageTemplate template) {
        this.template = Objects.requireNonNull(template);
    }

    @Override
    public void action() {
        onMessageReceived(myAgent.blockingReceive(template));
    }

    public void onMessageReceived(ACLMessage message) { /* to be overridden */ }
}
