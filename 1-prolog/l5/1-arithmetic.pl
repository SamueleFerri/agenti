%%%% Arithmetic twice: is/2 and #=/2

:- use_module(library(clpfd)).

%% The same relation, written the two ways

double_is(X, Y) :- Y is X * 2.    % evaluates: X must be bound
double_fd(X, Y) :- Y #= X * 2.    % relates: neither must be bound

%% Factorial, the CLP(FD) way — one definition, any direction.
%% The example is the one in "The Power of Prolog" and in the
%% library(clpfd) manual.

n_factorial(0, 1).
n_factorial(N, F) :-
    N #> 0,
    N1 #= N - 1,
    F #= N * F1,
    n_factorial(N1, F1).

%% Goals to try, from the deck:
%%
%%   ?- double_is(3, Y).
%%   ?- double_is(X, 6).            % error: X is not instantiated
%%   ?- double_fd(3, Y).
%%   ?- double_fd(X, 6).            % X = 3
%%   ?- double_fd(X, Y).            % no solution yet: a residual constraint
%%
%%   ?- n_factorial(5, F).
%%   ?- n_factorial(N, 120).        % N = 5, and ";" then answers false:
%%                                  % the constraint bounds N, so the
%%                                  % search terminates
%%   ?- n_factorial(N, F).          % on backtracking, one pair after
%%                                  % another: 0-1, 1-1, 2-2, 3-6, 4-24
