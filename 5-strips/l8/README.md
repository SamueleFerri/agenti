# l8 – STRIPS Planning in Prolog

The programs shown in the class, in the order the deck takes them. Every file
stands alone – domain, planner and all – and carries at the bottom, as comments,
the goals the deck asks of it.

| file | what it is |
|---|---|
| [`00-deductive.pl`](00-deductive.pl) | planning as deduction: the situation calculus in Prolog, from M9's example |
| [`01-blocks-world.pl`](01-blocks-world.pl) | M9's Blocks World: a state, a goal, three operator schemes |
| [`02-applicable.pl`](02-applicable.pl) | `holds_all/2`: when an operator applies |
| [`03-apply.pl`](03-apply.pl) | `apply/4` and `step/3`: from one state to the next |
| [`04-plan-naive.pl`](04-plan-naive.pl) | `plan/3`, Prolog's own depth-first search, loops and all |
| [`05-plan-visited.pl`](05-plan-visited.pl) | `solve/3`, never twice in a state |
| [`06-plan-shortest.pl`](06-plan-shortest.pl) | `solve/3`, deeper and deeper: the shortest plan first |
| [`07-sussman.pl`](07-sussman.pl) | the Sussman anomaly |
| [`08-ups-world.pl`](08-ups-world.pl) | M9's UPS World, solved here by search |
| [`09-strips-goal-stack.pl`](09-strips-goal-stack.pl) | STRIPS's own algorithm, one goal at a time: the Sussman anomaly in six steps |
| [`10-strips-ups.pl`](10-strips-ups.pl) | the UPS World, one goal at a time: no plan |

## Running them

Paste one into the [2P-Kt web IDE](https://tuprolog.github.io/2p-kt/web-ide/)
or [SWISH](https://swish.swi-prolog.org), then ask a goal from the foot of it.
In 2P-Kt the program goes in the editor and the goal in the query box; in SWISH
the program goes in the left-hand pane and the goal in the box at the bottom
right.

`04-plan-naive.pl`'s last goal never ends, on purpose: stop it.

In 2P-Kt, `10-strips-ups.pl` answers *timeout* instead of *no*: same meaning,
no plan.
