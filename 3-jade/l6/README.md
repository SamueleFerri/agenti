# l6 – Simple Agents in Jade

A Gradle project: the agents and the behaviours are under `src/main/java`, the
tests that check them under `src/test/java`. Every step works, and every wrong
alternative is there too, with a test showing how it fails. The steps are in
[`EXERCISES.md`](EXERCISES.md).

| file | what it is |
|---|---|
| [`HelloAgent.java`](src/main/java/it/unibo/iag/jade/HelloAgent.java) | one-shot, cyclic and periodic behaviours |
| [`Behaviours.java`](src/main/java/it/unibo/iag/jade/Behaviours.java) | behaviours built and composed |
| [`impl/`](src/main/java/it/unibo/iag/jade/impl/) | `Send`, `Receive`, `Listen`, `Stop`, `DoWhile` |
| [`Messages.java`](src/main/java/it/unibo/iag/jade/Messages.java), [`Performative.java`](src/main/java/it/unibo/iag/jade/Performative.java) | AIDs and ACL messages |
| [`exercise/`](src/main/java/it/unibo/iag/jade/exercise/) | `Pinger`, `ReactivePinger` and `SmartPinger` |
| [`pitfalls/`](src/main/java/it/unibo/iag/jade/pitfalls/) | the wrong alternatives: `BusyReceive`, `BlockingReceive`, `CompositeDoWhile`, `CompositeLoopPinger` |
| [`test/`](src/test/java/it/unibo/iag/jade/test/) | the tests, and the agents they use, `Ponger` among them |

## Running it

In a Terminal, from this directory. Start an empty JADE platform, with its GUI:

```bash
./gradlew startPlatform
```

Then, from a second Terminal, a container joining it, with agents of your
choice:

```bash
./gradlew startContainer -Pagents=agentName:full.name.of.AgentClass
```

Without `-Pagents`, the container starts `helloAgent`, as `gradle.properties`
says, and it prints `[helloAgent]: Hello world!`.

## Testing it

```bash
./gradlew test
./gradlew test --tests '*TestPingPong'
```

All of them, or one test class at a time. Every test passes: those on a
pitfall check that it fails the way it should. The report is in
`build/reports/tests/test/index.html`.

## On Windows

PowerShell and Git Bash take these commands as they are. In the Command Prompt,
write `gradlew` for `./gradlew`, and leave out the quotes:
`gradlew test --tests *TestPingPong`.
