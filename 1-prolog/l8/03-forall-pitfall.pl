%%%% A pitfall: forall/2 binds nothing

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

% WRONG: "no atom fails to be in S" -- what forall/2 does;
% \+ never binds, so the action comes out unbound
holds_all(As, S) :- \+ (member(A, As), \+ member(A, S)).

%% Goals to try, from the deck:
%%
%%   ?- initial_state(S), operator(A, PRE, _, _), holds_all(PRE, S).  % A unbound
%%   ?- initial_state(S), holds_all([on(X, Y)], S).  % yes, X and Y unbound
