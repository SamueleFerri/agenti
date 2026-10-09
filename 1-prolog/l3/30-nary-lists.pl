%%%% N-ary trees with lists: searchN/2

% searchN(+Tree,?Elem), search Elem in Tree
searchN(tree(E,_), E).
searchN(tree(_,L),E) :- member(T, L), searchN(T, E).

%% Goal to try, from the deck:
%%
%%   ?- searchN( tree(20, [tree(10, []),
%%                         tree(40, [tree(30, [])])]), E).
%%     — E/20; E/10; E/40; E/30
