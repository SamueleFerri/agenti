# l5 – Metaprogramming in Prolog

The programs shown in the class, in the order the deck takes them. Every file
carries at the bottom, as comments, the goals the deck asks of it. `01-` and
`02-` have no program: they hold only goals over built-in predicates.

| file | what it is |
|---|---|
| [`01-univ.pl`](01-univ.pl) | `=..` from a term to its list and back |
| [`02-surface-syntax.pl`](02-surface-syntax.pl) | braces, commas and `=..` |
| [`03-operators.pl`](03-operators.pl) | `op/3`: `~` as a predicate, `::` as a functor |
| [`04-dsl.pl`](04-dsl.pl) | prefix operators for a `person` DSL |
| [`05-map.pl`](05-map.pl) | `map/3` with `=..` and `once/1` |
| [`06-findall-filter.pl`](06-findall-filter.pl) | `findall/3` and `filter/4` |
| [`07-disjunction.pl`](07-disjunction.pl) | `neighbour/4` with `;` |
| [`08-if-then-else.pl`](08-if-then-else.pl) | `max/3` and `sign/2` with `->` |
| [`09-factorial-cache.pl`](09-factorial-cache.pl) | `withcache/1`, caching with `assert/1` |
| [`10-resolution.pl`](10-resolution.pl) | `solve/1` over `rule/2` facts |
| [`11-full-resolution.pl`](11-full-resolution.pl) | the same, with `search/2` as `rule/2` facts |
| [`12-vanilla.pl`](12-vanilla.pl) | `solveV/1`, the vanilla metainterpreter |
| [`13-builtins-control.pl`](13-builtins-control.pl) | `solveB/1`, with built-ins, `once/1` and `not/1` |
| [`14-reverse-order.pl`](14-reverse-order.pl) | `solveI/1`, solutions in reverse order |
| [`15-trace-bound.pl`](15-trace-bound.pl) | `solveT/3`, with a trace and a size bound |

## Running them

Paste one into the [2P-Kt web IDE](https://tuprolog.github.io/2p-kt/web-ide/)
or [SWISH](https://swish.swi-prolog.org), then ask a goal from the foot of it.
In 2P-Kt the program goes in the editor and the goal in the query box; in SWISH
the program goes in the left-hand pane and the goal in the box at the bottom
right. For `01-` and `02-`, just ask the goal.

In 2P-Kt:

- `05-map.pl` answers *no*: it is written for SWISH, and 2P-Kt has no `call/3`
  ([#992](https://github.com/tuProlog/2p-kt/issues/992));
- `13-builtins-control.pl` answers *no* to `sum`, because of a 2P-Kt bug
  ([#990](https://github.com/tuProlog/2p-kt/issues/990)); it runs in SWISH;
- the editor marks lines using `~`, `::` or the DSL operators as errors; they
  load and run all the same
  ([#991](https://github.com/tuProlog/2p-kt/issues/991)).

In SWISH:

- `09-factorial-cache.pl`: SWISH forgets asserted clauses after each query, so
  each goal in the file does its own `withcache` calls;
- in `10-resolution.pl` and `11-full-resolution.pl`, `rule/2` is highlighted
  because SWI-Prolog has a built-in of the same name: the program's own takes
  precedence.
