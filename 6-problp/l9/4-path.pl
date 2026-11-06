% A path through a graph whose edges may not be there.
% Riguzzi (2023), example 27 -- https://cplint.eu/e/path.swinb

:- use_module(library(pita)).
:- pita.

:- begin_lpad.

% Left-recursive, and that is fine: PITA is tabled, so this terminates.
path(X, X).
path(X, Y) :-
    path(X, Z),
    edge(Z, Y).

edge(a, b) : 0.3.
edge(b, c) : 0.2.
edge(a, c) : 0.6.

:- end_lpad.

/*  Goals
 *
 *  1.  Two explanations reach c from a:
 *          k1 = { edge(a,c) }                    0.6
 *          k2 = { edge(a,b), edge(b,c) }         0.3 * 0.2 = 0.06
 *      Add them naively: 0.66.
 *
 *          ?- prob(path(a, c), P).
 *
 *  2.  The answer is 0.624, not 0.66. The two explanations are not
 *      mutually exclusive: some worlds hold both paths and have been
 *      counted twice. Recover 0.624 by inclusion-exclusion:
 *          0.6 + 0.06 - 0.6*0.06
 *
 *  3.  Look at what the system builds instead:
 *
 *          ?- bdd_dot_string(path(a, c), BDD, Var).
 *
 *      In cplint on SWISH the diagram is drawn for you. Follow the two
 *      root-to-1 branches and check that they are disjoint by construction
 *      -- that is the whole trick of knowledge compilation.
 */
