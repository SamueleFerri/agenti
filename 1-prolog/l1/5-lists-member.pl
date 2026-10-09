%%%% Lists: member/2

member(X,[X|_]).
member(X,[_|T]) :-  member(X,T).

%% Goals to try, from the deck:
%%
%%   ?- member(b,[a,b,c]).
%%   ?- member(b,[a,b,b]).
%%   ?- member(X,[a,b,c]).
%%   ?- member(blue(X),[red(a),blue(b),red(c),blue(d)]).
%%   ?- member(z,X).
