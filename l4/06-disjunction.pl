%%%% Operator ";": disjunction of two goals

neighbour(X,Y1,X,Y2) :- Y1 is Y2+1 ; Y1 is Y2-1.
neighbour(X1,Y,X2,Y) :- X1 is X2+1 ; X1 is X2-1.

%% No goal on the deck.
