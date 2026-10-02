%%%% Example 2: naturals as Peano numbers — succ, sum, mul, factorial

%% zero/0 and s/1 as the constructors; every function is a predicate with
%% the result as its last argument.

succ(X, s(X)).

sum(X, zero, X).
sum(X, s(Y), s(Z)) :- sum(X, Y, Z).

mul(_, zero, zero).
mul(X, s(Y), Z) :- mul(X, Y, W), sum(W, X, Z).

dec(s(X), X).

factorial(zero, s(zero)).
factorial(s(X), Y) :- factorial(X, Z), mul(s(X), Z, Y).

%% Goals to try, from the deck:
%%
%%   ?- succ(s(s(zero)), N).                 % N/s(s(s(zero)))
%%   ?- sum(s(s(s(zero))), s(s(zero)), N).   % N/s(s(s(s(s(zero)))))
%%   ?- mul(s(s(zero)), s(s(zero)), N).      % N/s(s(s(s(zero))))
%%   ?- dec(s(s(zero)), N).                  % N/s(zero)
%%   ?- dec(zero, N).                        % No
%%   ?- sum(N, M, s(s(s(zero)))).            % ???
%%
%% Not on the deck, which only says factorial could be implemented:
%%
%%   ?- factorial(s(s(s(zero))), F).         % F is six times s(zero)
