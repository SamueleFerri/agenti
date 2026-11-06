% Three prisoners: evidence that looks informative and is not.
% Riguzzi (2023), example 24 -- https://cplint.eu/e/jail.swinb

:- use_module(library(pita)).
:- pita.

:- begin_lpad.

% two of the three are to be executed; a does not know which
safe(a) : 1/3 ; safe(b) : 1/3 ; safe(c) : 1/3.

% if a is safe the jailer picks one of the others at random;
% otherwise he has no choice to make
tell_executed(b) : 1/2 ; tell_executed(c) : 1/2 :- safe(a).
tell_executed(b) :- safe(c).
tell_executed(c) :- safe(b).

tell :- tell_executed(_).

safe_after_tell :- safe(a), tell.

:- end_lpad.

/*  Goals
 *
 *  1.  Before and after the jailer speaks:
 *
 *          ?- prob(safe(a), P).               % 1/3
 *          ?- prob(tell, P).                  % 1
 *          ?- prob(safe_after_tell, P).       % 1/3
 *          ?- prob(safe(a), tell, P).         % 1/3
 *
 *  2.  Naive conditioning says a's chance went from 1/3 to 1/2. The
 *      program says it did not move at all. P(tell) = 1 is the reason:
 *      write out why an event of probability 1 can carry no information.
 *
 *  3.  Compare with 5-alarm.pl, where the evidence moved the belief from
 *      0.1 to 0.2505. What is structurally different between the two
 *      models? (Hint: ask what the jailer could possibly have said.)
 */
