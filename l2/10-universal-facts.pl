%%%% Universal facts: a variable in a fact is an infinite set of facts

plus(0,X,X).     plus(X,0,X).

%% Goals to try, from the deck:
%%
%%   ?- plus(0,3,3).    % Yes
%%   ?- plus(0,5,R).    % {R/5}
%%   ?- plus(3,0,X).    % {X/3}      — no clash!
%%   ?- plus(0,0,X).    % {X/0}; {X/0} — twice, once per clause
