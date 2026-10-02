%%%% A few examples: all/2 and a fully-relational size/2

% all(+Term,+List): are all elements in List of kind Term?
all(_, []).
all(X, [Y | T]) :- copy_term(X, Y), all(X, T).

% fully-relational size
size(L, N) :- var(L), !, generate(L, N).
size(L, N) :- length(L, N).

generate([], 0) :- !.
generate([_|T], N) :- N2 is N-1, generate(T,N2).

length([], 0).
length([_|T], N) :- length(T, N2), N is N2 + 1.

%% Goals to try, from the deck:
%%
%%   ?- all(p(X), [p(a), p(b), p(a)]).  % yes
%%   ?- size([10,20,30], N).            % N/3
%%   ?- size(L, 3).                     % L/[_,_,_]
