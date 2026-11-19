# HANDOFF.md – 1-prolog/l3

The turn record for this class. Repository-wide state is in `.ai/HANDOFF.md` at the root.

Last updated: 2026-09-30, late, by Claude from the `iag2627-slides` session. **Written, run,
misprints fixed, committed and pushed on 2026-10-01.** Andrea asked for `1-prolog/l3` from the L3 deck, then left
the session to run on its own.

## SWISH and 2P-Kt – 2026-10-01

Andrea asked for `l3` to be checked in both browsers, as `l4` was. All 32 files, every goal,
in SWISH and the 2P-Kt web IDE: all as the deck, bar what the README already says for
SWISH. Nothing in the files or the README changed; the findings are in `CLAUDE.md`
(*Environment*). No 2P-Kt bug met.

## Language pass – 2026-10-01

The deck's language pass reached four code comments copied here, fixed together with the
deck: `04-` `X+5` (lowercase `x` is an atom), `23-` *ASCII*, `27-` *NewTuple* (the
argument's own name), `29-` *empty tree*; `26-`'s header reads *A few examples*, after the
frame title, the file name unchanged; and the README glosses `30-` as *lists of children*.
Committed and pushed.

## Misprints fixed – 2026-09-30, late

Andrea went through the list below from the `iag2627-slides` side and asked for all of it,
deck and files together. Changed here: `02-` (*with with*), `03-` (both Peano goals closed,
the `%` column moved one right to stay aligned), `06-` (`element` goal closed), `17-`
(`Ys, Ys`), `22-` (`\==` for `=\=`, three goals), `29-` (`L/[10,30]`), `30-` (`searchN`
recursing on itself). Re-run in SWI-Prolog 10.0.2: `merge` gives `[5,10,20,35]`, the three
`\==` goals no, yes, no, `leaves` `[10,30]`, `searchN` 20, 10, 40, 30, and both Peano goals
now parse and answer. Items 5's tree labels and 6 were deck-only and are fixed there too,
with two more the list missed in the `join` tree (a stray `]` twice, `T2/` for `T2'/`).
The section below is kept as the record of what was found.

## First extraction – 2026-09-30

Thirty-two files from `iag2627-slides/tex/l3-prolog.tex`, one per Prolog listing, in the
deck's order, with the deck's goals at the foot. Everything was run in local SWI-Prolog
10.0.2; the Chrome extension is still not connected, so neither SWISH nor 2P-Kt.

### The deck's misprints, as found (all fixed since, above)

Copied verbatim into the files, per the root rule. In `l2` such misprints were fixed in the
deck on his instruction; the same is proposed here, and the files follow the deck.

1. **`17-merge-cut.pl`: `merge([], Ys Ys).`** — a missing comma, a syntax error. The clause
   is dropped at load, and then `merge([10,20],[5,35],L)` **fails** instead of giving
   `[5,10,20,35]`. With `Ys, Ys` both goals answer once, as the deck says. The one that
   matters most: the program on the slide does not work.
2. **`22-term-comparison.pl`: `=\=` for term inequality.** `=\=` is arithmetic; all three
   goals raise *type_error(evaluable, b/0)*. With `\==` they answer no, yes, no—exactly the
   deck's answers. The *Library Predicates* frame lists `=\=/2` under comparison too.
3. **`30-nary-lists.pl`: `searchN` calls `search(T, E)`**, not `searchN(T, E)`. After `E/20`
   it raises *Unknown procedure search/2*. With `searchN` it answers 20, 10, 40, 30, as the
   deck says.
4. **`29-bintree-ops.pl`: `leaves` answers `L/[10,30]`**, the deck says `L/[30,40]`. The
   program is right: `40` has a left son, so it is not a leaf, and `10` is. The answer on the
   slide is what is wrong.
5. **Goals a bracket short**, which do not parse as printed: `sum(N1, N2, s(s(s(zero))).`
   and `mul(N1, N2, s(s(s(s(zero)))).` in `03-`, and
   `element(b, cons(a, cons(b, cons(c, nil))).` in `06-`.
6. **Smaller, in the trees, not in any file**: the `sum` tree of *Working with Math* has
   `M'` for `S'` on two nodes; the tail-recursive `sum` tree has `N2''''` for `N2'''`; the
   `join` tree has `[30, 40, 40]`; and the *Library Predicates* frame has `atom_concat/2`
   for `/3` and `functor/2` for `/3`; and *with with* in `position`'s comment, copied into `02-`. Not checked further; for him to look at.

Also noted, not a misprint: `10-update.pl` answers a second time with the list unchanged.

### Not done

- ~~Not committed~~—committed and pushed on both sides on 2026-10-01, at Andrea's word.

### The deck side, same session

`l3-prolog.tex` had no *Lab Repo* frame and no links. Added, uncommitted: the frame just
before *Built-in List Syntax*, listing all 32 with this README's glosses, and a `\labcode`
atop each of the 32 frames. Rebuilt, 105 → 110 pages, the five new ones all the *Lab Repo*
frame; every link on one line; the Desktop copy in `• next/` refreshed. Recorded in
`iag2627-slides/.ai/HANDOFF.md`. The misprints above were **not** touched there.
