%%%% Example 1: improving booleans with rules

%% b_or and b_implies are no longer facts: they are defined as
%% compositions of goals, which is what a rule is for.

b_not(b_true, b_false).
b_not(b_false, b_true).
b_and(B, b_true, B).
b_and(_, b_false, b_false).

b_or(B1, B2, B) :-          % (a or b) = !(!a and !b)
    b_not(B1, NB1), b_not(B2, NB2),
    b_and(NB1, NB2, NB), b_not(NB, B).

b_implies(B1, B2, B) :-     % a --> b = !a or b
    b_not(B1, NB1), b_or(NB1, B2, B).

%% Goal to try — the root of the resolution tree on the deck:
%%
%%   ?- b_implies(b_true, b_false, O).    % {O/b_false}, in seven steps
