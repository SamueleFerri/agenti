% The same symptoms, graded: three alternatives per rule.
% Riguzzi (2023), example 20 -- https://cplint.eu/e/sneezing.pl

:- use_module(library(pita)).
:- pita.

:- begin_lpad.

% The third alternative of each rule is left implicit: 1-0.3-0.5 = 0.2
% and 1-0.2-0.6 = 0.2 both go to `null'.
strong_sneezing(X) : 0.3 ; moderate_sneezing(X) : 0.5 :- flu(X).
strong_sneezing(X) : 0.2 ; moderate_sneezing(X) : 0.6 :- hay_fever(X).

flu(bob).
hay_fever(bob).

:- end_lpad.

/*  Goals
 *
 *  1.  Two clauses, three alternatives each: 3*3 = 9 worlds.
 *      Write the nine out, with their probabilities.
 *
 *          ?- prob(strong_sneezing(bob), P).
 *          ?- prob(moderate_sneezing(bob), P).
 *
 *  2.  0.44 and 0.80 sum past 1. That is not a bug: find a world in which
 *      both atoms are true, and the paradox goes away.
 *
 *  3.  Alternatives *within one rule* are exclusive; atoms derived by
 *      *different* rules are not. Which of the two facts does 0.44+0.80 > 1
 *      depend on?
 */
