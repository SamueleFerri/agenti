%%%% Example program for resolution trees: facts, rules, recursion


%% Propositional: every goal is a 0-ary predicate.  The slide that follows
%% draws the resolution tree of a, of b, of c and of d over this program.

a.        % a clause with empty body is a fact
b.        % multiple copies of rules/facts can occur
b.
b :- z.   % b is the rule "head", z is the body
c.        % different clauses can have same head
c :- a, c.  % a sort of recursive rule
c :- b.
d :- d.   % .. recall the order of clauses is relevant

%% Goals to try — the four roots of the resolution trees on the deck:
%%
%%   ?- a.
%%   ?- b.
%%   ?- c.
%%   ?- d.
%%
%% See the README: b, c and d do not all behave as the trees suggest.
