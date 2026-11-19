# HANDOFF.md – 5-strips/l8

**Moved on 2026-11-02** from `1-prolog/l8` to `5-strips/l8`, a part of its own (Andrea); the entries below keep the
path they had.

The turn record for this class. Repository-wide state is in `.ai/HANDOFF.md` at the root.

Last updated: 2026-11-02, by Claude. Eleven files, `00-` to `10-`, every goal run in SWI-Prolog, SWISH and the 2P-Kt web IDE.

## 1-prolog/l8 – added 2026-10-18

At Andrea's word: the lab for L8, *STRIPS Planning in Prolog*, after M9. Started from a guide
and a solution by Claude Science, which did not work (`CLAUDE.md`, *Provenance*); rewritten on
M9's domains, his choice, in nine files. Every goal run in three engines, answers equal.

## 2026-11-02 – files and deck checked one to one

The day's changes (planning as deduction, STRIPS's own algorithm, the `forall/2` pitfall removed, the files
renumbered) are in `CLAUDE.md`. Then the whole class was checked: every goal of the eleven files in SWI-Prolog
10.0.2, `09-` and `10-` in SWISH too, answers as the comments and slides say; every slide code line and goal in its
`\labcode` file; no load warnings. Fixed: `01-` and `06-` wrote answers as `X / a`, now `X = a` like the rest;
the L8 slide *Example: Blocks World* (was *Block World*; M9's frame still reads so); `1-prolog/README.md`'s L8
topics. L8's HTML page is still the one of 2026-10-31: the deck is being prepared, so PDF only until Andrea calls it
done.

## 2026-11-02 – the 2P-Kt web IDE

Every goal run in the web IDE (WebKit, Playwright): all as in SWI but `10-`, *timeout* instead of *no*; noted in
`README.md` and `CLAUDE.md`. `README.md`'s `08-` line now reads *solved here by search* (it said linear STRIPS
cannot solve it, while its goal finds a plan). Teach notes in `teach/5-strips/l8/` (gitignored).
