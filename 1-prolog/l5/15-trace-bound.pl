%%%% Metainterpretation to track and constrain computations: solveT/3

% solveT(+Goal, -Trace, -SizeBound)
solveT(G, T, B) :- solveT(G, T, B, _).
solveT(true, [], N, N) :- !.
solveT((A,B), L, IN, ON) :- !,
   solveT(A, LA, IN, ON1),
   findall( (X,B), member(X,LA), LL),
   solveT(B, LB, ON1, ON),
   append(LL, LB, L).
solveT(G, [G|T], I, O) :-
    I > 0, !, clause(G,B), I2 is I-1, solveT(B,T, I2, O).

% search/2, from 10-vanilla.pl
search(E,[E|_]).
search(E,[_|T]) :- search(E,T).

%% Goal to try, from the deck:
%%
%%   ?- solveT(search(X,[10,20,30]), T, 2).
%%     — X/10, T/[search(10,[10,20,30])]
%%     — X/20, T/[search(20,[10,20,30]),search(20,[20,30])]
%%     — no
