# HANDOFF.md – 1-prolog/l5

The turn record for this class. Repository-wide state is in `.ai/HANDOFF.md` at the root.

Last updated: 2026-10-15, by Claude. Andrea asked for `1-prolog/l4` from the L4 deck, *the
same work we just did for L3*. **Written, run in SWI, SWISH and 2P-Kt, committed and pushed on 2026-10-01.**


**Renumbered on 2026-10-06, at Andrea's word**: metaprogramming is postponed and constraints come
first, so `1-prolog/l4` → `1-prolog/l5` (L5 – Metaprogramming in Prolog) and `2-clp/l5` → `2-clp/l4`
(L4 – Constraints in Prolog), with `git mv`; file headers, READMEs and the decks'
`\labcode`/`\labdir` links (`l4-clpfd`, `l5-metaprogramming` in `iag2627-slides`) follow. Older
sections here keep the old numbers as written.

## `11-full-resolution.pl`, `rule/2` together – 2026-10-16

The deck's *It is Actual "Full Resolution"!* now shows only the two `search` facts and the query. At
Andrea's word the file keeps the whole program, but with every `rule/2` clause together (the `search`
facts after `rule(c, [c])`), so the *not together* warning is gone. SWI and SWISH: `[10,20,30]`, `d`
twice, `e` none. Goal header: *the first four from the frame before*.

## 2P-Kt and `dynamic` – 2026-10-16

Andrea tried `09-` in the 2P-Kt web IDE (a private Safari window, so no saved programs):
`:- dynamic cached/1.` is not parsed there; `:- dynamic(cached/1).` works, as in SWI and SWISH.
His decision: no change, the course stays on SWISH this year. Recorded in `CLAUDE.md`.

## `09-factorial-cache.pl` guarded – 2026-10-16

Andrea noticed the factorial differed from the earlier decks' (L2 Peano, L4 `n_factorial` with
`N #> 0`). Without a guard, `factorial(0,1)` and the recursive clause overlapped, so backtracking
went on to `-1`, `-2`, … for ever (measured: depth limit hit, 3-second timeout); only `once/1` in
`withcache` hid it. At his word, `X > 0` added, deck and file, the clause wrapped onto two lines
to keep the deck's code width. `factorial(3,N)` now has the one solution `6`; SWISH (with
`:- dynamic cached/1.`) gives the deck's cache answers.
Then, at his word, the directive went into the program itself, deck and file, after SWISH gave him the
existence error; the README no longer tells students to add it. 2P-Kt not re-tested.
And, SWISH dropping asserts between queries, the goals no longer rely on earlier ones: each does its own
`withcache` calls (six goals, deck and file, all run on SWISH as written). The SWISH-only conjunction added
first was dropped as redundant.

## `08-if-then-else.pl`, the rest from `08-` up one – 2026-10-15

At Andrea's request, an exercise for the deck's new *Other Control Predicates* frame: `max/3` and
`sign/2` (if-then-else nested as else-if), four goals, same answers in SWI and on SWISH. Files
`08-factorial-cache` … `14-trace-bound` moved to `09-` … `15-` with `git mv`; the `search/2` notes
(now `12-vanilla.pl`), README, CLAUDE.md and the deck's links follow. **Sections below keep the
numbers they were written with.**

## Goals for `07-disjunction.pl` – 2026-10-15

At Andrea's request, the file having *No goal on the deck*: `neighbour(X,Y,5,5)` (`5/6, 5/4, 6/5,
4/5`), `neighbour(5,6,5,5)` *yes*, `neighbour(6,6,5,5)` *no*, then added to the deck under the code, at his
word, so the file says *from the deck*. Same answers in SWI and on SWISH (Pengines API).

## `05-map.pl` SWISH-only – 2026-10-15

At Andrea's word: the `once(call(P,H,H2))` clause alone, deck and file, the `=..` one gone. Tested on
SWISH through its Pengines API, `L = [11,21,31]`; 2P-Kt now answers *no* (#992), as the README says.
The deck's *Solving Goals* gained a `call/N` item to go with it.

## `01-univ.pl` first, the rest up one – 2026-10-15

At Andrea's word, the *e.g.* for univ on the *Everything is a Term* frame,
`person(gio,35) =.. L`, became the first exercise: `01-univ.pl`, goal-only, `L / [person,gio,35]`
checked in SWI; then, as Andrea extended the deck, `?- T =.. [person,gio,35].` / `T / person(gio,35)`
too. Every other file moved up one with `git mv` (`01-surface-syntax` → `02-` …
`13-trace-bound` → `14-`); the `search/2` source notes in `13-` and `14-`, `README.md`,
`CLAUDE.md` and the deck's `\labcode` links and *Lab Repo* frame follow. **Sections below
this one keep the numbers they were written with**, one lower than today's.

## Checked against the revised deck – 2026-10-15

Andrea revised the L5 deck (`c0126ea` in `iag2627-slides`): no *Outline* frame, *Intro* →
*Meta-level Programming*, shorter frame titles, language corrections; no code changed. Checked:
all 13 `\labcode` paths exist, every verbatim line is in its file, and the goals at each file's
foot are the deck's, in order. Not run again, as the code is byte-identical to what was run on
2026-10-01. At his word, the headers of `12-` and `13-` took the new frame titles (`b20d7db`).

## The deck's language pass – 2026-10-01

Done from `iag2627-slides`, 15 items, all approved. One reached here: *susbtitution* →
*substitution* in the comment of `08-` and `09-`. The deck's `assert(p(X):-q(X))` example
became `assert((p(X):-q(X)))` (see `CLAUDE.md`, *What was not extracted*); no file here
holds it. Committed and pushed with the deck.

## `04-` for SWISH – 2026-10-01

No single `map/3` clause runs everywhere (SWISH sandbox vs 2P-Kt's missing `call/3`, filed
as #992), so at Andrea's suggestion the deck and file carry both, the SWISH one commented,
each marked with its tool. Tested in all three; deck rebuilt, Desktop copy refreshed.

## Trying to fix `11-` – 2026-10-01

Andrea: *could we fix 11?* The SWISH change was then applied, deck and file, at his word;
README and `CLAUDE.md` updated, the 2P-Kt findings added to #990. As measured:

- **SWISH: fixable.** Replace `builtins/1` + `call(G)` with one clause per built-in
  (`solveB(X is E) :- !, X is E.`, likewise `=`, `\=`, `==`); the three goals then answer
  `S = 60`, true, false. The slide's *rule 4 … call(G)* note would need rewording.
- **2P-Kt: not fixable from Prolog.** Three workarounds for #990 all still answer *no*:
  a fresh head via `functor/3` before `clause/2`; `copy_term/2` of the goal before
  `clause/2`; `clause/2` inside `findall/3` then `member/2`. The body-only `N2` of a new copy
  is conflated with a live `N2` of an earlier copy even when the goal passed to `clause/2`
  shares no variable with it—added to #990.

## `03-dsl.pl` made to work in 2P-Kt – 2026-10-01

The list `op(100,fx,[person,…])` split into five `op/3` directives, deck and file, at
Andrea's word—the workaround for #989. Run on the edited file in SWI, SWISH and 2P-Kt:
all three give the deck's four bindings. Deck rebuilt, 43 pages, Desktop copy refreshed.
The README's 2P-Kt note on `03-` is gone.

Then, at his word, the *Experiments in \tuprolog* block (*should better use from now
tuProlog 3.3*) left the deck's Intro, and `% use as DSL (IDE 3.3)` became `% use as DSL`,
deck and file. Rebuilt, Desktop copy refreshed. The last two went too, at his word, *if
they make no sense*: the *Operators* block title lost *apparently they work in tuProlog 3.3,
and have bugs in tuProlog 4.\**, and *Changing Programs* its *(e.g. tuProlog 3.3 or 4.0)*.
No 3.3 is left in the deck.

## Browsers and 2P-Kt issues – 2026-10-01

With the Chrome extension connected, Andrea asked for SWISH and 2P-Kt, then for an issue per
2P-Kt bug. Results in `CLAUDE.md` (*Browsers*); filed #989, #990, #991 on
`tuProlog/2p-kt`. The README now carries the practical notes for both. It had told SWISH
users to prefix `dynamic(cached/1),` to the goal: wrong, the sandbox refuses it, corrected.

**`11-` runs in neither browser; the deck stays silent.** Andrea: change the deck only if
totally sure. Not sure: local SWI works, but 2P-Kt on the JVM is untried, and #990 may be
fixed. Revisit when #990 closes—re-run `11-` in the web IDE then.

## Misprint fixed – 2026-10-01

Andrea asked for the `;` frame's two missing periods to be added in the deck and in
`06-disjunction.pl`. Done; the file loads and answers `5/6, 5/4, 6/5, 4/5`. Deck rebuilt,
Desktop copy refreshed. The section below is kept as the record of what was found.

## First extraction – 2026-10-01

Thirteen files from `iag2627-slides/tex/l4-metaprogramming.tex`, one per Prolog listing, in
the deck's order, with the deck's goals at the foot. Every code line checked verbatim
against the deck's `verbatim` blocks. Everything run in local SWI-Prolog 10.0.2; the Chrome
extension is still not connected, so neither SWISH nor 2P-Kt.

### The deck's misprints, as found (fixed since, above)

Copied verbatim into the files, per the root rule. In `l3` Andrea had them fixed on both
sides; the same is proposed here, and the files follow the deck.

1. **`06-disjunction.pl`: both `neighbour` clauses lack a final `.`** — a syntax error,
   the file defines nothing. The frame asks no goal, so nothing on the slide visibly fails,
   but a student pasting it gets an error.

That is the only one in code. Not misprints, but noted to him: `07-`'s goals assume an
undefined predicate fails, which SWI does not do (README warns); `factorial/2` has no
guard, so backtracking into it does not terminate.

### The deck side, same session

See `iag2627-slides/.ai/HANDOFF.md`.
