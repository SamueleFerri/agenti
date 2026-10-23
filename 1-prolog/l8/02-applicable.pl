%%%% When an operator applies

% a state is a list of ground atoms: what is not there is false
initial_state([ontable(a), clear(a),
               ontable(c), on(b, c), clear(b)]).

% a goal is a list of atoms, all to hold in the final state
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

%% Goals to try, from the deck:
%%
%%   ?- initial_state(S), operator(put(a, b), PRE, _, _), holds_all(PRE, S).  % yes
%%   ?- initial_state(S), operator(puttable(b), PRE, _, _), holds_all(PRE, S).  % yes
%%   ?- initial_state(S), operator(A, PRE, _, _), holds_all(PRE, S).  % all actions
