%%%% Tail recursion with join/3 (foldright-like)

% join(List1, List2, List)
% relate List1 and List2 with their concatenation
join([], L, L).
join([H | T], L, [H | T2]) :- join(T, L, T2).

%% Goal to try, from the deck:
%%
%%   ?- join([10,20],[30,40,50],L). % L/[10,20,30,40,50]
