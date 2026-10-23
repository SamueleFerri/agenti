# CLAUDE.md – 3-jade/l6

Guidance for Claude Code working in this class directory. The repository-wide rules are
in the root `CLAUDE.md` and are not repeated here; `HANDOFF.md` beside this file is the
turn record. `README.md` stays barebone: the files, and how to run them. `EXERCISES.md`
holds the exercises as set, each with where it is worked out, its test, its alternatives.

## The class

Goes with `iag2627-slides/tex/l6-jade.tex` (`\decklabel{L6}`, *Simple Agents in Jade*).
Its *Hands On* section (*Fast Lab* until 2026-10-18) links `\labdir{3-jade/l6/}` and copies code from here verbatim.
**Both ends move together.** Since 2026-10-17 its four subsections walk through this code
step by step—behaviours, waiting for a message, ping pong, smart ping pong—each
pitfall with its test's result; a change to a class shown there is a change to a frame.
Each block showing code links its file with `\labfilebar{<path>}{<label>}`—a label, not the
address, which no line could hold—so **renaming or moving a file breaks a link on the deck**.
**And `show-lab` steps through it**, for Andrea in class (point 6 of his list, 2026-10-17):
`/show-lab iag2627 L6 [<step>]` opens a step's files in VS Code and runs its tests in Terminal,
printing what the agents logged. The 14 steps are `JADE_STEPS` in
`~/.claude/skills/show-lab/show-lab.py`, in the deck's order: **a renamed file or test, or a step
added to the deck, is a line to change there too.** Since 2026-10-20 a step also opens its test class, after the
slide's files—the script derives it from the step's tests—and step 2 the `TestLoggingAgent` that
`testLogging` runs (Andrea: the evidence belongs on screen).

**Worked code, not a skeleton—Andrea, 2026-10-17**: *incomplete code IS NOT my style*. He
wants each step working, why it works discussed, and alternatives that work and that do
not. So every `not implemented` was filled in, and each wrong alternative is a class of its
own in `pitfalls/` with a test that **passes by showing the failure**—a hang, a spin, an
order of logs. The suite is green, and a red test means something broke.

**Not a set of loose files, unlike every other class.** A Gradle project, kept whole: the
code, the tests and the build only work together. That is the root rule *a part that
needs a build brings its own*.

**Two root rules do not apply, and why.**

- **No order prefix.** A Java file must be named after its public class, and the
  directories are its package.
- **No `\labcode` links per file.** `3-jade/l6/` costs 10 characters of the 37-character
  budget, but `src/main/java/it/unibo/iag/jade/` alone costs 32. A deck links the
  directory with `\labdir`, or a file through a shorter text.

## Provenance

**The skeleton, the tests and the build are Giovanni Ciatto's**, from
<https://dvcs.apice.unibo.it/pika-lab/courses/ise/ay2526/lab-jade>, `master` at `982b278`
(2026-03-01), the ISE 2025/2026 lab. **The code that fills it, `ReactivePinger`,
`pitfalls/` and the tests on them were written here**, 2026-10-17. Changes to his files:

- its `.gitlab-ci.yml` left out, and **replaced by the root one's `3-jade-l6` job**,
  2026-10-17 at Andrea's word, once every test was green (he had declined CI on the
  skeleton, whose tests failed by design): `./gradlew --no-daemon test` in
  `eclipse-temurin:21-jdk`, on changes to `3-jade/l6/**` only;
- its `.gitignore` merged into the root one (Gradle, and the `APDescription.txt`,
  `MTPs-*.txt` JADE writes on start; its blanket `*.txt` was not taken);
- its `README.md` split into `README.md` and `EXERCISES.md`;
- `DoWhile` extends `SerialBehaviour`, and is abstract on `condition()`; `Receive` lost the
  empty `handleRestartEvent` and gained a `reset()` that forgets the message;
- `TestSmartPingPong` lost its `@Ignore`;
- **the test harness forgets its agents when a platform stops**
  (`TestingAgent.forgetInstances()`, from `JadeTestingUtils.stopPlatform()`). Its static
  name → agent map outlived the platform, so a second test class naming an agent `ponger`
  could read the *previous* class's `ponger`: `TestReactivePingPong` passed in 0.02 s on
  `TestPingPong`'s logs, and `TestPingPong` failed on `TestCompositeLoopPinger`'s. The
  source never met it: one test class only used a fixed name.

**The package is `it.unibo.iag.jade` since 2026-10-20**, at Andrea's word: it was his `it.unibo.ds.jade`, *ds* for
the distributed-systems course the exercises were written for. Moved with `git mv` (both `src/main` and `src/test`),
with `gradle.properties`, the READMEs, L6's links and `show-lab.py`. `exercise/` is a misnomer too; renaming it is
Andrea's call. **His test class
`TestBasicBehaivours` is `TestBasicBehaviours` since 2026-10-20**, at Andrea's word: file, class,
`JadeTestingUtils`'s logger, `EXERCISES.md`, L6 and `show-lab.py` together. His log string
*Shutted down platform* became *Shut down platform* the same day.

**JADE comes as a jar in `libs/`**, LGPL, not from a repository: JADE is not on Maven
Central. **4.6.0 (2022-12-07), the latest**, since 2026-10-16, replacing the source's 4.5.0;
taken from `jade.tilab.com/maven`, SHA-1 matching its `.sha1`. That repository's certificate
now validates, though `build.gradle.kts` still calls it stale—a dependency from there could
replace the jar.

## Environment

**A Terminal and a JDK.** Gradle 9 runs on JDK 17 or later; the code is compiled for
Java 11. **Gradle 9.8.1, the latest**, since 2026-10-16: the wrapper regenerated with
`gradle wrapper --gradle-version 9.8.1` (the source had 9.3.1), and in `build.gradle.kts`
`tasks.create` became `tasks.register` and `by project` became `property(…)`—the two
deprecations 9.8.1 warned of. It builds with no warnings.

`startPlatform` passes `-gui`, so it opens JADE's Swing window; a headless run cannot use it.

## The pitfalls, and what each test measures

- **`BusyReceive`, no `block()`**: it receives the message, but `action()` ran 4 700 303
  times in the 500 ms it waited, against **2** for `Receive` (one on the empty mailbox,
  one on the message). The test asserts `> 1000` and `== 2`. JADE's Programmer's Guide,
  §3.4: *in order to avoid an active wait for messages… every single Behaviour is allowed
  to block its computation*.
- **`BlockingReceive`, `blockingReceive()` in a behaviour**: beside a counter in `all(…)`,
  the logs read `received, 0, 1, 2`, where `Receive` gives `0, 1, 2, received`. The agent
  is one thread, so blocking it blocks every behaviour; `block()` blocks one.
- **`CompositeDoWhile`, the source's own `DoWhile` parent**: `CompositeBehaviour` does not
  pass a restart event down to its child, so the `Receive` inside never wakes up; the loop
  `Pinger` gets one pong and hangs. `SerialBehaviour.handle` does the propagation, as for
  `SequentialBehaviour`; `ParallelBehaviour` overrides `handle` itself. Read from JADE's
  bytecode with `javap`; still so in 4.6.0. Reverting `DoWhile` makes `TestPingPong` fail,
  so the suite catches it now—the source's tests did not. Worth telling Giovanni.
- **`Pinger` under random names**: it pings `ponger`, which does not exist; the ponger logs
  nothing in 3 s.

`SmartPinger` pings every agent the AMS lists, itself excepted—the AMS and the DF included;
only an `INFORM` is taken as a pong. The
other way, matching names that start with `ponger`, would work and rest on a convention;
not written.

## What else will come up

- **`settings.gradle.kts` turns TLS verification off** for `HttpsURLConnection` in the
  Gradle JVM—a trust-all manager and hostname verifier, left from when JADE came from
  `jade.tilab.com`. Nothing uses it now that the jar is local. Kept as copied; flagged.
- **The tests run in about 17 s**, 16 of them in 7 classes, each class starting and stopping
  its own platform, on a free port of its own. A pitfall test waits out `TestingAgent`'s 3 s.

## Can students run it? – 2026-10-17

Point 5 of Andrea's list. **JDKs**, each on a fresh clone in its `eclipse-temurin` image, Gradle
downloaded on the first run: 17, 21 and 25 pass all 16 tests, in 40–60 s; **11 fails clearly**, *Gradle
requires JVM 17 or later to run. Your build is currently configured to use JVM 11*—which is what the
part's README asks, *a JDK, 17 or later*. **A zip download** of the repository keeps `gradlew`
executable. **Windows** is untested—nothing here runs it: `gradlew.bat` checks out with CRLF, as
`.gitattributes` asks; the README's *On Windows* is reasoned from the shells—PowerShell and Git Bash
take `./gradlew` as written, the Command Prompt wants `gradlew` and passes `'…'` quotes on literally, so
`--tests '*TestPingPong'` would match nothing there. **With the platform open** (`startPlatform` holding
port 1099) every test failed, *A Jade platform must be running*: the tests' main container could not bind
1099 and `createMainContainer` returned `null`, unchecked. Now `JadeTestingUtils.startNewPlatform` gives it
a free port (`Profile.LOCAL_PORT`, from a `ServerSocket(0)`) and fails loudly on `null`; both cases pass, and
the *Cannot bind … 1099* warnings between test classes are gone with it.

## Verified – 2026-10-17

JADE 4.6.0, Gradle 9.8.1, JDK 27: all 16 tests pass, three runs in a row, each test's output
read to confirm it ran the agent it names. `startPlatform`, then `startContainer`, prints
`[helloAgent]: Hello world!` (2026-10-16; `HelloAgent` unchanged since).
