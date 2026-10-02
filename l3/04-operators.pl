%%%% Operators at work: unification, comparison, evaluation

%% No program: every operator here is built in.

%% Goals to try, from the deck:
%%
%%   ?- '='(p(1,2), p(X,Y)). % X/1; Y/2   standard notation
%%   ?- p(1,2) = p(X,Y).     % X/1; Y/2   infix notation
%%   ?- p(1,2) = p(_,3).     % No         no unification
%%   ?- '>'(20,10).          % Yes
%%   ?- 20 > 10.             % Yes
%%   ?- 10 > 20.             % No
%%   ?- 10 =:= 20.           % No         numbers equality
%%   ?- 10 =\= 20.           % Yes        numbers inequality
%%   ?- X = 10 + 20.         % X/'+'(10,20)  + is just a functor
%%   ?- is(X, '+'(10,20)).   % X/30       evaluation
%%   ?- X is 10+20.          % X/30       evaluation
%%   ?- 30 is 10+20.         % Yes
%%   ?- 10 is p(20).         % HALT!      an aborting exception
%%   ?- 10 is X+5.           % HALT!      X+5 has a variable
