%%%% Gathering solutions in lists: findall/3 and filter/4

% filter(+L, X, P, LO)
filter(L,X,P,LO) :- findall(X, (member(X,L), once(P)), LO).

%% Goals to try, from the deck:
%%
%%   ?- findall([X,Y], (member(X,[1,2,3]),member(Y,[1,2,3])), L).
%%     — L/[[1,1],[1,2],...,[3,2],[3,3]]
%%   ?- filter([10,21,30,40,50], X, X>25, LO).
%%     — LO / [30,40,50]
