# CLAUDE.md – 4-jason/l7

Guidance for Claude Code working in this class directory. The repository-wide rules are
in the root `CLAUDE.md` and are not repeated here; `HANDOFF.md` beside this file is the
turn record. `README.md` stays barebone: the files, and how to run them. `EXERCISES.md`
holds the exercises, each with where it is worked out and its test.

## The class

Goes with `iag2627-slides/tex/l7-jason.tex` (`\decklabel{L7}`, *Programming Intentional
Agents in AgentSpeak(L) and Jason*), the lab class straight after M8 (*Reasoning Agents*).
Its *Hands On* section (*Fast Lab* until 2026-10-18) walks through this code and links each file with `\labfilebar`, as
L6 does: **renaming or moving a file breaks a link on the deck**, and a change to a file
shown there is a change to a frame. **And `show-lab` steps through it** for Andrea in class:
`/show-lab iag2627 L7 [<step>] [test]` opens a step's files in VS Code and runs its MAS live (or its tests); the
16 steps are `JASON_STEPS` in `~/.claude/skills/show-lab/show-lab.py`—**a renamed file or MAS, or a new step on
the deck, is a line to change there too**.

**Worked code, as in `3-jade/l6`**—Andrea's rule, *incomplete code IS NOT my style*. Every
MAS runs, and a test runs each of them; a red test means something broke.

**A Gradle project, kept whole**, like `3-jade/l6`: one subproject per topic, as the source
had it, plus `testkit`. Two root rules do not apply, for the reasons `3-jade/l6/CLAUDE.md`
gives: no order prefix (a `.mas2j`'s run task is named after it, and the deck names them),
no `\labcode` per file (the paths are too long; `\labfilebar` takes a label).

## Provenance

**Giovanni Ciatto's `lab-2`**, ISE 2023/2024,
<https://dvcs.apice.unibo.it/pika-lab/courses/ise/ay2324/lab-2>, `master` at `66d437e`
(2024-04-08). Nothing newer exists: checked on 2026-10-17, there is no ISE 2024/25 group and
ISE 2025/26 holds `lab-jade` only; MAS's `l3-jason` (2024-03-26) and ISE 2022/23's `lab-5` are
older forms of the same code. **His commit `4f64738`, *exercify*, emptied eight files into
`TODO`s; they were put back from its parent**—the solutions he had written. Then:

- **Jason 3.3.3** (2026-10-15, the latest), not the source's 3.2.0 from Maven Central: 3.3.x
  is published only in the JaCaMo team's repository,
  `https://raw.githubusercontent.com/jacamo-lang/mvn-repo/master`, declared for the group
  `io.github.jason-lang` alone. **3.3 needs Java 21**, so this part asks for a JDK 21 or
  later where `3-jade` asks 17. The release zip on GitHub carries only a CLI fat jar (Gradle,
  JADE, JLine inside), unusable as a library—hence the repository, not a jar in `libs/`.
- **Gradle 9.8.1**, the wrapper copied from `3-jade/l6`; `build.gradle.kts` rewritten:
  `capitalized()` (gone in Gradle 9) → `replaceFirstChar`, `RunCentralisedMAS` →
  `RunLocalMAS` (Jason 3's name), no toolchain download (the JDK running Gradle compiles for
  21). Dropped: the Gradle Enterprise build-scan plugin (it published scans), the unused
  version catalogue (Kotlin, 2P-Kt), `.github/`, `.gitlab-ci.yml`, `renovate.json`, the
  class `.gitignore` (the root's covers it), four empty module `build.gradle.kts`, and
  `contractnet/gradle.properties`, whose one setting nothing read.
- **`computation.mas2j` and `interaction.mas2j` removed**: menus with every agent commented
  out, which Jason 3 refuses to parse; each example has a `.mas2j` of its own.
- **`testkit` added**, with `MasRun`: runs a MAS in a JVM of its own, headless, logging to the
  console instead of the MAS Console, and lets a test wait for a printed line. One test class
  per MAS or pair, 23 tests.

## Bugs found and fixed, 2026-10-17

All in the source, none of them a teaching point; each would have shown in class.

- **Missing `;`** before `.print("Done")` in both Fibonacci agents, and in `mum.asl` and
  `rescuer_agent.asl`: Jason 3.3 refuses the file.
- **`utils.rand_int(X, Min, Max)` never drew `Max`** (`nextInt(max - min) + min`): `bingo` drew
  89 numbers and then looped for ever on the 90th. Now both bounds are included, in both
  copies (`computation`, `robots`).
- **`thermostat.mas2j` was named `MAS robots`**, copied from the other one.
- **The `robots` environment**: `moveBackward` was built from `FORWARD`;
  `getAgentByPosition` compared positions with `==`, so no robot ever perceived another
  (`robot(Dir)`) and two could share a cell; `utils.Facing.rotate` ignored the current
  facing, so the rescuer's belief `position(X, Y)` drifted; `Orientation.left45` turned +3 for
  −1 (unused, fixed anyway).
- **The `robots` solution was unfinished**, not only emptied: the rescuer told `go_home`, the
  lost robot listened for `follow_me`, and nothing made it follow; `opposite(X, Y) :-
  opposite(Y, X)` looped on backtracking (stack overflow).

## The `robots` solution, written here

Andrea's to review: the exercise had none that worked. **The environment gained one
action, `move(towards(Agent))`**—a step towards another robot along the axis where it is
farther—and an optional fourth argument, actions per second (default 1, as before; the
test uses 20). The lost robot follows with it once told `follow_me`; the rescuer leads it
home step by step, waiting for it whenever it falls behind, and tells it `home` there. What
it took, each found by running:

- **Jason's failure semantics, twice.** A failure plan that is *relevant* but not
  *applicable*—`-!go(D) : free(D)` when `D` is blocked—drops the intention instead of
  passing the failure up; and a `.fail` *inside* a failure plan generates no further event.
  So a blocked step is now avoided before it is tried (`free(...)` in the contexts), and
  `+!go(_) <- true` / `-!go(_) <- true` absorb the race where the other robot steps in
  between the check and the move.
- **A lost wake-up**: `.wait({+neighbour(A)})` waits for ever if `A` came back just before;
  now with a timeout, and the loop checks again.
- **A livelock**: with the arena's edge on one side and the follower on the other, the
  rescuer turned back and forth 370 times; now, when the straight way home is blocked, it
  takes a random free direction (`!go_anywhere`).

Measured: 24 runs out of 24 brought the lost robot home, at 20 actions a second.

## Environment

**A Terminal and a JDK, 21 or later.** On 17 the build stops at *invalid source release:
21*. `domotic` and `robots` open a window, and Jason opens its MAS Console; under
`-Djava.awt.headless=true`, which the tests pass, both environments skip their window
(`GraphicsEnvironment.isHeadless()`), a change made here.

## Verified – 2026-10-17

JDK 27 here, four runs, all 23 tests green, 11–16 s. Fresh copies in `eclipse-temurin:21-jdk`
and `25-jdk` under Docker, Gradle downloaded: 23/23 each, about a minute; `17-jdk` fails as
above. **Not tried**: the MAS Console and the two environment windows on screen—Andrea's to
see in class; Windows (reasoned, as for `3-jade/l6`).

## Left for Andrea

- **`EXERCISES.md` is reconstructed**: the source set its exercises as `TODO`s in the
  files, with no statement. The wording is mine, from what each emptied file held.
- **The `robots` solution** above is new code, and so is `move(towards(Agent))`.
- **`syncPingPong` waits with `.wait({+ball[source(S)]})`**, which would miss a ball that
  arrived before the wait began—the same lost wake-up as above. It has not happened in any
  run; it is the example's own code, so left as it is.
- **`failing_agent.asl` keeps its failure plan commented out**, so the intention is dropped
  with *No failure event was generated*—which the test checks. The commented plan prints
  *I'm done with this shit.*, a line not to show students as it stands.
- **Package names**: the Java is in `env` and `utils`, the source's; `group` is still
  `it.unibo.ise`.
