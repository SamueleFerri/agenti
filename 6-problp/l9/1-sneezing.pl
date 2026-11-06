% Medical symptoms, the smallest LPAD there is.
% Riguzzi (2023), examples 13 and 19 -- https://cplint.eu/e/sneezing_simple.pl

:- use_module(library(pita)).
:- pita.

:- begin_lpad.

% `null' is the "this rule did not fire" alternative.
% It never occurs in the body of any rule, so it derives nothing.
sneezing(X) : 0.7 ; null : 0.3 :- flu(X).
sneezing(X) : 0.8 ; null : 0.2 :- hay_fever(X).

flu(bob).
hay_fever(bob).

:- end_lpad.

/*  Goals
 *
 *  1.  Count the four worlds on paper first -- two clauses, one grounding
 *      each, two alternatives each:
 *          0.7*0.8 = 0.56    0.3*0.8 = 0.24
 *          0.7*0.2 = 0.14    0.3*0.2 = 0.06
 *      sneezing(bob) holds in the first three.
 *
 *          ?- prob(sneezing(bob), P).
 *
 *  2.  The answer is 0.94. It is neither 0.7+0.8 nor 0.7*0.8.
 *      Say why, in one sentence, using the fourth world.
 *
 *  3.  Conditioning on something that is already certain:
 *
 *          ?- prob(sneezing(bob), flu(bob), P).
 *
 *      Predict the answer before you run it.
 */
