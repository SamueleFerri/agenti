%%%% Functions returning a boolean: the predicate itself is the answer

%% No b_true/b_false argument: the result is whether the call succeeds.

greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).

%% Goals to try, from the deck:
%%
%%   ?- greater(s(zero), s(zero)).      % No
%%   ?- greater(s(s(zero)), s(zero)).   % Yes
