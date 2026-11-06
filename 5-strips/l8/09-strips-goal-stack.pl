%%%% STRIPS's own algorithm: one goal at a time
%%%% L8 – STRIPS Planning in Prolog, Intelligent Agents 2026/2027
%%%% by Andrea Omicini <mailto:andrea.omicini@unibo.it>

% the worked example, and the Sussman anomaly
initial_state([ontable(a), clear(a),
               ontable(c), on(b, c), clear(b)]).
sussman([on(c, a), ontable(a), clear(c),
         ontable(b), clear(b)]).

goal([on(a, b), on(b, c)]).

% operator(Name, PRE, ADD, DEL), three operator schemes
operator(put(X, Y),                       % from the table
    [ontable(X), clear(X), clear(Y), different(X, Y)],
    [on(X, Y)],
    [ontable(X), clear(Y)]).
operator(put(X, Y),                       % from a block
    [on(X, Z), clear(X), clear(Y),
     different(X, Y), different(Y, Z)],
    [on(X, Y), clear(Z)],
    [on(X, Z), clear(Y)]).
operator(puttable(X),
    [clear(X), on(X, Y)],
    [ontable(X), clear(Y)],
    [on(X, Y)]).

% holds_all(+Atoms, +State): every atom in State, bound to it;
% different/2 is not in a state: STRIPS has no inequality
holds_all([], _).
holds_all([different(X, Y)|As], S) :-
    !, X \== Y, holds_all(As, S).
holds_all([A|As], S) :- member(A, S), holds_all(As, S).

% delete_all(+List, +ToDelete, -Rest)
delete_all([], _, []).
delete_all([A|As], Del, Rest) :-
    member(A, Del), !, delete_all(As, Del, Rest).
delete_all([A|As], Del, [A|Rest]) :- delete_all(As, Del, Rest).

% apply(+State, +ADD, +DEL, -Next): Next = (State \ DEL) U ADD
apply(State, ADD, DEL, Next) :-
    delete_all(State, DEL, Rest), append(ADD, Rest, Next).

% achieve(+State, +Goals, +Depth, -Plan, -Final)
% STRIPS's own way: one goal at a time, an operator adding it,
% its PRE first, then all the goals again
achieve(State, Goals, _, [], State) :-
    holds_all(Goals, State).
achieve(State, Goals, Depth, Plan, Final) :-
    Depth > 0, Depth1 is Depth - 1,
    unmet(Goals, State, Goal),
    operator(Action, PRE, ADD, DEL), member(Goal, ADD),
    achieve(State, PRE, Depth1, Plan1, State1),
    holds_all(PRE, State1),
    apply(State1, ADD, DEL, State2),
    achieve(State2, Goals, Depth1, Plan2, Final),
    append(Plan1, [Action|Plan2], Plan).

% unmet(+Goals, +State, -Goal): a goal not true in State
unmet([G|_], S, G) :- G \= different(_, _), \+ member(G, S).
unmet([_|Gs], S, G) :- unmet(Gs, S, G).

% solve(+State, +Goal, -Plan): depth 1, 2… up to max_depth/1
solve(State, Goal, Plan) :-
    depth(Depth), achieve(State, Goal, Depth, Plan, _), !.

max_depth(8).
depth(D) :- max_depth(M), from(1, M, D).
from(L, H, L) :- L =< H.
from(L, H, D) :- L < H, L1 is L + 1, from(L1, H, D).

%% Goals to try, from the deck:
%%
%%   ?- initial_state(S), goal(G), solve(S, G, P).  % one step
%%   ?- sussman(S), goal(G), solve(S, G, P).        % six steps, not three
