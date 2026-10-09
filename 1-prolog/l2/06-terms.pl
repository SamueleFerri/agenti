%%%% Prolog terms: predicates, functors, arity

%% The syntax slide: goals and terms, and what a lower-case name is in
%% each position.  Three unrelated programs in one listing.

father(abraham, isaac).
father(terach, abraham).
grandfather(GF, GS) :- father(GF, F), father(F, GS).

pred(cons(H, nil), H).             % cons/nil as functors
pred(cons(_, T), L) :- pred(T, L). % what does pred define?

odd(1).          % 1 is odd
odd(3).          % 3 is odd
sum(2, 3, 5).    % 2,3,5 are in the sum relation

%% The deck asks no goal of this program, but it does ask a question —
%% what does pred define?  A goal that answers it:
%%
%%   ?- pred(cons(a, cons(b, cons(c, nil))), L).
