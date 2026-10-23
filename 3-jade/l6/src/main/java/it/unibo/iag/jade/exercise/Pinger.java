package it.unibo.iag.jade.exercise;

import it.unibo.iag.jade.Performative;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.MessageTemplate;

import static it.unibo.iag.jade.Behaviours.*;
import static it.unibo.iag.jade.Messages.localAID;

// A loop: send a ping, wait for the pong, and again
public class Pinger extends Agent {
    @Override
    protected void setup() {
        addBehaviour(pingPong());
    }

    private Behaviour pingPong() {
        return repeatForEver(sequence(
                sendMessage(Performative.INFORM, "ping", localAID("ponger")),
                receiveMessage(pongMessageTemplate(), msg ->
                        log("Received `%s` from %s", msg.getContent(), msg.getSender().getLocalName()))
        ));
    }

    private MessageTemplate pongMessageTemplate() {
        return MessageTemplate.MatchPerformative(Performative.INFORM.getJadeValue());
    }

    private void log(final String format, Object... args) {
        System.out.println("[" + getAID().getLocalName() + "]: " + String.format(format, args));
    }
}
