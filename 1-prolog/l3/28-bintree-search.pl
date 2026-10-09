%%%% Binary trees: searching elements

% search(+Tree, +Elem)
% relates a tree with any of its elements
search(tree(_, E, _), E).
search(tree(L, _, _), E) :- search(L, E).
search(tree(_, _, R), E) :- search(R, E).

%% Goal to try, from the deck:
%%
%%   ?- search( tree(tree(nil, 10, nil), 20,
%%                   tree(tree(nil, 30, nil), 40, nil)), E ).
%%     — E/20; E/10; E/40; E/30
