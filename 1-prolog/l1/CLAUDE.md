# CLAUDE.md – 1-prolog/l1

Guidance for Claude Code working in this class directory. The repository-wide rules are
in the root `CLAUDE.md` and are not repeated here; `HANDOFF.md` beside this file is the
turn record. `README.md` stays barebone: the files, and how to run them.

## The class

Five files, from `iag2627-slides/tex/l1-prolog.tex` (`\decklabel{L1}`), numbered in the
order the deck uses them. The deck's *Lab Repo* frame lists all five and `\labcode`-links
each program from its own frame—`4-naturals.pl` from two. **Both ends move together.**

**This class is Andrea's alone**, unlike `l2`, whose deck is Viroli's and his. The headers
carry his name only, and that is deliberate.

**`1-example1-parent.pl` is named after its predicate, not after the deck's phrase**: at
`1-example1-parent-child.pl` the `\labcode` path came to 38 characters against the deck's
37-character budget, and the built slide broke the URL after `https:`. Any new name here
is checked against that budget before it is chosen.

## What will come up

- **`member/2` is already in 2P-Kt**, as default clauses—the same two as the deck's, bar
  the variable name. Loading `5-lists-member.pl` **adds** its clauses rather than replacing
  them, so four are tried at every step and the counts compound: `member(X,[a])` 2 instead
  of 1, `member(X,[a,b])` 6 instead of 2, `member(X,[a,b,c])` **14 instead of 3**. The
  README warns students not to paste those two clauses in 2P-Kt. **The file keeps them, by
  Andrea's decision**: it is the deck's program.
  - In SWISH there is no problem: `member/2` is autoloaded from `library(lists)` and the
    file's definition takes precedence silently. **Checked in local `swipl` only.**
  - 2P-Kt's documentation claims default predicates are "overridable by loading a static
    knowledge base that redefines them". The web IDE does not do that, and a README here
    said so until Andrea ran it. Run it, do not read about it.
- **`sum(0,s(0),S)` fails, and it is meant to.** `z` is zero in `4-naturals.pl`; `0` is an
  integer and a different term altogether.

## Environment

**Browser only**, 2P-Kt web IDE or SWISH—this class is all Prolog, so the rule covers
all of it. Nothing here has ever been run in SWISH itself: the Chrome extension has never
connected on this machine, and local `swipl` is what every check has used. Say so when
reporting a result.
