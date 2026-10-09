%%%% Permutations in logic programming: member/3 and permutation/2

%% member/3 relates a list with any element in it and the rest of the list.
%% Not member/2 of L1: three arguments, and the rest comes back.

member([H|T], H, T).
member([H|T], E, [H|T2]) :- member(T, E, T2).

%% permutation/2 relates a list with any permutation of it

permutation([], []).
permutation(L, [H | TP]) :-
    member(L, H, T),
    permutation(T, TP).

%% Goals to try.  The deck asks none of this program: it says only that
%% "the goal is to seek any permutation of a list".
%%
%%   ?- member([1,2,3], El, Rest).
%%   ?- permutation([1,2,3,4], Perm).
%%   ?- permutation([a,b,c], Perm).
%%   ?- permutation([4,3,2,1], P).
