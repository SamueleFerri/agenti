%%%% Tail recursion with sum/2 (foldleft-like)

% sum(List,Sum)
% relate a List of numbers with the sum of its elements
sum(L, S) :- sum(L, 0, S).
sum([], S, S).
sum([H|T], N, S) :- N2 is H + N, sum(T, N2, S).

%% Goals to try, from the deck:
%%
%%   ?- sum([10,20,30], S).   % S/60
%%   ?- sum([], S).           % S/0
%%   ?- sum([10,20,30], 60).  % Yes
