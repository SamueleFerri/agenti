%%%% Resolution with unification: the father/grandfather program

%% The program of Examples 1, 2 and 3: the same three clauses, three goals,
%% one resolution step each.

father(abraham, isaac).
father(terach, abraham).
grandfather(GF, GS) :- father(GF, F), father(F, GS).

%% Goals to try, from the deck — one per example:
%%
%%   ?- father(terach, X).                  % Example 1 — yes : {X/abraham}
%%   ?- father(terach, X), father(X, Y).    % Example 2 — father(abraham, Y)
%%   ?- grandfather(terach, X).             % Example 3 — the rule is cloned
