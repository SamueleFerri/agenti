package it.unibo.iag.jade.exercise;

import it.unibo.iag.jade.Performative;
import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import static it.unibo.iag.jade.Behaviours.*;
import static it.unibo.iag.jade.Messages.localAID;

// As Ponger does: the first ping, then a ping in answer to every pong
public class ReactivePinger extends Agent {
    @Override
    protected void setup() {
        addBehaviour(sequence(
                sendMessage(Performative.INFORM, "ping", localAID("ponger")),
                listen(pongMessageTemplate(), msg -> {
                    log("Received `%s` from %s", msg.getContent(), msg.getSender().getLocalName());
                    addBehaviour(sendPing(msg));
                })
        ));
    }

    private Behaviour sendPing(ACLMessage pong) {
        return sendMessage(Performative.INFORM, "ping", pong.getSender());
    }

    private MessageTemplate pongMessageTemplate() {
        return MessageTemplate.MatchPerformative(Performative.INFORM.getJadeValue());
    }

    private void log(final String format, Object... args) {
        System.out.println("[" + getAID().getLocalName() + "]: " + String.format(format, args));
    }
}
