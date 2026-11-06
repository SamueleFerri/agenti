% the Sussman anomaly: c on a, b on the table; a-b-c wanted
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
%%   ?- sussman(S), goal(G), solve(S, G, P).  % three steps
