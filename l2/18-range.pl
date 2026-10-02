%%%% Multiple results: resolution itself is the lazy list

%% One goal, many solutions, produced by backtracking rather than by
%% returning a structure.

range(N1, _, N1).
range(N1, N2, N) :- greater(N2, N1), range(s(N1), N2, N).

%% greater/2 is not in this listing on the deck — it is the one of
%% 16-greater.pl, repeated here so that the file runs on its own.
greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).

%% Goal to try, from the deck:
%%
%%   ?- range(zero, s(s(s(zero))), N).
%%     — {N/zero}; {N/s(zero)}; {N/s(s(zero))}; {N/s(s(s(zero)))}
%%       the bound itself is a solution: range(N1, N2, N1) matches when
%%       the counter has reached N2, and greater/2 fails only after that
