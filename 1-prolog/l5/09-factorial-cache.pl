%%%% Caching factorial in the theory: withcache/1

factorial(0,1).
factorial(X,Y) :- Xm is X-1, factorial(Xm,Y2), Y is Y2*X.

withcache(P) :- cached(P), !.
withcache(P) :- once(P), assert(cached(P)).

%% Goals to try, from the deck, in this order:
%%
%%   ?- cached(X).                   % No
%%   ?- factorial(3,N).              % N/6
%%   ?- cached(X).                   % No
%%   ?- withcache(factorial(3,N)).   % N/6
%%   ?- cached(X).                   % X/factorial(3,6)
%%   ?- clause(cached(X),B).         % X/factorial(3,6), B/true
%%   ?- withcache(factorial(4,N)).   % N/24
%%   ?- findall(C, cached(C), L).
%%     — L/[factorial(3,6),factorial(4,24)]
