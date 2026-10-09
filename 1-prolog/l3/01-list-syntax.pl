%%%% Built-in list syntax: append/3 over [H|T] lists

%% No program: append/3 is a library predicate.  The same list written with
%% '.'/2 and [] first, then with the list syntax.

%% Goals to try, from the deck:
%%
%%   ?- append('.'(a, '.'(b, [])), '.'(c, []),
%%             '.'(a, '.'(b, '.'(c, [])))).  % succeeds
%%   ?- append([a, b], [c], L).          % L/[a, b, c]
%%   ?- append([a, b], [c], [H | T]).    % H/a, T/[b, c]
%%   ?- append([a, b], [c], [_ | _]).    % Yes
%%   ?- append([a, b], [c], [_, _, _]).  % Yes
%%   ?- append([a, b], [c], [_,_,_,_]).  % No
%%   ?- append([a, b], [c], [_, _, E]).  % E/c
%%   ?- append([a, b], [c], [_, _ | T]). % T/[c]
%%   ?- append([a, b], [c], [_,_,_ | T]).% T/[]
