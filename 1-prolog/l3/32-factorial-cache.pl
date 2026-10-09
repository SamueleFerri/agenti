%%%% Dynamically expanding lists: a cache for factorials

% factorial(+N,-Out,?Cache)
% cache is a partial list of factorials [1,1,2,6,24|_]
factorial(N, Out, Cache) :- factorial(N, Out, Cache, 0).
factorial(N, Res, [Res|_], N) :- !, nonvar(Res).
factorial(N, Out, [H, V | T], I) :-
  var(V), !, I2 is I + 1, V is H * I2,
  factorial(N, Out, [V | T], I2).
factorial(N, Out, [_ , V | T], I) :-
  I2 is I + 1, factorial(N, Out, [ V | T ], I2).

%% Goal to try, from the deck:
%%
%%   ?- C = [1,1,2,6|_], factorial(5, Res, C).
%%     — Res/120, C/[1,1,2,6,24,120|_]
