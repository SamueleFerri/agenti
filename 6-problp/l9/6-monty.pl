% Monty Hall: the agent has to choose, and probability tells it how.
% Riguzzi (2023), example 23 -- https://cplint.eu/e/monty.swinb

:- use_module(library(pita)).
:- pita.

:- begin_lpad.

% the prize is behind one of the three doors, uniformly
prize(1) : 1/3 ; prize(2) : 1/3 ; prize(3) : 1/3.

% the player has picked door 1
selected(1).

% Monty opens a door that is neither the prize nor the player's pick.
% When the prize is behind door 1 he has a free choice; otherwise he has none.
open_door(2) : 0.5 ; open_door(3) : 0.5 :- prize(1).
open_door(2) :- prize(3).
open_door(3) :- prize(2).

% the two strategies
win_keep :- prize(1).
win_switch :- prize(2), open_door(3).
win_switch :- prize(3), open_door(2).

:- end_lpad.

/*  Goals
 *
 *  1.  The two actions the agent may take:
 *
 *          ?- prob(win_keep, P).              % 1/3
 *          ?- prob(win_switch, P).            % 2/3
 *
 *      So it should switch. Note that nothing in the program *decides*:
 *      the program models, and the two queries compare.
 *
 *  2.  Change Monty's free choice from 0.5/0.5 to 0.9/0.1 and run both
 *      queries again. One of the two numbers is unchanged. Which, and why?
 *
 *  3.  Where is the agent's knowledge, and where is nature's choice? Mark
 *      each clause as one or the other -- this is Poole's distinction, and
 *      it is what the independent choice logic makes explicit.
 */
