%%%% Metainterpretation with built-ins and control: solveB/1

solveB(true) :- !.
solveB((A,B)) :- !, solveB(A), solveB(B).
solveB(X is E) :- !, X is E.             % built-ins, one by one
solveB(X = Y) :- !, X = Y.
solveB(X \= Y) :- !, X \= Y.
solveB(X == Y) :- !, X == Y.             % possibly more
solveB(once(G)) :- !, once(solveB(G)).   % handling once/1
solveB(not(G)) :- !, not(solveB(G)).     % handling not/1
solveB(G) :- clause(G,B), solveB(B).

sum([], 0).
sum([H|T], N) :- sum(T,N2), N is N2+H.

%% Goals to try, from the deck:
%%
%%   ?- solveB( sum([10,20,30], S) ).          % Yes S/60
%%   ?- solveB( not(sum([10,20,30], 50)) ).    % Yes
%%   ?- solveB( not(sum([10,20,30], 60)) ).    % No
