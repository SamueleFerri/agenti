%%%% Immutability and sharing: update/4

% update(List1, E1, E2, List2)
% relate List1 with a List2 where first occurrence
% of E1 is updated with E2
update([], _, _, []).
update([E1 | T], E1, E2, [E2 | T]).
update([H1 | T1], E1, E2, [H1 | T2]) :-
    update(T1, E1, E2, T2).

%% Goal to try, from the deck:
%%
%%   ?- update([10,20,30,40],20,21,L). % L/[10,21,30,40]
