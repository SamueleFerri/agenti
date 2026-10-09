%%%% Wrap-up on terminology: element/2 over cons/nil lists

element(E, cons(E, _)).
element(E, cons(_, T)) :- element(E, T).

%% Goal to try, from the deck:
%%
%%   ?- element(b, cons(a, cons(b, cons(c, nil)))). % Yes; No
