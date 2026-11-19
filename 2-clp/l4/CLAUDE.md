# CLAUDE.md – 2-clp/l4

Guidance for Claude Code working in this class directory. The repository-wide rules are
in the root `CLAUDE.md` and are not repeated here; `HANDOFF.md` beside this file is the
turn record. `README.md` stays barebone: the files, and how to run them.

## The class

Five files, from `iag2627-slides/tex/l4-clpfd.tex` (`\decklabel{L4}`), numbered in the
order the deck uses them, each `\labcode`-linked from its frame—`1-arithmetic.pl` from
two. **Both ends move together.** This class is Andrea's alone, and the headers say so.

**Why the part is `2-clp` and not `2-constraints`.** `\labcode`'s in-repo path budget is
37 characters at `\smaller`, and the deck links every file. `2-clp/l4/` costs 9 of those
where `2-constraints/l4/` costs 17; the longest link, `2-clp/l4/2-send-more-money.pl`, is
29 with the order prefix and was 26 before it. Verified to render on one line with
`pdftotext -layout` on the built deck, both times.

## Environment

**SWISH only.** These programs need `library(clpfd)`, and 2P-Kt ships no CLP library—
there is no such module in its repository. Part `1-prolog` runs in either system; this one
does not. The timings were measured in **local SWI-Prolog 10.0.2**; on 2026-10-06 every
file was also run on SWISH itself (SWI-Prolog 10.1.12, through its pengine API), with the
deck's answers. SWISH is slower: 24 queens under `label/1` took 11.4 s there.

## What will come up

- **Ask a goal without labelling first.** It is the point of the class: `puzzle(As + Bs =
  Cs)` answers with the constraints that are left. `S` is already 9, `M` already 1, `O`
  already 0, before any search has happened.
- **Sometimes there is no search left to do.** `problem(1, Rows), sudoku(Rows)` returns
  the grid solved—`all_distinct/1` propagates strongly enough that labelling has nothing
  to decide. `problem(2, Rows)` is harder and does need `labeling/2`.
- **The labelling strategy is not a detail.** On 24 queens, `label/1` takes 5.2 s and
  `labeling([ff], Qs)` 0.003 s; `ff` still answers `n_queens(100, Qs)` in 0.07 s.
- **A stronger propagator is not always faster**, which is the honest half of that story.
  On the hard sudoku `all_distinct/1` takes 0.065 s and the weaker `all_different/1`
  0.018 s—while on the easy one `all_different/1` leaves search to do that costs 2.7 s
  where `all_distinct/1` costs nothing at all.

All four measurements are SWI-Prolog 10.0.2 on this machine. Re-measure rather than
copy them forward if the version moves.

## Provenance

`2-send-more-money.pl`, `3-queens.pl` and `4-sudoku.pl` are the `clpfd` manual's models,
credited in the source. `1-arithmetic.pl`'s factorial is the manual's and *The Power of
Prolog*'s, credited the same way. `5-knapsack.pl` was written here. Keep the credits.
