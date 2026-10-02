%%%% Operators: op/3

% use as predicate
:- op(100,xfx,'~').

N1 ~ N2 :- N1 > N2, !, Delta is N1 - N2, Delta < 0.1.
N1 ~ N2 :- N2 ~ N1.

% use as functor
:- op(100,xfy,'::').

to_list(A :: B, [A | B2]) :- to_list(B, B2).
to_list(nil, []).

%% Goals to try, from the deck:
%%
%%   ?- 10 ~ 10.01.                        % Yes
%%   ?- to_list(10 :: 20 :: 30 :: nil, L). % L/[10,20,30]
