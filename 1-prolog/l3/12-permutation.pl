%%%% Searching solutions: permutation/2

% member2(List, Elem, ListWithoutElem)
member2([X | Xs], X, Xs).
member2([X | Xs], E, [X|Ys]) :- member2(Xs, E, Ys).

% permutation(Ilist, Olist)
permutation([], []).
permutation(Xs, [X | Ys]) :-
    member2(Xs, X, Zs), permutation(Zs, Ys).

%% Goal to try, the root of the deck's tree:
%%
%%   ?- permutation([a,b,c], L).
%%     — L/[a,b,c]; L/[a,c,b]; L/[b,a,c]; L/[b,c,a]; L/[c,a,b]; L/[c,b,a]
