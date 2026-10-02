%%%% Example 3: element over cons/nil lists

%% Lists built with cons/2 and nil/0 — the L1 [H|T] notation comes later.

%% relates an element E with a list that contains it
element(E, cons(E, _)).
element(E, cons(_, T)) :- element(E, T).

%% Goals to try, from the deck:
%%
%%   ?- element(b, cons(a, cons(b, cons(c, nil)))).    % Yes; No
%%   ?- element(a, cons(a, cons(b, cons(c, nil)))).    % Yes; No
%%   ?- element(40, cons(a, cons(b, cons(c, nil)))).   % No
