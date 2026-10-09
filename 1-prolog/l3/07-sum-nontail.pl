%%%% Non-tail recursion with sum/2 (foldleft-like)

% sum(List,Sum)
% relate a List of numbers with the sum of its elements
sum([], 0).
sum([H|T], N) :- sum(T, N2), N is H + N2.

%% Goals to try, from the deck:
%%
%%   ?- sum([10,20,30], S).   % S/60
%%   ?- sum([], S).           % S/0
%%   ?- sum([10,20,30], 60).  % Yes
