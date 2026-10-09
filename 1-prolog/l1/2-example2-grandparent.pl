%%%% Example 2: a rule to infer grandparents

parent(joey,luca).
parent(joey,simone).
parent(lino,joey).
parent(mirella,joey).

grandparent(G,N) :-
    parent(G,P),
    parent(P,N).

%% Goals to try, from the deck:
%%
%%   ?- grandparent(lino,luca).
%%   ?- grandparent(lino,joey).
%%   ?- grandparent(lino,Nephew).
%%   ?- grandparent(Grandparent,simone).
%%   ?- grandparent(Grandparent,Nephew).
