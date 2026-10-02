%%%% N-ary trees with variable arguments: searchV/2

% searchV(+Tree,?Elem), search Elem in Tree
searchV(T, E) :- T =.. [tree, E | _].
searchV(T, E) :-
    T =.. [tree, _ | L], member(T2, L), searchV(T2, E).

%% Goal to try, from the deck:
%%
%%   ?- searchV( tree(20, tree(10), tree(40, tree(30))), E).
%%     — E/20; E/10; E/40; E/30
