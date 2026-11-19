# CLAUDE.md — 6-problp/l9

Guidance for this class. The student-facing part is `README.md`; the answers are
in `EXERCISES.md`. This file holds what neither of those says.

## What this class is

L9 — *Reasoning Under Uncertainty in Prolog*. The last lab of the course, and
the one that puts a number on a belief. Seven programs, all of them LPADs, run
in `cplint` at [cplint.eu](https://cplint.eu).

`6-problp` is the sixth part, added 2026-11-02 as `5-plp` and renamed the same day, when L8 became `5-strips` (Andrea). It is
its own part rather than a class inside `1-prolog` for the reason `2-clp` is:
`cplint` is its own toolchain, not a library the other classes could also
load.

## Provenance

**Every program here is transcribed from Riguzzi, *Foundations of Probabilistic
Logic Programming*, 2nd edition, River Publishers, 2023** — the example number
is named in each file's header, and each is published on `cplint.eu` under the
URL the header gives. They are not original: that is deliberate. The students
meet the canonical examples of the field, and the book is the reference they
are sent to.

**The expected values in the headers and in `EXERCISES.md` were computed
independently**, by exhaustive enumeration of the worlds in exact rational
arithmetic, and they agree with the book wherever the book states one
(0.94, 0.44, 0.588, 0.51 for the coin, 1/3 and 2/3 for Monty). The ones the
book does not state — 0.305 and 0.250492 and 0.120482 for the alarm network,
0.624 for the path, 0.6552 for the three-fault eruption, 0.357 for the
earthquake — were derived the same way and exist nowhere else. **If a value
here and a `prob/2` answer disagree, the enumeration is the thing to check
first, not the program.**

**All seven were run at `cplint.eu` on 2026-11-02**, through its Pengines API
(`POST https://cplint.eu/pengine/create` with `src_text` and `ask`, application
`swish`): all twenty goals at their files' feet, plus the three-fault eruption
(0.6552) and Monty at 0.9/0.1 (keep 1/3, switch 2/3). Every answer equals the
value stated, up to float rounding. `3-eruption.pl` makes cplint.eu print
*Singleton variables: [X]* before answering—harmless, and the book's own form;
`_X` instead makes the Pengines JSON reply fail with a 500, so it was not tried
further.

## The traps

- **`call/1` is a built-in and cannot be redefined.** The book's alarm network
  (example 28) names its last node `call`, which is the one thing in it that
  will not load: SWI-Prolog refuses to modify a static procedure. `5-alarm.pl`
  therefore calls it **`phone_call`**. Keep the rename if the file is ever
  re-synchronised against the book.
- **`prob/3` takes a single atom as evidence, not a conjunction.** This is why
  `5-alarm.pl` defines `heard_and_quake` as an ordinary clause inside the LPAD:
  a conjunction of observations needs a name before it can be conditioned on.
  Students will try `prob(burg(t), (phone_call(t), earthq(t)), P)` first; let
  them, the error message is instructive.
- **`4-path.pl` is left-recursive on purpose.** `path(X,Z) :- path(X,Y),
  edge(Y,Z).` would loop in plain Prolog. It terminates here because PITA is
  tabled, and that is worth saying out loud in class — it is the same tabling
  the students did not need in L1–L5.
- **`null` is not a keyword with magic in it.** It is an ordinary atom that
  happens to occur in no body, so deriving it derives nothing. Written
  explicitly in `1-sneezing.pl` for clarity, and left implicit everywhere else,
  which is the usual style.
- **Fractions are accepted as annotations** — `prize(1) : 1/3` — and are better
  than `0.333` wherever the model is exact. The book uses them.

## What must not be changed

- **The file numbering follows the deck.** `1-` to `7-` is the order the L9
  deck's *Lab Repo* frame lists, and the deck's `\labcode` links point at these
  names. Renaming one means editing `tex/l9-problp.tex` in `iag2627-slides` in the
  same turn. Seven files, so the prefixes stay single-digit — pad them to two
  only if the class ever reaches ten.
- **The goals live at the foot of each file**, as a block comment, per the
  repository's own rule. Not in the README, which stays barebone.

## Not here, and why

- **No local route in the READMEs.** SWI-Prolog with `?- pack_install(cplint).`
  would run every file, but the Prolog labs are browser-only (`.ai/HANDOFF.md`:
  *do not reintroduce a local Prolog toolchain*): students cannot install
  anything on the lab machines, they have no permissions (Andrea, 2026-11-02).
  The route was first written into both READMEs and taken out on 2026-11-02, as
  in `2-clp/l4`.
- **Parameter learning has no local program.** `induce_par/2` needs the Bongard
  dataset, which is several hundred lines of mega-examples. It stays a pointer
  to `cplint.eu/e/bongard.pl` in `EXERCISES.md`, for the students who want it.
- **No continuous-variable example.** `cplint`'s hybrid programs — Gaussians,
  Kalman filters, Dirichlet processes — are the best part of chapter 15 of the
  book and have no place in a two-hour class that starts from `P(a|b)`.
