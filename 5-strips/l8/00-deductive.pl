% poss(S): situation S can be reached
poss(s0).
poss(do(A,S)) :- poss(S), pact(A,S).

% holds(F,S): fluent F is true in situation S
holds(on(a,d),s0).
holds(on(b,e),s0).
holds(on(c,f),s0).
holds(clear(a),s0).
holds(clear(b),s0).
holds(clear(c),s0).
holds(clear(g),s0).
% move(X,Y,Z), block X from Y to Z: its expected effects (EE)
holds(clear(Y),do(move(_,Y,_),_)).
holds(on(X,Z),do(move(X,_,Z),_)).
% frame axiom: every other fluent is left as it was
holds(F,do(move(X,Y,Z),S)) :-
    holds(F,S), F \= clear(Z), F \= on(X,Y).

% pact(A,S): action A can be performed in situation S (FP)
pact(move(X,Y,Z),S) :-
    holds(clear(X),S), holds(clear(Z),S), holds(on(X,Y),S),
    X \= Z.

%% Goals to try, from the deck:
%%
%%   ?- poss(S), holds(on(a,b),S), holds(on(b,g),S).
