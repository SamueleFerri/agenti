%%%% Programming find, position and join over [H|T] lists

% relates a list with one of its elements
find([E|_],E).
find([_|T],E) :- find(T,E).

% relates a list with one of its elements
% and its Peano position
position([E|_],zero,E).
position([_|T],s(N),E) :- position(T,N,E).

% relates two lists with their concatenation
% (similar to append)
join([],L,L).
join([H|T],L,[H|M]) :- join(T,L,M).

%% Goals to try, from the deck:
%%
%%   ?- find([a,b,c], b).            % Yes
%%   ?- find([a,b,c], 40).           % No
%%   ?- position([a,b,c], zero, a).  % Yes
%%   ?- position([a,b,c], s(zero), b). % Yes
%%   ?- position([a,b,b], P, b).     % P/s(zero); P/s(s(zero))
%%   ?- join([a,b], [c], L).         % L/[a,b,c]
