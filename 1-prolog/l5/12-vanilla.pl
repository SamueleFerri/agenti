%%%% The vanilla metainterpreter: solveV/1

solveV(true) :- !.
solveV((A,B)) :- !, solveV(A), solveV(B).
solveV(G) :- clause(G, B), solveV(B).

search(E,[E|_]).
search(E,[_|T]) :- search(E,T).

%% Goal to try, from the deck:
%%
%%   ?- solveV(search(X,[10,20,30])). % X/10; X/20; X/30
