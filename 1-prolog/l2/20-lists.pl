%%%% Programming find, position, concat and count over cons/nil lists

%% relates a list with one of its elements
find(cons(E, _), E).
find(cons(_, T),E) :- find(T, E).

%% relates a list with one of its elements
%% and its Peano position
position(cons(E, _), zero, E).
position(cons(_, T), s(N), E) :- position(T, N, E).

%% relates two lists with their concatenation
%% (similar to append)
concat(nil, L, L).
concat(cons(H, T), L, cons(H, M)) :- concat(T, L, M).

%% relates a list and an element with occurrences
count(nil, _, zero).
count(cons(E, L), E, s(N)) :- count(L, E, N).
count(cons(E, L), E2, N) :- E \= E2, count(L, E2, N).

%% Goals to try, from the deck:
%%
%%   ?- find(cons(a, cons(b, cons(c, nil))), b).           % Yes
%%   ?- find(cons(a, cons(b, cons(c, nil))), d).           % No
%%   ?- position(cons(a, cons(b, cons(c, nil))), zero, a). % Yes
%%   ?- position(cons(a, cons(b, cons(c, nil))), s(zero), b). % Yes
%%   ?- position(cons(a, cons(b, cons(b, nil))), P, b).
%%     — P/s(zero); P/s(s(zero))
%%   ?- concat(cons(a, cons(b, cons(c, nil))), cons(d, nil), L).
%%     — L/cons(a, cons(b, cons(c, cons(d, nil))))
%%   ?- count(cons(a, cons(a, cons(b, cons(a, nil)))), a, N).
%%     — N/s(s(s(zero)))
