%%%% The wildcard variable, in programs and in goals

%% _ in a clause: a variable used once.  _ in a goal: a variable we do not
%% need to see in the solution.

p(_,1).          p(1,2).
q(_,a(1,_)).     r(X,a(1,X)).

%% Goals to try, from the deck:
%%
%%   ?- p(X,1).         % Yes
%%   ?- p(1,Y).         % {Y/1}; {Y/2}
%%   ?- p(1,_).         % Yes; Yes
%%   ?- q(1,a(1,2)).    % Yes
%%   ?- r(1,a(1,2)).    % No — the two 1s of r/2 are the same variable
