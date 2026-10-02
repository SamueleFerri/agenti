%%%% Compound terms (de)structuring: =.., functor, arg

%% No program: every predicate here is built in.

%% Goals to try, from the deck:
%%
%% compound term to list
%%   ?- p(10,q(20)) =.. L.          % L/[p,10,q(20)]
%%   ?- X =.. [p,10,q(20)].         % X/p(10,q(20))
%%
%% direct extraction/construction
%%   ?- functor(p(10,20,30),X,Y).   % X/p, Y/3
%%   ?- functor(T,p,3).             % T/p(_,_,_)
%%   ?- arg(2, p(10,20,30),Y).      % Y/20
