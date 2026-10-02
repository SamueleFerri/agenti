%%%% Recap: propositional logic modelled with universal facts

%% Two values as atoms, a unary function as a binary predicate, a binary
%% function as a ternary one.

b_not(b_true, b_false).     b_not(b_false, b_true).
b_and(B, b_true, B).        b_and(_, b_false, b_false).
b_or(B, b_false, B).        b_or(_, b_true, b_true).

%% Goals to try, from the deck — the last two are its own open questions:
%%
%%   ?- b_not(b_false, B).            % {B/b_true}
%%   ?- b_and(b_false, b_true, B).    % {B/b_false}
%%   ?- b_or(b_false, b_true, B).     % {B/b_true}
%%   ?- b_or(b_true, B2, B).          % ???
%%   ?- b_or(B1, B2, B).              % ???
