# HANDOFF.md – 3-jade/l6

The turn record for this class. Repository-wide state is in `.ai/HANDOFF.md` at the root.

Last updated: 2026-10-16, by Claude. Written, built, tested, committed and pushed.

## 3-jade/l6 – added 2026-10-16

At Andrea's word: Giovanni Ciatto's `lab-jade` (ISE 2025/2026, `982b278`) becomes the
foundation of `3-jade/l6`, the course's third part and its sixth lab class. The Gradle
project copied whole; what was left out, merged or split is under *Provenance* in
`CLAUDE.md`. The exercises went into `EXERCISES.md`, verbatim, and the README was rewritten
barebone.

Tested on the skeleton and on scratch solutions, as `CLAUDE.md` records under *Verified*.
On the way, the `DoWhile` trap: `repeatWhile` around a blocking receive never wakes up.
The tests do not catch it.

## Updated – 2026-10-16

At Andrea's word: JADE 4.5.0 → 4.6.0 and Gradle 9.3.1 → 9.8.1, both the latest, with the
build's two deprecations fixed. Retested: skeleton 8 fail and 1 skipped, solutions 9/9, the
platform runs. Details in `CLAUDE.md`.

## `DoWhile` fixed – 2026-10-17

At Andrea's word, after asking what the exercise is for: the fix takes nothing from what
students write. `DoWhile` now extends `SerialBehaviour`. Skeleton still 8 fail, 1 skipped;
the loop-based `Pinger` now passes, 9/9 three runs in a row. Why, in `CLAUDE.md`.

## Worked lab – 2026-10-17

At Andrea's word—*incomplete code IS NOT my style*—every step now works, and the wrong
alternatives are classes of their own, each with a test showing its failure: `BusyReceive`,
`BlockingReceive`, `CompositeDoWhile` (+ `CompositeLoopPinger`), and `Pinger` under random
names. `ReactivePinger` is the second working Pinger. A harness bug found on the way—stale
agents across test classes—is fixed. 16 tests, all green; details in `CLAUDE.md`.
He reviewed the code: *looks ok*. Then **CI, at his word**: the root `.gitlab-ci.yml`, one
job, `3-jade-l6`; the root `CLAUDE.md` records the exception. Run first in its own image under Docker
Desktop, three times green; the first pipeline, on `783d274`, green on the DISI GitLab. **Next: the L6 deck**, which
still describes the skeleton.

## Reviewed – 2026-10-17

Point 4 of his list: the code read for bugs, the deck checked against it. One fix here: `Messages.globalAID`
built `new AID(name, false)`, a local name; now `AID.ISGUID`. Unused, so nothing else moves; 16 tests green.
`SmartPinger`'s `AMSService.search` blocks the agent (JADE API): kept, and said on the deck.

## Point 5 – 2026-10-17

JDK 17/21/25 pass on fresh clones, 11 fails with Gradle's clear message; the README gained *On Windows*
(untested: no Windows here); the harness now starts its platform on a free port, after every test failed
with `startPlatform` open. Details in `CLAUDE.md`, *Can students run it?*.

## Point 6 – 2026-10-17

`show-lab` extended for this class: `/show-lab iag2627 L6` lists the deck's 14 steps; a step opens its
files in VS Code and runs its tests in Terminal, each *✓ passed*/*✗ FAILED*, then what the agents
logged; step 1 starts the platform and a container. Reports tried on three steps; the live windows not
yet, which is Andrea's to try.

## Left for Andrea

- **The trust-all TLS block in `settings.gradle.kts`**: dead code, kept as copied.
- **The package `it.unibo.ds.jade`**: kept as copied—until 2026-10-20, now `it.unibo.iag.jade`. (`TestBasicBehaivours` → `TestBasicBehaviours`, the same day, at his word.)

## Language pass, with L6 – 2026-10-20

At Andrea's word, with L6's own pass in the slides repo. `TestBasicBehaivours` is `TestBasicBehaviours`:
file (`git mv`), class, `JadeTestingUtils`'s logger, `EXERCISES.md`, L6 and `~/.claude/skills/show-lab/show-lab.py`
together. The log line *Shutted down platform* is *Shut down platform*. Exercise 3 asks *differences **from**
exercise 2*: inherited wording is fixed like any other. `./gradlew --no-daemon test`: 16 tests, all green.

## Package `it.unibo.iag.jade` – 2026-10-20

At Andrea's word: `it.unibo.ds.jade` (the DS course's) is `it.unibo.iag.jade`. Both source trees moved with `git mv`;
40 `package`/`import` lines, `gradle.properties`'s `helloAgent`, `README.md`, `EXERCISES.md`, L6's 24 links and
`show-lab.py` rewritten; no `ds` left. `./gradlew --no-daemon test`: 16 tests, all green; `HelloAgent` compiled at its new name.

## `show-lab` opens the test classes – 2026-10-20

At Andrea's word: a step opens its test class after the slide's files, and step 2 also `TestLoggingAgent`.
`teach/3-jade/l6/README.md` follows (its *opens* column, and six `--jade-report` lines that still named
`TestBasicBehaivours`); the skill's `SKILL.md` too. All 14 steps checked with `--dry-run`, every file present.
