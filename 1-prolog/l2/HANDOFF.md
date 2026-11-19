# HANDOFF.md – 1-prolog/l2

The turn record for this class. Repository-wide state – remotes, what is left for Andrea,
what is open across classes – is in `.ai/HANDOFF.md` at the root.

Last updated: 2026-09-25, by Claude. The class is complete at twenty files, published and
pushed, and the L2 deck links every one of them.

## Two-digit prefixes – 2026-09-25

Andrea saw that GitLab was listing the files with `10-` to `20-` between `1-` and `2-`: it
sorts byte by byte, where the Finder reads the numbers. Files 1 to 9 were renamed `01-` to
`09-`, and the twenty now list in the deck's order. Both ends moved: 13 `\labcode` links
and 9 `\texttt` names in the *Lab Repo* frames of `l2-lp.tex`, and the mentions here, in
`CLAUDE.md`, in `README.md` and in `.ai/HANDOFF.md`.

The budget was the one risk, and it holds: `1-prolog/l2/09-existential-queries.pl` is 37
characters against `\labcode`'s 37. The deck was rebuilt and every link checked on one
line with `pdftotext -layout`. **No longer name fits in this class.**

Andrea settled the rule the same day: it is not a second, different rule but a clause of
the numbering one—**padding applies only where the prefix reaches two digits**. The root
`CLAUDE.md` says so now. `l1` and `2-clp/l4`, five files each, stay unpadded.

## Files 4 to 20 – 2026-09-24

Andrea asked for the Prolog listings that come after the first three, with the goals the
deck proposes, for the lab class. Seventeen files, one per listing, in the deck's order.

**Every file and every goal was run**, in local SWI-Prolog 10.0.2. Two results reached the
deck and were fixed there on his instruction:

- **`range/3` answers four times**, where *Multiple Results* listed three. `range(s³,s³,N)`
  matches the first clause before `greater/2` is called; the tree had drawn the failing
  `greater` without the node above it. Both frames now show the fourth solution—and
  `iag2627-slides/CLAUDE.md` records that this tree is hand-corrected and that
  `placetrees.py` would revert it.
- **Eleven query misprints, none of which parsed as printed**: `?- dec(zero), N).`, a
  bracket too many on both `nextprev` goals and a missing `}` on their answer, a bracket
  short on all three `element` goals and in three labels of their tree.

`18-range.pl` repeats `greater/2` so it runs alone, `09-existential-queries.pl`'s last goal
has five solutions and not the nine I first wrote, and `15-peano.pl` carries a factorial
goal the deck only says could be written.

## The order prefix – 2026-09-24

Files were renamed with a `1-`, `2-`, … prefix in the deck's order, the rule now in the
root `CLAUDE.md`. Here it cost nothing: `java 01-NextPerm.java` and `/open` both resolve
the class, and `scala repl 03-permutation.scala` still preloads.

## 03-permutation.scala – added 2026-09-18

Closed the Scala item that had stood open. `permutations` gives 24, 6 and 24 results for
the three lists, matching `02-permutation.pl`. `member`'s base case is `case Nil => Nil`—
`case a :: Nil` was non-exhaustive and the compiler said so. The file has no `main`, as
the Prolog has no driver.

**Reading browser-only as repository-wide cost real time that day**: several minutes went
into looking for a browser Scala environment for a class whose README already said *In a
Terminal*. The root `CLAUDE.md` now scopes the rule.

## The first three files

From `l2-lp.tex`, verbatim. **`swap` is not on the deck** and had to be written for the
Java to run; it is marked as such. The deck shows `nextperm` twice, stub and javadoc, and
both comments are kept over one body. **The trailing goals of `02-permutation.pl` are
Andrea's own**, written 2026-09-17—the deck asks none.

Verified: `java 01-NextPerm.java` prints 24 lines; `permutation([1,2,3,4],P)` gives 24
solutions. The jshell transcripts in the README were captured through a pty, which caught
`-q` silencing declarations.

## Open

- **jshell takes top-level method declarations**, so pasting `nextperm` itself instead of
  `/open`-ing the file would let the deck's driver run unedited. Untested; it would change
  what `01-NextPerm.java` is for.
