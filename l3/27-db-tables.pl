%%%% DB-like structures: a table as a list of compound terms

% get_ids(+Table,-List)
% gets the List of ids from the Table
get_ids([], []).
get_ids([user(ID, _, _) | T], [ID | L]) :- get_ids(T, L).

% query(+Table,+Id,-Tuple)
% gets the Tuple with Id from the Table
query([user(ID, N, C) | _], ID, user(ID, N, C)).
query([_ | T], ID, Tuple) :- query(T, ID, Tuple).

% update(+Table,+Id,+NewTuple,-NewTable)
% updates the tuple with Id to NewTuple
update([user(ID, _, _) | T], ID, Tuple, [Tuple | T]).
update([H | T], ID, Tuple, [H | Table]) :-
    update(T, ID, Tuple, Table).

%% Goal to try, from the deck:
%%
%%   ?- update([user(100,a,b), user(101,c,d)], 101,
%%             user(101,c,e), DB).
%%     — DB/[user(100,a,b), user(101,c,e)]
