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

% step(+State, -Action, -Next): one operator, applied
step(State, Action, Next) :-
    operator(Action, PRE, ADD, DEL),
    holds_all(PRE, State),
    apply(State, ADD, DEL, Next).

% same_state(+S1, +S2): the same atoms, in whatever order
same_state(S1, S2) :- holds_all(S1, S2), holds_all(S2, S1).

% visited(+State, +Visited)
visited(State, [V|_]) :- same_state(State, V), !.
visited(State, [_|Vs]) :- visited(State, Vs).

% plan(+State, +Goal, +Visited, +Depth, -Plan)
% as before, but Depth steps at most
plan(State, Goal, _, _, []) :- holds_all(Goal, State).
plan(State, Goal, Visited, Depth, [Action|Plan]) :-
    Depth > 0, Depth1 is Depth - 1,
    step(State, Action, Next),
    \+ visited(Next, Visited),
    plan(Next, Goal, [Next|Visited], Depth1, Plan).

% solve(+State, +Goal, -Plan): depth 0, 1, 2… shortest first
solve(State, Goal, Plan) :-
    depth(Depth),
    plan(State, Goal, [State], Depth, Plan), !.

depth(0).
depth(D) :- depth(D0), D is D0 + 1.

%% Goals to try, from the deck:
%%
%%   ?- initial_state(S), goal(G), solve(S, G, P).  % five steps
