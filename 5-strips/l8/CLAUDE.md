# CLAUDE.md – 5-strips/l8

Guidance for Claude Code working in this class directory. The repository-wide rules are in the
root `CLAUDE.md`, and `1-prolog`'s *browser only* holds here too; `HANDOFF.md` is the turn record.

## The class

Goes with `iag2627-slides/tex/l8-strips.tex` (`\decklabel{L8}`, *STRIPS Planning in Prolog*),
the lab class after M9 (*Planning for Intelligent Agents*). The deck copies code from here and
links each file with `\labcode`; **both ends move together**. Each file stands alone, so a
change to a shared piece (the domain, `holds_all/2`, `step/3`…) is a change to every file that
carries it—they are generated alike, so keep them alike.

**M9's domains, Andrea's choice (2026-10-18)**: its Blocks World—`put(?x, ?y)` from the table
and from a block, `puttable(?x)`, its initial state and goal—and its UPS World, which M9 shows
unsolvable for linear STRIPS and solved non-linearly as the FedEx World. The Sussman anomaly is
the one thing not in M9; the deck cites it.

## Provenance

**From Claude Science, 2026-10-17**: `lab-strips-guide.md` and `solution-strips.pl`, handed
over by Andrea (in `~/Downloads`, not copied here). **The solution did not work**, and the guide
did not match it:

- `applicable/2` was `forall(member(P, PRE), member(P, State))`: **`forall/2` binds nothing**, so
  actions came out with their variables unbound and plans read `unstack(a, a)`; no plan for the
  Sussman anomaly within 8 steps, none for its logistics swap, and `on(a, b)` did not come back in
  20 s. Kept at first as a pitfall, `03-forall-pitfall.pl`—**removed on 2026-11-02**, see the last section, written with `\+`, which is `forall/2`'s own
  definition and runs in 2P-Kt too.
- the visited-state check compared states as lists, so one state in another order was new;
- the guide's operators mixed the robot-arm and the arm-less Blocks World, its *four* logistics
  operators were three, and one query passed an unbound `Goal`.

What survives is the progression: representation, applicability, one step, a planner, loops, a
depth bound, the Sussman anomaly, a second domain.

## Choices made here

- **`different/2` in a precondition list** is checked, not looked up: STRIPS has no inequality,
  and without it `put(a, a)` applies. It goes last in the list, after the atoms that bind.
- **Static facts in the UPS state**, `plane/1` and `location/1`: forward search must ground `fly`'s
  destination, and without types `load` puts the plane inside an object.
- **States compared as sets by `same_state/2`**, not `sort/2`; **`depth/1`** for iterative deepening,
  not `between/3`: built-ins kept to `member/2`, `append/3`, `\+`, `is`, `!` and the comparisons `\==`, `\=`, `<`, `=<`.
- `delete_all/3`, not `subtract/3`: SWI's library has one.

## Verified – 2026-10-18

Every goal at every file's foot: **SWI-Prolog 10.0.2** locally, **SWISH** through its Pengines API
(`/pengine/create`, the sandbox included), **2P-Kt 3.0.1**'s REPL—answers equal. The web IDE is
2.0.10-dev and was not driven (no Chrome); **the 2P-Kt REPLs, 3.0.1 and 2.0.9, fail `length/2`,
`sort/2`, `forall/2` on an empty theory**; whether the web IDE has them was not checked—so the
code avoids them, and the REPL proves the code, not the IDE's library. Andrea's eye in the web IDE is still worth having.

- the naive planner on `[on(c, b), on(b, a)]` never ends (stack overflow in SWI): by design;
- depth-first with the visited check, `[on(c, a)]`: five steps; shortest first: two,
  `[puttable(b), put(c, a)]`;
- Sussman: `[puttable(c), put(b, c), put(a, b)]`; UPS: `load, load, fly, unload, unload`.

## STRIPS's own algorithm – 2026-11-02

`10-strips-goal-stack.pl` and `11-strips-ups.pl`, at Andrea's word: L8's planners search the states
forward, while M9 teaches STRIPS's goal stack—linear, backwards from the goal—and its failures. The
idea comes from AS 2020/21's L4 (`as2021-lab/1-tuprolog/l4`, `Strips.pl`), rewritten in this
class's `operator/4` shape, with its `holds_all/2` and `apply/4` unchanged; no Gradle, no tuProlog.

- `achieve/5`: an unmet goal, an operator whose ADD holds it, its PRE achieved first, then all the
  goals again; `unmet/3` skips `different/2`. `depth/1` counts up to `max_depth(8)` with `from/3`:
  a generator that recursed into itself (`depth(D) :- depth(D0), D0 < M, …`) never ended once the
  bound was reached—the UPS *no* hung on it.
- Sussman: `[put(c, b), puttable(c), put(a, b), puttable(a), put(b, c), put(a, b)]`, valid by `step/3`;
  with `puttable` listed before `put`, the textbook's five, `[puttable(c), put(a, b), puttable(a),
  put(b, c), put(a, b)]` (the deck's question). The goals in the other order give the same plans.
- UPS: *no*, at `max_depth` 8, 12 and 16, in milliseconds.
- Verified in **SWI-Prolog 10.0.2** and the **2P-Kt 3.0.5** REPL (`~/Documents/Claude/tools/2p-kt/`),
  answers equal. SWISH through Pengines on 2026-11-02, after the renumbering: the same three answers.

## Planning as deduction, and the mapping rechecked – 2026-11-02

M9's deductive-planning frames moved into L8 (*Planning as Deduction*, second section), at Andrea's word, and
their Prolog example became **`00-deductive.pl`**—`00`, not a renumbering, so the published PDF's `\labcode`
links and the folder students know stay valid. Two changes from M9's slide, so the file runs clean: the
meta-axiom is code (`poss(do(A,S)) :- poss(S), pact(A,S)`), clauses are grouped by predicate with `_` for
unused variables (no *not together* or *singleton* warnings). Its goal gives `do(move(a,d,b), do(move(b,e,g),
s0))` in SWI and 2P-Kt 3.0.5.

Then the deck and the folder were checked against each other in both directions (every slide code line in its
`\labcode` file, every slide goal among the file's goals, every file linked, listed in *Lab Repo* and in the
README): the goals the files carried and no slide asked—`02-`'s two single-action goals, `03-`'s goal behind the
pitfall, `05-`'s `[ontable(a)]`—are now on their slides; `05-`'s `% P / []` reads `% P = []`.

## The pitfall removed, the files renumbered, STRIPS on the slide – 2026-11-02

At Andrea's word, after his review: the `forall/2` pitfall was out of the course's scope (nothing in the class
leads to `forall/2`), so its slide and `03-forall-pitfall.pl` are gone, and the files are renumbered with **no
gaps**, his choice over keeping the published numbers: `04-apply` → `03-apply`, … `11-strips-ups` → `10-strips-ups`
(`git mv`, so history follows). The sections above keep the names files had when they were written; today's are
the ones in `README.md`. And the deck now shows M9's STRIPS operator schemes (*The Blocks World in STRIPS*) right
before their Prolog version, since students saw them days before: that slide is STRIPS notation, not lab code,
and has no file.


## The 2P-Kt web IDE – 2026-11-02

Driven at last, in WebKit headless through Playwright (no Chrome): the web IDE 3.0.6-dev01, each file typed into
its editor (read back identical), every goal asked with *Solve 10*. `00-` to `09-` answer as in SWI-Prolog;
**`10-` gives *timeout* at the IDE's default 5 s instead of *no*** (SWI: *no* in 0.03 s). A longer timeout was not
tried. The README says so, in one line.
