# l4 – Constraints in Prolog

The programs shown in the class, one file each, in the order the deck takes
them. Every file carries at the bottom, as comments, the goals the deck asks of
it.

| file | what it is |
|---|---|
| [`1-arithmetic.pl`](1-arithmetic.pl) | `is`/2 against `#=`/2, and a factorial that runs both ways |
| [`2-send-more-money.pl`](2-send-more-money.pl) | the cryptarithmetic puzzle: eight letters, one equation |
| [`3-queens.pl`](3-queens.pl) | N queens, and what the labelling strategy costs |
| [`4-sudoku.pl`](4-sudoku.pl) | `all_distinct`/1, and a grid solved with no search at all |
| [`5-knapsack.pl`](5-knapsack.pl) | optimisation: `labeling([max(V)], Vs)` |

Every one of them starts with

```prolog
:- use_module(library(clpfd)).
```

and that line is the whole installation.

## Running one

Paste the program into [SWISH](https://swish.swi-prolog.org)'s left-hand pane,
then ask a goal of it in the box at the bottom right.

```prolog
?- puzzle(As + Bs = Cs), label(As).
```

**Not the 2P-Kt web IDE this time**: it ships no CLP library, so `#=`/2 and the
rest of `clpfd` are not available there.

## One thing to try first

**Ask the goal *without* labelling.** `puzzle(As + Bs = Cs)` on its own neither
fails nor answers with a solution: it answers with the constraints that are
left, and the domains propagation has already cut down.
