%%%% A Prolog program as a database: querying facts

%% Ground facts only: each predicate is a table, each goal a query for
%% one tuple.

male(isaac).     plus(2,3,5).
plus(1,6,7).     plus(0,0,5).

%% Goals to try, from the deck:
%%
%%   ?- plus(2,3,5).                % Yes : {}
%%   ?- male(isaac).                % Yes : {}
%%   ?- plus(0,0,0).                % No
%%   ?- plus(2,3,5),plus(1,6,7).    % Yes : {}
