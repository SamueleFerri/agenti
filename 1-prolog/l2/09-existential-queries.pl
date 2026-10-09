%%%% Existential queries, and the exploration they carry

%% The same facts without male/1.  A goal with variables asks whether an
%% instantiation exists — and composing goals explores the combinations.

plus(2,3,5).     plus(1,6,7).     plus(0,0,5).

%% Goals to try, from the deck:
%%
%%   ?- plus(0,X,Y).                % {X/0,Y/5}
%%   ?- plus(X,Y,5).                % {X/2,Y/3}; {X/0,Y/0}
%%   ?- plus(X,Y,Y).                % No
%%   ?- plus(X,Y,Z),plus(W,K,Z).    % {X/2,Y/3,Z/5,W/2,K/3}; ... — five in all
