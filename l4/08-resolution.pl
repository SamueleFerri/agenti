%%%% Preliminary step: simulating resolution

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

%% Goals to try, from the deck:
%%
%%   ?- solve([a]).   % yes
%%   ?- solve([d]).   % yes; yes
%%   ?- solve([e]).   % no
%%   ?- solve([c]).   % yes; yes; yes; ...
