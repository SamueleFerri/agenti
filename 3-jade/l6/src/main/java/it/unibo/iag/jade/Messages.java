package it.unibo.iag.jade;

import jade.core.AID;
import jade.lang.acl.ACLMessage;

import java.util.function.Supplier;

public class Messages {
    private Messages() {
        throw new IllegalStateException(
                String.format(
                        "Class %s cannot be instantiated: it can only contain static methods",
                        Messages.class
                )
        );
    }

    public static AID localAID(String localName) {
        return new AID(localName, false);
    }

    public static AID[] localAIDs(String... localNames) {
        var aids = new AID[localNames.length];
        for (int i = 0; i < localNames.length; i++) {
            aids[i] = localAID(localNames[i]);
        }
        return aids;
    }

    public static AID globalAID(String globalName) {
        return new AID(globalName, AID.ISGUID);
    }

    public static ACLMessage message(Performative performative, String content, AID receiver, AID... otherReceivers) {
        return message(performative, () -> content, receiver, otherReceivers);
    }

    public static ACLMessage message(Performative performative, Supplier<String> content, AID receiver, AID... otherReceivers) {
        var message = new ACLMessage(performative.getJadeValue());
        message.setContent(content.get());
        message.addReceiver(receiver);
        for (var r : otherReceivers) {
            message.addReceiver(r);
        }
        return message;
    }
}
