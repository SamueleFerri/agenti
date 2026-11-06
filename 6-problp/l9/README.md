# l9 – Reasoning Under Uncertainty in Prolog

The programs shown in the class, in the order the deck takes them. Every file
carries at the bottom, as comments, the goals the deck asks of it. The
exercises, with their answers, are in [`EXERCISES.md`](EXERCISES.md).

| file | what it is |
|---|---|
| [`1-sneezing.pl`](1-sneezing.pl) | four worlds, counted by hand and then by `prob/2` |
| [`2-severity.pl`](2-severity.pl) | three alternatives per rule: nine worlds |
| [`3-eruption.pl`](3-eruption.pl) | two probabilistic clauses, one grounded twice: eighteen worlds |
| [`4-path.pl`](4-path.pl) | explanations that overlap, and the BDD that fixes it |
| [`5-alarm.pl`](5-alarm.pl) | a Bayesian network as an LPAD: causal in, diagnostic out |
| [`6-monty.pl`](6-monty.pl) | choosing an action under uncertainty |
| [`7-jail.pl`](7-jail.pl) | evidence that changes nothing |

## Running them

Paste one into [cplint.eu](https://cplint.eu), then ask a goal from the foot of
it: the program goes in the left-hand pane and the goal in the box at the
bottom right.
