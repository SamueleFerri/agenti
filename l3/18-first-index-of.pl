%%%% Applications of cut: single result in first_index_of/3

first_index_of([E|_], E, 0) :- !.
first_index_of([_|T], E, N) :-
    first_index_of(T, E, N2), N is N2 + 1.

%% Goal to try, the root of the deck's tree:
%%
%%   ?- first_index_of([a,b,b,c], b, N).  % N/1
