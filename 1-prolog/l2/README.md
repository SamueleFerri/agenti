# l2 – Logic Programming and Core Prolog

The programs shown in the class, in the order the deck takes them. Every file
carries at the bottom, as comments, the goals the deck asks of it.

| file | what it is |
|---|---|
| [`01-NextPerm.java`](01-NextPerm.java) | `nextperm`, permutations of an array in place |
| [`02-permutation.pl`](02-permutation.pl) | `member/3` and `permutation/2` |
| [`03-permutation.scala`](03-permutation.scala) | `member` and `permutations` |
| [`04-resolution-trees.pl`](04-resolution-trees.pl) | the propositional program the resolution trees are drawn for |
| [`05-inference-rules.pl`](05-inference-rules.pl) | a rule as a name for a composition of goals |
| [`06-terms.pl`](06-terms.pl) | the syntax slide: predicates, functors, arity |
| [`07-grandfather.pl`](07-grandfather.pl) | `father`/`grandfather`, one resolution step per goal |
| [`08-querying-facts.pl`](08-querying-facts.pl) | ground facts as a database |
| [`09-existential-queries.pl`](09-existential-queries.pl) | goals with variables, and combinations |
| [`10-universal-facts.pl`](10-universal-facts.pl) | variables in facts |
| [`11-records.pl`](11-records.pl) | facts relating structured terms |
| [`12-wildcard.pl`](12-wildcard.pl) | `_` in a clause and in a goal |
| [`13-booleans-facts.pl`](13-booleans-facts.pl) | propositional logic as universal facts |
| [`14-booleans-rules.pl`](14-booleans-rules.pl) | the same, with `b_or` and `b_implies` as rules |
| [`15-peano.pl`](15-peano.pl) | `succ`, `sum`, `mul`, `dec`, `factorial` on `zero`/`s` |
| [`16-greater.pl`](16-greater.pl) | a predicate as a function returning a boolean |
| [`17-nextprev.pl`](17-nextprev.pl) | two output arguments |
| [`18-range.pl`](18-range.pl) | many solutions by backtracking |
| [`19-element.pl`](19-element.pl) | `element` over `cons`/`nil` lists |
| [`20-lists.pl`](20-lists.pl) | `find`, `position`, `concat`, `count` |

## The Prolog files

Paste one into the [2P-Kt web IDE](https://tuprolog.github.io/2p-kt/web-ide/)
or [SWISH](https://swish.swi-prolog.org), then ask a goal from the foot of it.
In 2P-Kt the program goes in the editor and the goal in the query box; in SWISH
the program goes in the left-hand pane and the goal in the box at the bottom
right.

## 01-NextPerm.java

Needs a JDK, in a Terminal:

```bash
cd 1-prolog/l2
jshell
```

```
/open 01-NextPerm.java
int[] a = {1, 2, 3, 4}
NextPerm.nextperm(a)
a
```

`NextPerm.main(null)` runs it whole, and `java 01-NextPerm.java` does the same
outside jshell: 24 lines, `[1, 2, 3, 4]` to `[4, 3, 2, 1]`.

## 03-permutation.scala

Needs Scala 3, in a Terminal:

```bash
cd 1-prolog/l2
scala repl 03-permutation.scala
```

The file is loaded, so ask for the expressions at the foot of it:

```
permutations(List(1, 2, 3))
```

`:quit` leaves.
