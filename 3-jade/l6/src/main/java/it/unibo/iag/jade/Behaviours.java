package it.unibo.iag.jade;

import it.unibo.iag.jade.impl.*;
import jade.core.AID;
import jade.core.behaviours.Behaviour;
import jade.core.behaviours.OneShotBehaviour;
import jade.core.behaviours.ParallelBehaviour;
import jade.core.behaviours.SequentialBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

import java.util.function.Consumer;
import java.util.function.Supplier;

import static it.unibo.iag.jade.Messages.message;

public class Behaviours {

    private Behaviours() {
        throw new IllegalStateException(
                String.format(
                        "Class %s cannot be instantiated: it can only contain static methods",
                        Behaviours.class
                )
        );
    }

    public static Behaviour atomic(Runnable action) {
        return new OneShotBehaviour() {
            @Override
            public void action() {
                action.run();
            }
        };
    }

    public static Behaviour sequence(Behaviour behaviour, Behaviour... behaviours) {
        var sequence = new SequentialBehaviour();
        sequence.addSubBehaviour(behaviour);
        for (var b : behaviours) {
            sequence.addSubBehaviour(b);
        }
        return sequence;
    }

    private static Behaviour parallel(int endCondition, Behaviour behaviour, Behaviour... behaviours) {
        var parallel = new ParallelBehaviour(endCondition);
        parallel.addSubBehaviour(behaviour);
        for (var b : behaviours) {
            parallel.addSubBehaviour(b);
        }
        return parallel;
    }

    public static Behaviour any(Behaviour behaviour, Behaviour... behaviours) {
        return parallel(ParallelBehaviour.WHEN_ANY, behaviour, behaviours);
    }

    public static Behaviour all(Behaviour behaviour, Behaviour... behaviours) {
        return parallel(ParallelBehaviour.WHEN_ALL, behaviour, behaviours);
    }

    public static Behaviour stop() {
        return new Stop();
    }

    public static Behaviour sendMessage(Supplier<ACLMessage> message) {
        return new Send() {
            @Override
            public ACLMessage getMessage() {
                return message.get();    // built when sent, not when composed
            }
        };
    }

    public static Behaviour sendMessage(ACLMessage message) {
        return sendMessage(() -> message);
    }

    public static Behaviour sendMessage(Performative performative, Supplier<String> content, AID receiver, AID... otherReceivers) {
        return sendMessage(() -> message(performative, content, receiver, otherReceivers));
    }

    public static Behaviour sendMessage(Performative performative, String content, AID receiver, AID... otherReceivers) {
        return sendMessage(message(performative, content, receiver, otherReceivers));
    }

    public static Behaviour receiveMessage(Consumer<ACLMessage> messageReceived) {
        return receiveMessage(MessageTemplate.MatchAll(), messageReceived);
    }

    public static Behaviour receiveMessage(MessageTemplate template, Consumer<ACLMessage> messageReceived) {
        return new Receive(template) {
            @Override
            public void onMessageReceived(ACLMessage message) {
                messageReceived.accept(message);
            }
        };
    }

    public static Behaviour listen(Consumer<ACLMessage> messageReceived) {
        return listen(MessageTemplate.MatchAll(), messageReceived);
    }

    public static Behaviour listen(MessageTemplate template, Consumer<ACLMessage> messageReceived) {
        return new Listen(template) {
            @Override
            public void onMessageReceived(ACLMessage message) {
                messageReceived.accept(message);
            }
        };
    }

    public static Behaviour repeatWhile(Behaviour behaviour, Supplier<Boolean> condition) {
        return new DoWhile(behaviour) {
            @Override
            public boolean condition() {
                return condition.get();
            }
        };
    }

    public static Behaviour repeatForEver(Behaviour behaviour) {
        return repeatWhile(behaviour, () -> true);
    }
}
