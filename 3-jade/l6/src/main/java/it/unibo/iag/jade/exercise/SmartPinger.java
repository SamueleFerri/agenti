package it.unibo.iag.jade.exercise;

import it.unibo.iag.jade.Performative;
import it.unibo.iag.jade.impl.Send;
import jade.core.Agent;
import jade.domain.AMSService;
import jade.domain.FIPAAgentManagement.AMSAgentDescription;
import jade.domain.FIPAAgentManagement.SearchConstraints;
import jade.domain.FIPAException;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import static it.unibo.iag.jade.Behaviours.*;

// The ponger's name is not known: the first ping goes to every agent the AMS
// knows of, and from then on the ping answers whoever sent the pong
public class SmartPinger extends Agent {
    @Override
    protected void setup() {
        addBehaviour(sequence(
                new Send() {
                    @Override
                    public ACLMessage getMessage() {
                        return pingEveryone();
                    }
                },
                listen(pongMessageTemplate(), msg -> {
                    log("Received `%s` from %s", msg.getContent(), msg.getSender().getLocalName());
                    addBehaviour(sendMessage(Performative.INFORM, "ping", msg.getSender()));
                })
        ));
    }

    private ACLMessage pingEveryone() {
        var ping = new ACLMessage(Performative.INFORM.getJadeValue());
        ping.setContent("ping");
        for (var agent : allAgents()) {
            if (!agent.getName().equals(getAID())) {
                ping.addReceiver(agent.getName());
            }
        }
        return ping;
    }

    // The AMS: the white pages of the platform
    private AMSAgentDescription[] allAgents() {
        var constraints = new SearchConstraints();
        constraints.setMaxResults(-1L);    // all of them, not just the first
        try {
            return AMSService.search(this, new AMSAgentDescription(), constraints);
        } catch (FIPAException e) {
            throw new IllegalStateException(e);
        }
    }

    private MessageTemplate pongMessageTemplate() {
        return MessageTemplate.MatchPerformative(Performative.INFORM.getJadeValue());
    }

    private void log(final String format, Object... args) {
        System.out.println("[" + getAID().getLocalName() + "]: " + String.format(format, args));
    }
}
