%%%% Exploiting exploration to generate combinations

%% No program: member/2 is a library predicate.

%% Goal to try, from the deck:
%%
%%   ?- member(X,[10,20,30]), member(Y,[1,2]), Res is X+Y.
%%     — Res/11; Res/12; Res/21; Res/22; Res/31; Res/32
