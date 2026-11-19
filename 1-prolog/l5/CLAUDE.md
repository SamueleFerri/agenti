# CLAUDE.md – 1-prolog/l5

Guidance for Claude Code working in this class directory. The repository-wide rules are
in the root `CLAUDE.md` and are not repeated here; `HANDOFF.md` beside this file is the
turn record. `README.md` stays barebone: the files, and how to run them. Everything I
learn about them belongs here instead.

## The class

Fifteen files, from `iag2627-slides/tex/l5-metaprogramming.tex` (`\decklabel{L5}`), one per
Prolog listing, numbered in the order the deck shows them. Past ten files, so the prefix is
two digits, `01-` to `15-`. The longest link, `1-prolog/l5/13-builtins-control.pl`, is 34
characters against `\labcode`'s 37. **Both ends move together** once the deck links them.

**This class is Viroli's and Andrea's**, as `l2` and `l3` are: the deck is ported from
Viroli's PPS 2025/2026 *12A – Metaprogramming in Prolog*. The headers credit both, Viroli
first.

**`01-univ.pl` and `02-surface-syntax.pl` are goal-only**: the frame asks two goals of
built-ins. `01-` is the frame's *e.g.* for `=..`, made the class's first exercise at
Andrea's word on 2026-10-15, every other file moving up one.

**`14-` and `15-` repeat `search/2` from `12-vanilla.pl`**, marked in the source: their
frames call it without listing it. Same move as `03-relationality.pl` in `l3`.

**`10-` and `11-` repeat `rule/2` and `solve/1`**: the deck showed the listing twice, the
second time with `search/2` added as `rule/2` facts. Since 2026-10-16 the deck's second frame
shows only the addition (`% rule/2 facts and solve/1 as before, plus`), at Andrea's word; `11-`
keeps the whole program, so it still runs on its own. One file per frame, as in `l3`.

**`07-`'s goals were written here, not ported**: Andrea asked for them on 2026-10-15, the frame
having none, and then had them added to the deck too. One generating, `neighbour(X,Y,5,5)` (four answers, two per
clause's `;`), and a check pair, `(5,6)` *yes* and the diagonal `(6,6)` *no*. Run in SWI and SWISH.

**`08-if-then-else.pl` was written here too**, 2026-10-15, at Andrea's request, for the new
*Other Control Predicates* frame: `max/3` and a nested `sign/2`, every later file moving up one.
Run in SWI and SWISH.

## What was not extracted

- The *Solving Goals*, *findall*, *Changing Programs* and *Metainterpretation* prose, and
  the `op/3`, `assert`/`retract` descriptions: no program. Their one example of a rule,
  `assert((p(X):-q(X)))`, is doubly parenthesised since 2026-10-01: the single form runs in
  SWI and 2P-Kt but is a syntax error in GNU Prolog and Scryer, `:-` (1200) binding looser
  than an argument (999) allows. Measured in all four; the double form runs in all four.
- `H :- G1, G2, ..., Gk, (G;G'), G1',...,Gk'` on the `;` frame: notation, not a program.

## Environment

**Browser only**, 2P-Kt web IDE or SWISH. Every goal was run on 2026-10-01 in all three:
local SWI-Prolog 10.0.2, SWISH, and the 2P-Kt web IDE 2.0.10-dev06-4691231d8 (through the
Chrome extension, driven from JavaScript: Ace editor in 2P-Kt, CodeMirror in SWISH).

## Browsers, 2026-10-01

| file | 2P-Kt | SWISH |
|---|---|---|
| `04-` | goal did not parse with the list `op/3`—#989; fixed, below | as the deck |
| `05-` | as the deck | *Sandbox restriction*; since 2026-10-15 the file is SWISH-only, below |
| `09-` | as the deck, `cached(X)` *no*, asserts persist | existence error, fixed by the directive since 2026-10-16; asserts lost between queries |
| `13-` | `sum` *no*, both `not` goals *yes*—#990 | as the deck, since the change below |

Everything else answers as the deck in both.

**`13-` was changed for SWISH**, deck and file, at Andrea's word, 2026-10-01. The deck had
`builtins(['is', '=','\\=','=='])` and a clause `functor(G, F, _), builtins(B),
member(F,B), !, call(G)`; SWISH's sandbox refuses `call(G)` whenever `G` is not known
statically, so every goal stopped with *Sandbox restriction!*. Now one clause per built-in,
`solveB(X is E) :- !, X is E.` and the same for `=`, `\=`, `==`, keeping *possibly more*;
the slide's notes read *rules 3–6 deal with built-ins, each called as such* and *rules 7, 8*
for the control predicates. Run in SWI and SWISH: `S = 60`, true, false.

**`05-` carries two `map/3` clauses, one commented out**, deck and file, at Andrea's word,
2026-10-01 (his idea: lines to comment and uncomment per tool). No single clause runs in
all three: the deck's `G =.. [P,H,H2], once(G)` is refused by SWISH's sandbox, which cannot
see what `G` calls; `once(call(P,H,H2))` passes the sandbox but **2P-Kt has no `call/N` for
N ≥ 2**—`call(inc, 1, X)`, even `call(succ, 1, X)`, answers *no*, since unknown predicates
fail silently there (#992). So the deck's clause stays active, marked *2P-Kt, SWI-Prolog*,
and the SWISH one follows commented. Measured: the file as is in SWI and 2P-Kt, `L = [11,21,31]`;
in SWISH as is, *Sandbox restriction!*; swapped, `L = [11,21,31]`.
**Since 2026-10-15 `05-` is written for SWISH only**, deck and file, at Andrea's word: the
`once(call(P,H,H2))` clause alone, the `=..` one gone. Tested in SWISH itself through its
Pengines API (`POST /pengine/create`, `application: swish`, no browser): `L = [11,21,31]`, and
the old `=..` goal, as a control, still *Sandbox restriction!*. Local SWI agrees. 2P-Kt now
answers *no* (#992), and the README says so.

**2P-Kt still fails `13-`, and no Prolog-level workaround was found** (#990). Tried and
measured, each still answering *no* to `sum`: a fresh head from `functor/3` before
`clause/2`, then unify; `copy_term/2` of the goal before `clause/2`; `clause/2` inside
`findall/3`, then `member/2`. The body-only `N2` of a new copy is conflated with a live `N2`
of an earlier copy even when the goal given to `clause/2` shares no variable with it. Added
to #990 as a comment. Re-run `13-` in the web IDE when #990 closes.

**The three 2P-Kt issues**, filed at Andrea's request on 2026-10-01, minimal repros in each:

- [#989](https://github.com/tuProlog/2p-kt/issues/989): `op/3` with a list builds the theory
  but never reaches the operator table—queries fail to parse, `current_op/3` sees
  nothing. One `op/3` per operator works. **At Andrea's word the deck and `04-dsl.pl` now
  declare the five operators one directive each**, 2026-10-01; the goal answers as the deck
  in SWI, SWISH and 2P-Kt, all three run on the edited file. Its comment lost *(IDE 3.3)*,
  deck and file, at his word.
- [#990](https://github.com/tuProlog/2p-kt/issues/990): `clause/2` does not rename a body-only
  variable when the goal carries a variable from an earlier copy of the same clause; the
  second level of `sum` gets `sum([], V), V is V + 20`. `search/2` has no body-only
  variables, which is why `12-`, `14-`, `15-` are unaffected.
- [#991](https://github.com/tuProlog/2p-kt/issues/991): the editor's linter ignores `op/3`, so
  `03-`, `04-` show error markers although they load.

**2P-Kt traps when driving it.** *Solve 10* on `factorial(3,N)` recurses without end and
freezes the page past the 5 s timeout; use *Solve*. After an answer the buttons become
*Next…* until *Stop*. SWISH's sandbox refuses `dynamic/1` as a goal: the directive in the
program is the only way.

## What will come up

- **Deck misprints are copied, not fixed**—the root rule. The one found, the `;` frame's
  missing periods, was fixed in the deck and in `07-` at Andrea's word on 2026-10-01;
  `neighbour(X,Y,5,5)` gives `5/6, 5/4, 6/5, 4/5`. See `HANDOFF.md`.
- **`09-factorial-cache.pl` declares `:- dynamic cached/1.`** since 2026-10-16, deck and file, at
  Andrea's word, after SWISH answered *procedure `cached(A)` does not exist* to him: SWI and SWISH
  raise an existence error on a predicate with no clauses where tuProlog fails. Measured with the
  directive: SWI answers all eight goals as the deck says; SWISH answers `cached(X)` *no* and the
  rest as the deck. **SWISH drops asserts after each query**, so since 2026-10-16 every goal on
  the deck and in the file stands alone, doing its own `withcache` calls; all six run on SWISH
  as written, one answer each.
  **2P-Kt does not parse `:- dynamic cached/1.`**: `dynamic` is not a prefix operator there,
  though `DirectiveSelector.kt` handles `dynamic(Name/Arity)`. The functional form
  `:- dynamic(cached/1).` works in 2P-Kt (Andrea, web IDE, 2026-10-16), SWI and SWISH. **Not
  adopted, his call**: the course stays on SWISH this year, so deck and file keep the
  operator form.
- **`factorial(3,N)` then `;`** did not terminate until 2026-10-16: the second clause had no
  `X > 0` guard and recursed into the negatives. Guarded since, deck and file, at Andrea's word.
- **`10 ~ 10` loops forever** in `03-`: neither `>` holds, so the second clause swaps
  back and forth, and last-call optimisation means it never overflows. Not a goal the
  deck asks.
- **`11-full-resolution.pl` keeps every `rule/2` clause together** since 2026-10-16, at
  Andrea's word: the `search` facts follow `rule(c, [c])`, where the deck (which shows only them)
  had them after `solve/1`. That removed SWI's *not together* warning, which also kept SWISH's
  Pengines API from answering a script directly. Same answers in SWI and SWISH.
- **`rule/2` is an SWI built-in** (not ISO; `rule(:Head, -Rule)`, for `=>` rules), so SWISH
  highlights it in `10-` and `11-`. The program's definition overrides it in `user`, with no error
  and the deck's answers. Offered a README line or renaming; he chose the line, 2026-10-16.
- **`solve([c])` has infinitely many answers**, as the deck says (`yes; yes; yes; ...`).

## Measured, SWI-Prolog 10.0.2

Every goal at the foot of every file was run. All answers match the deck, apart from
the SWI behaviour of `09-` above. Worth knowing:

- `02-`: SWI prints `A = (0,1,2+3), L = [',',0,(1,2+3)]`—the deck's answer, in operator
  form.
- `03-` and `04-`: `op/3` works in SWI as the deck says. A `person{` without the space
  would be a SWI dict; the deck has the space.
- `10-`: `solve([a])` once, `solve([d])` twice, `solve([e])` fails.
- `15-`: exactly the two answers the deck shows, then no.
