# HANDOFF.md – 2-clp/l4

The turn record for this class. Repository-wide state is in `.ai/HANDOFF.md` at the root.

Last updated: 2026-10-06, by Claude. Five files, published and pushed; the L4 deck links
every one of them. Why the part is named `2-clp` is in `CLAUDE.md` beside this file.


**Renumbered on 2026-10-06, at Andrea's word**: metaprogramming is postponed and constraints come
first, so `1-prolog/l4` → `1-prolog/l5` (L5 – Metaprogramming in Prolog) and `2-clp/l5` → `2-clp/l4`
(L4 – Constraints in Prolog), with `git mv`; file headers, READMEs and the decks'
`\labcode`/`\labdir` links (`l4-clpfd`, `l5-metaprogramming` in `iag2627-slides`) follow. Older
sections here keep the old numbers as written.

## Aligned with the deck at `ef0caff` – 2026-10-06

Every program on the deck matched its file verbatim. Prose drift only: the README
table now reads as the *Lab Repo* frame (*runs both ways*, *with no search at all*);
`3-queens.pl` lists `n_queens(24, Qs), label(Qs)`, which the deck asks and the file did
not; `1-arithmetic.pl` lists the factorial pairs to `5-120, ...`, as the deck does. Dashes
follow Andrea's rule, as the deck now does: a spaced en dash for an inciso, an unspaced em
dash for a clause closing the sentence, a spaced en dash between label and title. Fixed in
`1-arithmetic.pl`, `4-sudoku.pl` and both READMEs' headings; the `— ` opening each goal's
annotation is a marker, like the `\item` exception, and stays.

Every goal on the deck rerun in local SWI-Prolog 10.0.2: all answers as printed, and the
timings hold—24 queens 5.15 s / 0.003 s, n = 100 0.068 s, `problem(2)` 0.076 s, and with
`all_different` `problem(1)` 2.70 s, `problem(2)` 0.019 s. Then on SWISH (10.1.12, pengine
API): every file loads, every deck answer comes back, knapsack 545/136 and 450/96.

## *labelling* – 2026-10-04

Following the slides repo, where L5's prose went from *labeling* to *labelling* (British
English, as the decks are): the `3-queens.pl` gloss and the *Ask the goal without labelling*
heading in `README.md`, and two comments in `4-sudoku.pl`. Code untouched—
`labeling/2` is the predicate. `4-sudoku.pl` still loads, and `problem(1, Rows), sudoku(Rows)`
still comes back ground. `CLAUDE.md` and this file followed the same night: prose
*labelling* there too, at Andrea's word. The deck also gained a fourth warm-up (`\=` against `dif/2`); the lab keeps
no copy of the exercises, so nothing followed here. Committed and pushed.

## 2-clp/l5 – added 2026-09-17

From `iag2627-slides/tex/l5-clpfd.tex` (`\decklabel{L5}`), written the same turn. The part
is the course's second: constraints inside Prolog, `library(clpfd)`.

Five programs, **every one of them executed** on SWI-Prolog 10.0.2 before it reached the
deck:

- `1-arithmetic.pl` — `double_is/2` against `double_fd/2`, and `n_factorial/2`. The factorial
  is the one in the `clpfd` manual and in *The Power of Prolog*, credited in a comment.
- `2-send-more-money.pl` — the `clpfd` manual's model, credited.
- `3-queens.pl` — the `clpfd` manual's model, credited.
- `4-sudoku.pl` — the manual's model, credited, with **two** grids: `problem(1)` is finished
  by propagation alone, `problem(2)` is not and needs `labeling/2`.
- `5-knapsack.pl` — written here: eight items, 0/1 variables, `scalar_product/4`, and
  `labeling([max(V)], Take)` for the optimisation. `taken/2` turns the 0/1 list back into
  names.

**Three things that were measured, and two of them corrected a draft.**

- `?- n_factorial(N, 120).` **terminates**: `;` answers `false`, because `F #= N * F1`
  bounds `N` backwards from 120. The first draft said the search space was unbounded.
- `?- problem(1, Rows), sudoku(Rows).` comes back **ground**—no labelling at all.
  `all_distinct/1` propagates strongly enough. The draft, following the research bundle's
  own teaching note, expected residual constraints; `ground(Rows)` says otherwise.
- Timings, all SWI-Prolog 10.0.2 on this machine: 24 queens `label/1` 5.2 s against
  `labeling([ff])` 0.003 s, and `ff` answers n = 100 in 0.07 s. On the sudokus,
  `all_distinct` costs nothing on `problem(1)` where `all_different` costs 2.7 s—and the
  ranking **reverses** on `problem(2)`, 0.065 s against 0.018 s. Both are in `l5/README.md`
  and on the deck: a stronger propagator is not always the faster one.

**The part is SWISH only**, and the README says why rather than asserting it: the 2P-Kt
repository has no CLP module—its top-level listing has `bdd`, `datalog`, `solve-plp`,
`solve-problog` and nothing for constraints. A UniBo thesis exists on extending 2P-Kt with
CLP; it is not in the released system. Andrea chose this stack explicitly when the
alternatives (a MiniZinc coda, or a MiniZinc-first lab) were put to him.

**Browser-only was kept.** A first draft of both READMEs pointed at a local SWI-Prolog as
an alternative; that is against the decision recorded under *Open* below, and it was taken
out of the READMEs and off the deck.

## The order prefix – 2026-09-24

Files renamed with a `1-`, `2-`, … prefix in the deck's order, the rule now in the root
`CLAUDE.md`. No name here came near the path budget: the longest, at 29 characters, is
eight inside it.

## The nine exercises

The L5 deck sets nine exercises – the `dif/2` warm-up came on 2026-10-04 – and **no solutions are published here**. L1 and L2
publish none either, so nothing was assumed; whether that changes is Andrea's call, and
it stands under *Left for Andrea* in the root record.
