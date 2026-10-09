%%%% Inspecting terms: atom, var, number, compound, ground

%% No program: every predicate here is built in.

%% Goals to try, from the deck:
%%
%%   ?- atom(a).             % yes
%%   ?- atom(10).            % no
%%   ?- atom(a(1)).          % no
%%   ?- var(X).              % yes
%%   ?- var(a).              % no
%%   ?- nonvar(X).           % no
%%   ?- number(10).          % yes
%%   ?- float(10.1).         % yes
%%   ?- integer(10.1).       % no
%%   ?- compound(10).        % no
%%   ?- compound(a).         % no
%%   ?- compound(a(10,20)).  % yes
%%   ?- ground(a(10,20)).    % yes
%%   ?- ground(a(10,X)).     % no
