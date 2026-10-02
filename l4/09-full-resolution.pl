%%%% Preliminary step: it is actual "full resolution"!

rule(a, []).     % means:     a.
rule(b, []).     % means:     b.
rule(d, []).     % means:     d.
rule(d, []).     % means:     d.
rule(c, []).     % means:     c.
rule(c, [c]).    % means:     c :- c.

% we are using unification when calling rule/2
% we branch because calling rule/2 branches
% append performs head/body substitution
solve([]).
solve([Goal | Rest]) :-
    rule(Goal, Body),
    append(Body, Rest, NewGoals),
    solve(NewGoals).

rule(search(E,[E|_]), []).
rule(search(E,[_|T]), [search(E,T)]).

%% Goals to try, from the deck:
%%
%%   ?- solve([a]).   % yes
%%   ?- solve([d]).   % yes; yes
%%   ?- solve([e]).   % no
%%   ?- solve([c]).   % yes; yes; yes; ...
%%
%%   ?- solve([search(X,[10,20,30])]). % X/10; X/20; X/30
