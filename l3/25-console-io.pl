%%%% I/O over console: debugging sum/2 by logging

sum([], 0).
sum([H|T], N) :- sum(T, N2), write(N2), nl, N is H + N2.

%% Goal to try, from the deck:
%%
%%   ?- write('start'),nl,sum([10,20,30],N).
%%
%% and the console it prints:
%%
%%   start
%%   0
%%   30
%%   50
