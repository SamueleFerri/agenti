%%%% Example 2: a rule to infer siblings

parent(joey,luca).
parent(joey,simone).
parent(lino,joey).
parent(mirella,joey).

sibling(S1,S2) :-
    parent(P,S1),
    parent(P,S2),
    S1 \= S2.

%% Goals to try, from the deck:
%%
%%   ?- sibling(simone,luca).
%%   ?- sibling(lino,joey).
%%   ?- sibling(luca,Sibling).
%%   ?- sibling(Sibling,luca).
%%   ?- sibling(joey,Sibling).
%%   ?- sibling(Sibling1,Sibling2).
