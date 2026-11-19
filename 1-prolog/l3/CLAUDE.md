# CLAUDE.md – 1-prolog/l3

Guidance for Claude Code working in this class directory. The repository-wide rules are
in the root `CLAUDE.md` and are not repeated here; `HANDOFF.md` beside this file is the
turn record. `README.md` stays barebone: the files, and how to run them. Everything I
learn about them belongs here instead.

## The class

Thirty-two files, from `iag2627-slides/tex/l3-prolog.tex` (`\decklabel{L3}`), one per
Prolog listing, numbered in the order the deck shows them. The deck's *Lab Repo* frame lists all 32 and
every code frame `\labcode`-links its file. **Both ends move together.** Past ten files, so the prefix is
two digits, `01-` to `32-`. The longest link, `1-prolog/l3/21-inspecting-terms.pl` and
`23-terms-as-strings.pl`, is 34 characters against `\labcode`'s 37.

**This class is Viroli's and Andrea's**, as `l2` is: the deck is ported from Viroli's PPS
2025/2026 *11 – Programming in Prolog*. The headers credit both, Viroli first.

**Listings repeat, and so do the files.** `find`, `join`, `sum/2` and `permutation/2`
appear on several frames, each with its own goals or tree; each frame's listing is its own
file, so a student on any frame has the file for it. Do not merge them.

**Goal-only files.** `01-`, `04-`, `14-` and `21-` to `24-` hold no clauses: the frame asks
goals of built-ins only. They exist so that every frame with goals has a file.

**Goals from trees.** `11-`, `12-`, `13-`, `18-` and `19-` have no goal written on the
frame; the goal is the root of the resolution tree, and the file says *the root of the
deck's tree*, with the answers the tree shows.

**`03-relationality.pl` repeats code from elsewhere**, marked in the source: `position` and
`join` from `02-`, and `sum/3`, `mul/3` from `1-prolog/l2/15-peano.pl`, which the frame's
goals call without listing. Same move as `18-range.pl` in `l2`.

## What was not extracted

- *What Cut Prunes* (`go :- p,a.` …): it has `go :- ...` in it, notation, not a program.
- *I/O Notation* (`member(?E, ?L).` …): documentation syntax, as the frame says.
- *Bidirectional Lists* and the *Dynamically Expanding Lists* design frame: no code.
- The resolution trees and the `'.'/2` prose.

## Environment

**Browser only**, 2P-Kt web IDE or SWISH. Everything was run in local SWI-Prolog 10.0.2 on
2026-09-30, and **every goal of all 32 files again on 2026-10-01 in SWISH and in the 2P-Kt
web IDE 2.0.10-dev06-4691231d8**, through the Chrome extension. Both answer as the deck
throughout, bar the two SWISH points the README already gives (`01-`'s first goal, `26-`'s
*No permission*). In 2P-Kt: `01-`'s `'.'/2` goal succeeds, as the deck says; `26-` loads
silently and `size([10,20,30], N)` answers once; `25-`'s `write/1` output lands in the
*Stdout* pane, not among the answers; `copy_term(a(10,X), Y)` prints `Y = a(10, X)`, but
the copy's variable is fresh—checked with `==`, a display quirk only; `13-` gives
`L = [a, b]` first. In SWISH `13-` then reports *Stack limit (0.2Gb) exceeded*.

## What will come up

- **Deck misprints are copied, not fixed**—the root rule. The six reported on 2026-09-30
  were fixed in the deck that evening at Andrea's word, and the files followed; see
  `HANDOFF.md`. The files and the deck agree again.
- **`01-list-syntax.pl`'s first goal fails in SWI-Prolog**: since version 7 lists are
  `'[|]'/2`, and `'.'/2` is not the list constructor. Succeeds in 2P-Kt, as the deck says—
  measured 2026-10-01. The README warns about SWISH.
- **`26-few-examples.pl` redefines `length/2`**, which SWI-Prolog refuses: *No permission to
  modify static procedure `length/2`*, twice, at load. The rest loads and the three goals
  answer as the deck says, on the built-in `length/2`. The README warns. In 2P-Kt it loads
  without a message and `size([10,20,30], N)` answers once—measured 2026-10-01.
- **`partition/4`, `permutation/2`, `append/3`**: SWI takes the file's definition over the
  autoloaded library one silently. `append/3` in `20-` and `29-` is the library's.
- **`10-update.pl` answers twice**: `L/[10,21,30,40]`, then `L/[10,20,30,40]`—the third
  clause also applies where the second does, and the first closes it. The deck shows only
  the first and its comment says *first occurrence*. Not a misprint; noted to Andrea.
- **No singleton warnings**: on 2026-10-02 Andrea had every unused variable turned into `_`,
  in the deck and here alike—`02-`, `03-` (`position`'s `H`, `mul`'s `X`), `15-`
  (`interval`'s `B`).
- **Meant to misbehave**, as the deck says: `13-perm-pitfall.pl` answers `L/[a,b]` then
  overflows the stack; `find(L, a)` in `03-` has infinitely many answers; the two `is/2`
  goals at the foot of `04-` raise a type and an instantiation error.

## Measured, SWI-Prolog 10.0.2

Every goal at the foot of every file was run, with the misprinted ones also run corrected.
All answers match the deck except those listed in `HANDOFF.md`. Worth knowing:

- `03-`: `join(L, M, [a,b,c])` four answers, `sum(N1, N2, s³)` four, `mul(N1, N2, s⁴)` two
  (`s⁴·s¹`, `s²·s²`) and then does not terminate.
- `15-gridlink.pl`: 24 links on the 3×3 grid, the last two as the deck prints.
- `16-merge.pl`: `merge([],[],L)` twice, as the deck says.
