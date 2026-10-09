%%%% N queens on an N x N board

:- use_module(library(clpfd)).

%% Qs is a list of N variables, Qs[i] being the row of the queen in
%% column i.  The model is the one in the library(clpfd) manual.

n_queens(N, Qs) :-
    length(Qs, N),
    Qs ins 1..N,
    safe_queens(Qs).

safe_queens([]).
safe_queens([Q|Qs]) :-
    safe_queens(Qs, Q, 1),
    safe_queens(Qs).

safe_queens([], _, _).
safe_queens([Q|Qs], Q0, D0) :-
    Q0 #\= Q,
    abs(Q0 - Q) #\= D0,
    D1 #= D0 + 1,
    safe_queens(Qs, Q0, D1).

%% Goals to try, from the deck:
%%
%%   ?- n_queens(8, Qs), label(Qs).
%%   ?- n_queens(8, Qs), labeling([ff], Qs).
%%   ?- n_queens(24, Qs), labeling([ff], Qs).
%%     — measured on SWI-Prolog 10.0.2: label/1 takes 5.2 s here,
%%       labeling([ff]) 0.003 s, and ff still answers n = 100 in 0.07 s
%%   ?- aggregate_all(count, (n_queens(6,Qs), label(Qs)), N).
%%     — 4 solutions for the 6 x 6 board
