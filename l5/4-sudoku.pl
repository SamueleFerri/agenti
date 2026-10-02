%%%% Sudoku with all_distinct/1

:- use_module(library(clpfd)).

%% 27 all_distinct/1 constraints — nine rows, nine columns, nine blocks —
%% and nothing else.  The model is the one in the library(clpfd) manual.

sudoku(Rows) :-
    length(Rows, 9),
    maplist(same_length(Rows), Rows),
    append(Rows, Vs), Vs ins 1..9,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
    blocks(As, Bs, Cs),
    blocks(Ds, Es, Fs),
    blocks(Gs, Hs, Is).

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
    all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
    blocks(Ns1, Ns2, Ns3).

%% Two puzzles.  The first is solved by propagation alone — sudoku/1
%% returns it ground, with no search at all.  The second is not, and
%% needs labeling.

problem(1, [[_,_,_,_,_,_,_,_,_],
            [_,_,_,_,_,3,_,8,5],
            [_,_,1,_,2,_,_,_,_],
            [_,_,_,5,_,7,_,_,_],
            [_,_,4,_,_,_,1,_,_],
            [_,9,_,_,_,_,_,_,_],
            [5,_,_,_,_,_,_,7,3],
            [_,_,2,_,1,_,_,_,_],
            [_,_,_,_,4,_,_,_,9]]).

problem(2, [[1,_,_,_,_,7,_,9,_],
            [_,3,_,_,2,_,_,_,8],
            [_,_,9,6,_,_,5,_,_],
            [_,_,5,3,_,_,9,_,_],
            [_,1,_,_,8,_,_,_,2],
            [6,_,_,_,_,4,_,_,_],
            [3,_,_,_,_,_,_,1,_],
            [_,4,_,_,_,_,_,_,7],
            [_,_,7,_,_,_,3,_,_]]).

%% Goals to try, from the deck:
%%
%%   ?- problem(1, Rows), sudoku(Rows).
%%     — no labeling at all, and the grid comes back *solved*:
%%       all_distinct/1 propagates strongly enough to need no search
%%   ?- problem(1, Rows), sudoku(Rows), maplist(label, Rows),
%%      maplist(portray_clause, Rows).
%%   ?- problem(2, Rows), sudoku(Rows).
%%     — this one propagation does not finish: residual constraints
%%   ?- problem(2, Rows), sudoku(Rows), maplist(labeling([ff]), Rows),
%%      maplist(portray_clause, Rows).
%%     — 0.07 s on SWI-Prolog 10.0.2
