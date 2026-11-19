# HANDOFF.md – 1-prolog/l1

The turn record for this class. Repository-wide state is in `.ai/HANDOFF.md` at the root.

Last updated: 2026-09-24, by Claude. Five files, published and pushed; the L1 deck links
every one of them. Nothing is open here.

## The five files

Extracted from `l1-prolog.tex` verbatim, each with the goals the deck asks of it as
trailing comments.

## member/2 in 2P-Kt – the correction, 2026-09-18

A README here stated, on the strength of 2P-Kt's documentation, that loading a knowledge
base redefining `member/2` would override the built-in clauses. **It does not**: the
clauses are added, and the solution counts compound—2, 6 and **14** where the deck says
1, 2 and 3. Andrea found it by running it. The README now tells students not to paste
those two clauses in 2P-Kt, and the file keeps them because it is the deck's program.

The rule that came out of it is in `CLAUDE.md` beside this file, and in the root one:
**run it, do not read about it.**

## The order prefix – 2026-09-24

Files renamed with a `1-`, `2-`, … prefix in the deck's order. One name had to shorten:
`example1-parent-child.pl` became `1-example1-parent.pl`, because prefixed it came to 38
characters against `\labcode`'s 37 and the built deck broke its URL after `https:`.
Andrea chose the shorter name over dropping the `exampleN` part, which maps each file to
the deck's *Example 1* / *Example 2* frames. Verified by building `l1-prolog` and reading
the links back with `pdftotext -layout`: all six on one line, `2-example2-grandparent.pl`
sitting at exactly 37.
