%%%% Searching solutions with join/3

% join(List1, List2, List)
% relate List1 and List2 with their concatenation
join([], L, L).
join([H | T], L, [H | T2]) :- join(T, L, T2).

%% Goal to try, the root of the deck's tree:
%%
%%   ?- join(L1, L2, [a,b,c]).
%%     — L1/[], L2/[a,b,c]; L1/[a], L2/[b,c];
%%       L1/[a,b], L2/[c]; L1/[a,b,c], L2/[]
