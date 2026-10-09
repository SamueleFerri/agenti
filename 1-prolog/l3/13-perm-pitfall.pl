%%%% Full relationality pitfalls: permutation(L, [a,b])

% member2(List, Elem, ListWithoutElem)
member2([X | Xs], X, Xs).
member2([X | Xs], E, [X|Ys]) :- member2(Xs, E, Ys).

% permutation(Ilist, Olist)
permutation([], []).
permutation(Xs, [X | Ys]) :-
    member2(Xs, X, Zs), permutation(Zs, Ys).

%% Goal to try, the root of the deck's tree:
%%
%%   ?- permutation(L, [a,b]).
%%     — L/[a,b]; ... (to infinity)
