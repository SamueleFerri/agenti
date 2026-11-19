# l3 – Programming in Prolog

The programs shown in the class, in the order the deck takes them. Every file
carries at the bottom, as comments, the goals the deck asks of it. Files with no
program – `01-`, `04-`, `14-`, `21-` to `24-` – hold only goals over built-in
predicates.

| file | what it is |
|---|---|
| [`01-list-syntax.pl`](01-list-syntax.pl) | `append/3` over `[H\|T]` lists |
| [`02-find-position.pl`](02-find-position.pl) | `find`, `position`, `join` over `[H\|T]` lists |
| [`03-relationality.pl`](03-relationality.pl) | the same predicates, asked with variables anywhere |
| [`04-operators.pl`](04-operators.pl) | `=`, comparison, `is/2` |
| [`05-sum.pl`](05-sum.pl) | `sum/2` over a list of numbers |
| [`06-terminology.pl`](06-terminology.pl) | `element/2`, for the terminology wrap-up |
| [`07-sum-nontail.pl`](07-sum-nontail.pl) | `sum/2`, non-tail recursive |
| [`08-sum-tail.pl`](08-sum-tail.pl) | `sum/2`, tail recursive |
| [`09-join-tail.pl`](09-join-tail.pl) | `join/3`, tail recursive |
| [`10-update.pl`](10-update.pl) | `update/4`, immutability and sharing |
| [`11-join-search.pl`](11-join-search.pl) | `join/3`, searching solutions |
| [`12-permutation.pl`](12-permutation.pl) | `member2/3` and `permutation/2` |
| [`13-perm-pitfall.pl`](13-perm-pitfall.pl) | the same, asked the other way round |
| [`14-combinations.pl`](14-combinations.pl) | combinations of solutions of two goals |
| [`15-gridlink.pl`](15-gridlink.pl) | `gridlink/3`, links in a grid |
| [`16-merge.pl`](16-merge.pl) | `merge/3`, without cut |
| [`17-merge-cut.pl`](17-merge-cut.pl) | `merge/3`, with cut |
| [`18-first-index-of.pl`](18-first-index-of.pl) | `first_index_of/3`, cut in the clause |
| [`19-index-of.pl`](19-index-of.pl) | `index_of/3` and `first_index_of2/3`, cut after the call |
| [`20-quicksort.pl`](20-quicksort.pl) | `quicksort/2` and `partition/4` |
| [`21-inspecting-terms.pl`](21-inspecting-terms.pl) | `atom`, `var`, `number`, `compound`, `ground` |
| [`22-term-comparison.pl`](22-term-comparison.pl) | unification, equality, `copy_term/2` |
| [`23-terms-as-strings.pl`](23-terms-as-strings.pl) | `atom_chars`, `atom_codes`, `atom_concat`, `number_chars` |
| [`24-term-structure.pl`](24-term-structure.pl) | `=..`, `functor/3`, `arg/3` |
| [`25-console-io.pl`](25-console-io.pl) | `sum/2` logging with `write/1` and `nl/0` |
| [`26-few-examples.pl`](26-few-examples.pl) | `all/2` and a fully-relational `size/2` |
| [`27-db-tables.pl`](27-db-tables.pl) | a table as a list of `user/3` terms |
| [`28-bintree-search.pl`](28-bintree-search.pl) | `search/2` over `tree/3` and `nil` |
| [`29-bintree-ops.pl`](29-bintree-ops.pl) | `leaves/2` and `leftlist/2` |
| [`30-nary-lists.pl`](30-nary-lists.pl) | `searchN/2`, n-ary trees with lists of children |
| [`31-nary-univ.pl`](31-nary-univ.pl) | `searchV/2`, n-ary trees with `=..` |
| [`32-factorial-cache.pl`](32-factorial-cache.pl) | factorials with a partial list as cache |

## Running them

Paste one into the [2P-Kt web IDE](https://tuprolog.github.io/2p-kt/web-ide/)
or [SWISH](https://swish.swi-prolog.org), then ask a goal from the foot of it.
In 2P-Kt the program goes in the editor and the goal in the query box; in SWISH
the program goes in the left-hand pane and the goal in the box at the bottom
right. For the files with no program, just ask the goals.

In SWISH:

- the first goal of `01-list-syntax.pl` fails: SWI-Prolog does not build lists
  with `'.'/2`;
- `26-few-examples.pl` reports *No permission to modify static procedure
  `length/2`*, since `length/2` is built in. The goals still run, on the
  built-in one.
