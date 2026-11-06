# L9 — exercises, with answers

Every number below was computed independently, by exhaustive enumeration of the
worlds, and agrees with Riguzzi (2023) where the book states it.

---

## 1 — Count the worlds

**`1-sneezing.pl`.** Two clauses, one grounding each, two alternatives each:
four worlds.

| world | first clause | second clause | probability | `sneezing(bob)` |
|---|---|---|---|---|
| w1 | `sneezing` | `sneezing` | 0.7 × 0.8 = 0.56 | true |
| w2 | `null` | `sneezing` | 0.3 × 0.8 = 0.24 | true |
| w3 | `sneezing` | `null` | 0.7 × 0.2 = 0.14 | true |
| w4 | `null` | `null` | 0.3 × 0.2 = 0.06 | false |

**P(`sneezing(bob)`) = 0.56 + 0.24 + 0.14 = 0.94.**

It is not 0.7 + 0.8, which exceeds 1 and double-counts w1. It is not
0.7 × 0.8 = 0.56, which is w1 alone and forgets that *either* rule suffices.
The useful form is `1 − 0.3 × 0.2`: the query fails only in the one world
where both rules failed.

`?- prob(sneezing(bob), flu(bob), P).` → **0.94**. `flu(bob)` is a certain
fact, so P(evidence) = 1 and conditioning on it divides by one. Evidence that
was already certain carries no information — the same point 7-jail.pl makes at
length.

**`2-severity.pl`.** Three alternatives per rule — `strong`, `moderate`, and
an implicit `null` of 0.2 each — so 3 × 3 = **nine worlds**.

- **P(`strong_sneezing(bob)`) = 0.44**, true in 5 of the 9 worlds
  (0.3·0.2 + 0.3·0.6 + 0.3·0.2 + 0.5·0.2 + 0.2·0.2)
- **P(`moderate_sneezing(bob)`) = 0.80**, also true in 5 of the 9

They sum to 1.24, and that is correct. In w(strong, moderate) — the first rule
chose `strong`, the second chose `moderate` — *both* atoms hold. Alternatives
are exclusive **within one grounding of one rule**; atoms derived by different
rules are not, and the two queries are not a partition of anything.

---

## 2 — Groundings, not clauses

**`3-eruption.pl`.** The first clause has two groundings — one per fault —
each an independent three-way choice; the second has one grounding with a
two-way choice. **3 × 3 × 2 = 18 worlds**, and `eruption` holds in 5 of them.

**P(`eruption`) = 0.588**, which is

```
0.6·0.6·0.7 + 0.6·0.3·0.7 + 0.6·0.1·0.7 + 0.3·0.6·0.7 + 0.1·0.6·0.7
```

and equally `0.7 · (1 − 0.4²) = 0.7 × 0.84`. It is *not* 0.6 × 0.7 = 0.42:
there are two faults, so there are two independent chances for the eruption,
and only the energy release is shared.

**P(`earthquake`) = 0.357.**

With a third fault: **54 worlds**, and P(`eruption`) rises to **0.6552**
(= 0.7 · (1 − 0.4³)). More groundings means more independent chances for the
same head atom, so the probability goes **up** — monotonically, towards 0.7,
the probability of the shared body.

---

## 3 — The disjoint-sum problem

**`4-path.pl`.** Two covering explanations for `path(a,c)`:

- κ₁ = { `edge(a,c)` } — probability 0.6
- κ₂ = { `edge(a,b)`, `edge(b,c)` } — probability 0.3 × 0.2 = 0.06

Naive sum: 0.66. **`prob/2` answers 0.624.**

The explanations are not mutually exclusive: the worlds containing *all three*
edges satisfy both, and have been counted twice. Inclusion–exclusion repairs
it — 0.6 + 0.06 − 0.6 × 0.06 = **0.624** — but with *n* explanations that is
2ⁿ − 1 terms, which is why nobody computes probabilities that way.

`bdd_dot_string/3` shows what is done instead. The diagram splits on one
variable at a time, each split producing two cases that cannot both hold. Split
on `edge(a,c)`, for instance: if it is there we are done (0.6); if it is not,
the path must go through both remaining edges (0.4 × 0.3 × 0.2 = 0.024), and
0.6 + 0.024 = **0.624** with no correction term. Any variable order gives the
same total — try reading the one the system actually picked off the drawing.
The diagram's root-to-1 paths are **disjoint by construction**, so
their probabilities simply add — that is the point of compiling the formula
rather than reasoning about the explanations directly.

---

## 4 — An agent revising a belief

**`5-alarm.pl`.** Four binary variables. The program holds
1 + 1 + 4 + 2 = **8 free numbers**; a joint distribution over the same four
variables would need 2⁴ − 1 = **15**, and the gap grows exponentially.

Forwards, the direction the rules are written in:

| query | answer |
|---|---|
| `prob(alarm(t), P)` | **0.3** |
| `prob(phone_call(t), P)` | **0.305** |

Backwards, the direction the agent needs:

| query | answer |
|---|---|
| `prob(burg(t), P)` | **0.1** — the prior |
| `prob(burg(t), phone_call(t), P)` | **0.250492** |
| `prob(burg(t), alarm(t), P)` | **0.28** |
| `prob(burg(t), heard_and_quake, P)` | **0.120482** |

The phone call multiplies the suspicion by about 2.5 — and note it stays
*below* the 0.28 that hearing the alarm itself would give, because the call is
only noisy evidence of the alarm, not the alarm.

The first alarm rule, `alarm(t) :- burg(t), earthq(t).`, carries no
annotation: that row of the table is 1.0/0.0, a deterministic consequence. A
probabilistic logic program degrades gracefully into an ordinary one wherever
the knowledge happens to be certain, and that is the property worth keeping
from this exercise.

**Explaining away** is goal 4. Hearing the phone raises P(`burg(t)`) from 0.1
to 0.2505; learning that the ground also shook drops it back to **0.1205**.
The earthquake already accounts for the alarm, so the burglary is no longer
needed to explain the call. Two causes of one effect compete for the
explanation — and nothing anywhere in the program says so. It falls out of the
semantics.

---

## 5 — Deciding under uncertainty

**`6-monty.pl`.**

| query | answer |
|---|---|
| `prob(win_keep, P)` | **1/3** |
| `prob(win_switch, P)` | **2/3** |

The agent should switch. Note what the program does *not* contain: any notion
of decision, preference or action. It models the game; the two queries compare
two courses of action, and the comparison is the agent's, outside the program.
Putting that comparison *inside* is what DTProbLog's `? ::` and `utility/2` are
for — the deck's slide on decision-theoretic PLP.

Changing Monty's free choice from 0.5/0.5 to 0.9/0.1: **P(`win_switch`) stays
2/3** and P(`win_keep`) stays 1/3. Monty's bias only matters in the branch
where the prize is behind the player's own door — the branch in which he has a
free choice — and in that branch the player loses by switching whichever door
Monty opens. The bias redistributes probability between `open_door(2)` and
`open_door(3)` without moving any of it across the keep/switch line.

The ICL reading of goal 3: `prize/1` and Monty's 0.5/0.5 are **nature's**
choices; `selected(1)` and the choice between `win_keep` and `win_switch` are
the **agent's**. Only the former carry probabilities. That separation is
exactly Poole's.

---

## Going further

**`7-jail.pl`.** P(`safe(a)`) = **1/3**, P(`tell`) = **1**,
P(`safe_after_tell`) = **1/3**, P(`safe(a)` | `tell`) = **1/3**.

The belief does not move at all. The reason is visible in the second number:
the jailer speaks in *every* world, so `tell` has probability 1, and
conditioning on a certain event divides by one. An observation can only inform
an agent if there was some world in which it would not have been made.

Against exercise 4: the alarm model's `phone_call(t)` has probability 0.305, so
there are worlds in which the phone stays silent, and hearing it rules those
out. The jailer's utterance rules out nothing. The structural question —
*what could this sensor have said instead?* — is the one to ask of any agent's
evidence, and it is cheaper to ask than to compute.

**Sampling.** Replacing `prob/2` with `mc_sample/3` at 100, 1000 and 10⁵
samples: the estimates converge on the exact answers, with a standard error of
about √(p(1−p)/N) — roughly 0.05 at N = 100 and 0.0015 at N = 10⁵. Two things
to notice. On these programs exact inference is instant and sampling is pure
loss; sampling earns its keep only where the BDD gets large. And `mc_sample/3`
cannot be aimed at a rare query — estimating P(`burg(t)` ∧ `phone_call(t)`)
by rejection wastes the samples in which the phone did not ring, which is why
conditional sampling needs `mc_rejection_sample/6` or
`mc_mh_sample/7` rather than a filter applied afterwards.

**Parameter learning** is the closing pointer: `induce_par/2` with the Bongard
problems, <https://cplint.eu/e/bongard.pl>. The structure of the two rules is
given; the two parameters are learnt from the pictures by EMBLEM. Run it in
the browser — it needs the dataset, which is why no local copy sits in this
directory.
