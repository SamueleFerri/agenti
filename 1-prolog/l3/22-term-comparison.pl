%%%% Term comparison: unification, equality, cloning

%% No program: every predicate here is built in.

%% Goals to try, from the deck:
%%
%% unification
%%   ?- a(10,b) = a(10,b).    % yes
%%   ?- a(X,b) = a(10,b).     % yes X/10
%%   ?- a(X,b) = a(Y,c).      % no
%%
%% non-unification (note it never binds)
%%   ?- a(10,b) \= a(10,b).   % no
%%   ?- a(X,b) \= a(10,b).    % no
%%   ?- a(X,b) \= a(Y, c).    % yes
%%
%% equality
%%   ?- a(10,b) == a(10,b).   % yes
%%   ?- a(X,b) == a(10,b).    % no
%%   ?- a(X,b) == a(X,b).     % yes
%%
%% inequality
%%   ?- a(10,b) \== a(10,b).  % no
%%   ?- a(X,b) \== a(10,b).   % yes
%%   ?- a(X,b) \== a(X,b).    % no
%%
%% cloning/check-cloning
%%   ?- copy_term(a(10,X), Y).        % yes, Y/a(10,X1)
%%   ?- copy_term(a(10,X), a(10,Y)).  % yes
%%   ?- copy_term(a(10,X), a(10,X)).  % yes
%%   ?- copy_term(a(10,X), a(11,X)).  % no
