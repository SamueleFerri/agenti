%%%% Working with math: sum/2 over a list of numbers

% relates a list with the sum of its elements
sum([], 0).
sum([H|T], S) :- sum(T, N), S is H + N.

%% Goals to try, from the deck:
%%
%%   ?- sum([10,20,30], S).   % S/60
%%   ?- sum([], S).           % S/0
%%   ?- sum([10,20,30], 60).  % Yes
