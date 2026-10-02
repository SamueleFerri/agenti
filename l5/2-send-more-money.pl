%%%% SEND + MORE = MONEY, the cryptarithmetic puzzle

:- use_module(library(clpfd)).

%% The model is the one in the library(clpfd) manual.  Eight letters,
%% eight distinct digits, one equation over them.

puzzle([S,E,N,D] + [M,O,R,E] = [M,O,N,E,Y]) :-
    Vars = [S,E,N,D,M,O,R,Y],
    Vars ins 0..9,
    all_different(Vars),
    S*1000 + E*100 + N*10 + D +
    M*1000 + O*100 + R*10 + E #=
    M*10000 + O*1000 + N*100 + E*10 + Y,
    M #\= 0, S #\= 0.

%% Goals to try, from the deck:
%%
%%   ?- puzzle(As + Bs = Cs).
%%     — the answer is not a solution but the *residual constraints*:
%%       propagation alone has already fixed S = 9, M = 1 and O = 0,
%%       and cut the other five domains down to four values or fewer
%%   ?- puzzle(As + Bs = Cs), label(As).
%%     — 9567 + 1085 = 10652, and it is the only solution
%%   ?- puzzle(As + Bs = Cs), label(As), false.
%%     — fails, having found no second one
