%%%% Example 1: the parent/child knowledge base

parent(joey,luca).
parent(joey,simone).
parent(lino,joey).
parent(mirella,joey).

%% Goals to try, from the deck:
%%
%%   :- parent(joey,luca).
%%   :- parent(joey,lino).
%%   :- parent(joey,Child).
%%   :- parent(Parent,joey).
%%   :- parent(Parent,Child).
%%   :- parent(Grandparent,Parent), parent(Parent,Child).
