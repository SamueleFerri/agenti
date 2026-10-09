%%%% Everything is a term: surface syntax

%% No program: every predicate here is built in.

%% Goal to try, from the deck:
%%
%%   ?- {0,1,2+3} = '{}'(A), A =.. L.
%%     — A / (0,1,'+'(2,3))   L / [',',0,(1,'+'(2,3))]
