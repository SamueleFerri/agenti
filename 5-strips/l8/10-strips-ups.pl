%%%% The UPS World, one goal at a time
%%%% L8 – STRIPS Planning in Prolog, Intelligent Agents 2026/2027
%%%% by Andrea Omicini <mailto:andrea.omicini@unibo.it>

% the UPS World: one plane, fuel for one flight;
% plane/1 and location/1 are static: no operator touches them
initial_state([at(obj1, locA), at(obj2, locA),
               at(b747, locA), haveFuel(b747),
               plane(b747), location(locA), location(locB)]).

goal([at(obj1, locB), at(obj2, locB)]).

operator(load(Obj, Plane, Loc),
    [plane(Plane), at(Plane, Loc), at(Obj, Loc),
     different(Obj, Plane)],
    [inside(Obj, Plane)],
    [at(Obj, Loc)]).
operator(unload(Obj, Plane, Loc),
    [inside(Obj, Plane), at(Plane, Loc)],
    [at(Obj, Loc)],
    [inside(Obj, Plane)]).
operator(fly(Plane, From, To),
    [plane(Plane), at(Plane, From), haveFuel(Plane),
     location(To), different(From, To)],
    [at(Plane, To)],
    [at(Plane, From), haveFuel(Plane)]).

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
%%   ?- initial_state(S), goal(G), solve(S, G, P).  % no: linear STRIPS cannot
