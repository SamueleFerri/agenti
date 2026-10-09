%%%% Full relationality of find/2 at work

% relates a list with one of its elements
find([E|_],E).
find([_|T],E) :- find(T,E).

%% Not on this slide: the goals below also call position/3 and join/3,
%% from 02-find-position.pl, and sum/3 and mul/3 over Peano numbers, from
%% 1-prolog/l2/15-peano.pl.  Repeated here so the file runs on its own.

position([E|_],zero,E).
position([_|T],s(N),E) :- position(T,N,E).

join([],L,L).
join([H|T],L,[H|M]) :- join(T,L,M).

sum(X, zero, X).
sum(X, s(Y), s(Z)) :- sum(X, Y, Z).

mul(_, zero, zero).
mul(X, s(Y), Z) :- mul(X, Y, W), sum(W, X, Z).

%% Goals to try, from the deck, which leaves the answers to you:
%%
%%   ?- find([a,b,c], E).              % ?
%%   ?- find(L, a).                    % ?
%%   ?- position([a,b,c], N, E).       % ?
%%   ?- join(L, M, [a,b,c]).           % ?
%%   ?- sum(N1, N2, s(s(s(zero)))).    % ?
%%   ?- mul(N1, N2, s(s(s(s(zero))))). % ?
