%%%% Another example of cut: quicksort

% quicksort(Ilist,Olist)
quicksort([], []).
quicksort([X | Xs], Ys) :-
   partition(Xs, X, Ls, Bs),
   quicksort(Ls, LOs),
   quicksort(Bs, BOs),
   append(LOs, [X | BOs], Ys).

% partition(Ilist,Pivot,Littles,Bigs)
partition([], _, [], []).
partition([X | Xs], Y, [X | Ls], Bs) :-
    X<Y, !, partition(Xs, Y, Ls, Bs).
partition([X | Xs], Y, Ls, [X | Bs]) :-
    partition(Xs, Y, Ls, Bs).

%% Goals to try, from the deck:
%%
%%   ?- partition([10,3,20,5,30,9,40], 10, L1, L2).
%%     — L1/[3,5,9], L2/[10,20,30,40]
%%   ?- quicksort([60,10,20,50,30,40],L).
%%     — L/[10,20,30,40,50,60]
