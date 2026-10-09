%%%% Cut motivation: solution of merge/3

% merge(+List1,+List2,-OutList)
% merge two sorted lists
merge(Xs, [], Xs) :- !.
merge([], Ys, Ys).
merge([X|Xs], [Y|Ys], [X|Zs]) :-
    X<Y, !, merge(Xs, [Y|Ys], Zs).
merge([X|Xs], [Y|Ys], [Y|Zs]) :-
    merge([X|Xs], Ys, Zs).

%% Goals to try, from the deck:
%%
%%   ?- merge([],[],L).
%%     — L/[]
%%   ?- merge([10,20],[5,35],L).
%%     — L/[5,10,20,35]
