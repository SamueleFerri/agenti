%%%% Applications of cut: the alternative approach

index_of([E|_], E, 0).
index_of([_|T], E, N) :- index_of(T, E, N2), N is N2 + 1.

first_index_of2(L, E, N) :- index_of(L, E, N), !.

%% Goal to try, the root of the deck's tree:
%%
%%   ?- first_index_of2([a,b,b,c], b, N).  % N/1
