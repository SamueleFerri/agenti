package it.unibo.iag.jade.impl;

import jade.core.behaviours.Behaviour;
import jade.core.behaviours.SerialBehaviour;
import jade.util.leap.ArrayList;
import jade.util.leap.Collection;

import java.util.Objects;

// SerialBehaviour, not CompositeBehaviour: it passes restarts on to the child
public abstract class DoWhile extends SerialBehaviour {

    private final Behaviour behaviour;

    public DoWhile(Behaviour behaviour) {
        this.behaviour = Objects.requireNonNull(behaviour);
    }

    @Override
    protected void scheduleFirst() { /* does nothing */ }

    @Override
    protected void scheduleNext(boolean b, int i) { /* does nothing */ }

    @Override
    protected boolean checkTermination(boolean currentDone, int currentResult) {
        if (!currentDone) {
            return false;
        }
        if (condition()) {
            behaviour.reset();    // run it again from the start
            return false;
        }
        return true;
    }

    public abstract boolean condition();

    @Override
    protected Behaviour getCurrent() {
        return behaviour;
    }

    @Override
    public Collection getChildren() {
        var list = new ArrayList();
        list.add(behaviour);
        return list;
    }
}