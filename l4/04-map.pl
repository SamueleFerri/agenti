%%%% Solving goals: map/3

% map(+L, +P, LO)

map([], _, []).
map([H|T], P, [H2|T2]) :-                 % 2P-Kt, SWI-Prolog
    G =.. [P,H,H2], once(G), map(T, P, T2).
% map([H|T], P, [H2|T2]) :-               % SWISH
%     once(call(P,H,H2)), map(T, P, T2).

inc(N, N2) :- N2 is N+1.

%% Goal to try, from the deck:
%%
%%   ?- map([10,20,30], inc, L).  % L / [11,21,31]
