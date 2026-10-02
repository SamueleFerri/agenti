%%%% Natural numbers in Prolog: nat/1 and sum/3

%% A first program: extensional representation.  On the deck, and left
%% commented out here, since it takes infinitely many clauses.
%%
%%   nat(z).       % zero is a natural number
%%   nat(s(z)).    % one is a natural number
%%   nat(s(s(z))). % two is a natural number
%%   ...

%% A second program: recursive rules for intensional representation

nat(z).               % zero is a natural number
nat(s(N)) :- nat(N).  % if N is a natural number, then
                      % its successor is a natural number

%% Sum

sum(z, N, N).        % zero plus N is N
sum(s(M), N, s(P))   % if M plus N is P, then
  :- sum(M, N, P).   % adding N to the successor of M
                     % returns the successor of P

%% Goals to try, from the deck:
%%
%%   ?- sum(s(z),s(s(z)),S).
%%   ?- sum(0,s(0),S).
%%   ?- sum(X,s(s(z)),s(s(s(s(s(s(z))))))).
%%   ?- sum(s(s(s(s(z)))),Y,s(s(s(s(s(s(z))))))).
%%   ?- sum(X,Y,s(s(s(s(s(s(z)))))))
%%   ?- sum(X,s(s(z)),Y), sum(X,Y,s(s(s(s(s(s(z))))))).
