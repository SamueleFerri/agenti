# l1 – Prolog: Fast Track

The programs shown in the class, one file each, in the order the deck takes
them. Every file carries at the bottom, as comments, the goals the deck asks of
it.

| file | what it is |
|---|---|
| [`1-example1-parent.pl`](1-example1-parent.pl) | Example 1 — four ground facts, and what can already be asked of them |
| [`2-example2-grandparent.pl`](2-example2-grandparent.pl) | Example 2 — the same facts, plus a rule inferring grandparents |
| [`3-example2-sibling.pl`](3-example2-sibling.pl) | Example 2 — the same facts, plus a rule inferring siblings, and `\=`/2 |
| [`4-naturals.pl`](4-naturals.pl) | natural numbers as `z` and `s/1`, `nat/1` and `sum/3` |
| [`5-lists-member.pl`](5-lists-member.pl) | lists, and `member/2` written out |

## Running one

Paste the program into the [2P-Kt web IDE](https://tuprolog.github.io/2p-kt/web-ide/)
or [SWISH](https://swish.swi-prolog.org), then ask a goal of it.

```prolog
?- parent(joey,Child).
```

In 2P-Kt the program goes in the editor and the goal in the query box; in SWISH
the program goes in the left-hand pane and the goal in the box at the bottom
right.

## One thing to know before you paste

**In 2P-Kt, do not paste the two `member/2` clauses of `5-lists-member.pl`.**
2P-Kt ships them already, and loading the file *adds* its clauses rather than
replacing them: `member(X,[a,b,c])` then answers 14 times instead of 3. SWISH
has no such problem.
