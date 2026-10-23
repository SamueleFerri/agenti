package it.unibo.iag.jade.pitfalls;

import it.unibo.iag.jade.Performative;
import jade.core.Agent;
import jade.lang.acl.MessageTemplate;

import static it.unibo.iag.jade.Behaviours.*;
import static it.unibo.iag.jade.Messages.localAID;

// Pinger, with its loop a CompositeDoWhile: one ping, one pong, and it hangs
public class CompositeLoopPinger extends Agent {
    @Override
    protected void setup() {
        addBehaviour(new CompositeDoWhile(sequence(
                sendMessage(Performative.INFORM, "ping", localAID("ponger")),
                receiveMessage(pongMessageTemplate(), msg ->
                        log("Received `%s` from %s", msg.getContent(), msg.getSender().getLocalName()))
        )) {
            @Override
            public boolean condition() {
                return true;
            }
        });
    }

    private MessageTemplate pongMessageTemplate() {
        return MessageTemplate.MatchPerformative(Performative.INFORM.getJadeValue());
    }

    private void log(final String format, Object... args) {
        System.out.println("[" + getAID().getLocalName() + "]: " + String.format(format, args));
    }
}
