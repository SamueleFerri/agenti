%%%% Operator ";": disjunction of two goals

neighbour(X,Y1,X,Y2) :- Y1 is Y2+1 ; Y1 is Y2-1.
neighbour(X1,Y,X2,Y) :- X1 is X2+1 ; X1 is X2-1.

%% Goals to try, from the deck:
%%
%%   ?- neighbour(X, Y, 5, 5).   % X/5 Y/6; X/5 Y/4; X/6 Y/5; X/4 Y/5
%%   ?- neighbour(5, 6, 5, 5).   % yes
%%   ?- neighbour(6, 6, 5, 5).   % no: diagonal
