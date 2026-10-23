package it.unibo.iag.jade;

import jade.lang.acl.ACLMessage;

public enum Performative {
    ACCEPT_PROPOSAL(ACLMessage.ACCEPT_PROPOSAL),
    AGREE(ACLMessage.AGREE),
    CANCEL(ACLMessage.CANCEL),
    CFP(ACLMessage.CFP),
    CONFIRM(ACLMessage.CONFIRM),
    DISCONFIRM(ACLMessage.DISCONFIRM),
    FAILURE(ACLMessage.FAILURE),
    INFORM(ACLMessage.INFORM),
    INFORM_IF(ACLMessage.INFORM_IF),
    INFORM_REF(ACLMessage.INFORM_REF),
    NOT_UNDERSTOOD(ACLMessage.NOT_UNDERSTOOD),
    PROPOSE(ACLMessage.PROPOSE),
    QUERY_IF(ACLMessage.QUERY_IF),
    QUERY_REF(ACLMessage.QUERY_REF),
    REFUSE(ACLMessage.REFUSE),
    REJECT_PROPOSAL(ACLMessage.REJECT_PROPOSAL),
    REQUEST(ACLMessage.REQUEST),
    REQUEST_WHEN(ACLMessage.REQUEST_WHEN),
    REQUEST_WHENEVER(ACLMessage.REQUEST_WHENEVER),
    SUBSCRIBE(ACLMessage.SUBSCRIBE),
    PROXY(ACLMessage.PROXY),
    PROPAGATE(ACLMessage.PROPAGATE),
    UNKNOWN(ACLMessage.UNKNOWN);

    private final int jadeValue;

    Performative(int jadeValue) {
        this.jadeValue = jadeValue;
    }

    public int getJadeValue() {
        return jadeValue;
    }
}
