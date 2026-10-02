%%%% Multiple output arguments: many inputs, many outputs

%% No Pair to return: two output arguments, in one fact.

nextprev(s(N), N, s(s(N))).

%% Goals to try, from the deck:
%%
%%   ?- nextprev(s(s(zero)), Prev, Next).
%%     — {Prev/s(zero), Next/s(s(s(zero)))}
%%   ?- nextprev(zero, Prev, Next).
%%     — No
