%%%% Other control predicates: if-then-else

% max(+X, +Y, -Z)
max(X, Y, Z) :- ( X >= Y -> Z = X ; Z = Y ).

% sign(+X, -S)
sign(X, S) :- ( X > 0 -> S = positive
              ; X < 0 -> S = negative
              ; S = zero ).

%% Goals to try, from the deck:
%%
%%   ?- max(3, 5, Z).   % Z / 5
%%   ?- max(7, 2, Z).   % Z / 7
%%   ?- sign(-4, S).    % S / negative
%%   ?- sign(0, S).     % S / zero
