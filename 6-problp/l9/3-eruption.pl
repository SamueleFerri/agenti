% Stromboli: one clause, two groundings, two random variables.
% Riguzzi (2023), example 22 -- https://cplint.eu/e/eruption.pl

:- use_module(library(pita)).
:- pita.

:- begin_lpad.

% X ranges over the two faults, so this clause has TWO groundings,
% each with its own independent choice among three alternatives.
eruption : 0.6 ; earthquake : 0.3 :-
    sudden_energy_release,
    fault_rupture(X).

sudden_energy_release : 0.7.

fault_rupture(southwest_northeast).
fault_rupture(east_west).

:- end_lpad.

/*  Goals
 *
 *  1.  Two probabilistic clauses, but eighteen worlds. Account for the
 *      number before running anything: 3 * 3 * 2.
 *
 *          ?- prob(eruption, P).
 *          ?- prob(earthquake, P).
 *
 *  2.  eruption is 0.588 and earthquake is 0.357. Both rules offer the
 *      eruption/earthquake choice with the same numbers -- so why is
 *      P(eruption) not simply 0.6 * 0.7?
 *
 *  3.  Add a third fault, `fault_rupture(north_south).', and predict both
 *      the number of worlds and the direction P(eruption) moves in.
 *      Then check: 54 worlds, and 0.6552.
 */
