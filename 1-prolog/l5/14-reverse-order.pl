%%%% Metainterpretation altering order of solutions: solveI/1

solveI(true) :- !.
solveI((A,B)) :- !, solveI(A), solveI(B).
solveI(G) :-
  findall(c(G, B), clause(G, B), L),
  reverse(L, L2),   % inverting solutions!!
  member(c(G, B), L2),
  solveI(B).

% search/2, from 10-vanilla.pl
search(E,[E|_]).
search(E,[_|T]) :- search(E,T).

%% Goal to try, from the deck:
%%
%%   ?- solveI(search(X,[10,20,30])). % X/30; X/20; X/10
