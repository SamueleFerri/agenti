% A Bayesian network, written as an LPAD: one rule per row of each CPT.
% Riguzzi (2023), example 28 -- https://cplint.eu/e/alarm.pl
%
% NOTE: the book names the last node `call'. Here it is `phone_call',
% because call/1 is a Prolog built-in and cannot be redefined.

:- use_module(library(pita)).
:- pita.

:- begin_lpad.

% the two root nodes: a prior each
burg(t) : 0.1 ; burg(f) : 0.9.
earthq(t) : 0.2 ; earthq(f) : 0.8.

% P(alarm | burg, earthq), one rule per row
alarm(t) :- burg(t), earthq(t).
alarm(t) : 0.8 ; alarm(f) : 0.2 :- burg(t), earthq(f).
alarm(t) : 0.8 ; alarm(f) : 0.2 :- burg(f), earthq(t).
alarm(t) : 0.1 ; alarm(f) : 0.9 :- burg(f), earthq(f).

% P(phone_call | alarm) -- the agent's noisy sensor
phone_call(t) : 0.9  ; phone_call(f) : 0.1  :- alarm(t).
phone_call(t) : 0.05 ; phone_call(f) : 0.95 :- alarm(f).

% prob/3 takes a single atom as evidence, so a conjunction of observations
% needs a name of its own. Nothing probabilistic about this clause.
heard_and_quake :- phone_call(t), earthq(t).

:- end_lpad.

/*  Goals
 *
 *  1.  The model, forwards -- the direction the rules are written in:
 *
 *          ?- prob(alarm(t), P).              % 0.3
 *          ?- prob(phone_call(t), P).         % 0.305
 *
 *  2.  The agent, backwards -- the direction it actually needs. It has not
 *      seen a burglar; it has heard the phone:
 *
 *          ?- prob(burg(t), P).                        % 0.1,  the prior
 *          ?- prob(burg(t), phone_call(t), P).         % 0.2505
 *          ?- prob(burg(t), alarm(t), P).              % 0.28
 *
 *      One phone call multiplies the agent's suspicion by about 2.5.
 *
 *  3.  The first rule of the alarm block has no annotation at all. What
 *      does that say about the network, and how many free numbers does
 *      this program hold? Compare with the 15 a joint distribution over
 *      four binary variables would need.
 *
 *  4.  Explaining away. The agent hears the phone AND feels the ground
 *      shake. Predict the direction before you run it:
 *
 *          ?- prob(burg(t), heard_and_quake, P).       % 0.1205
 *
 *      The suspicion drops from 0.2505 back to almost the prior: the
 *      earthquake already accounts for the alarm, so the burglary is no
 *      longer needed to explain it. Two causes of one effect compete --
 *      and no rule in the program says so anywhere.
 */
