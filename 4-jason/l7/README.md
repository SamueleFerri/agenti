# l7 – Programming Intentional Agents in AgentSpeak(L) and Jason

A Gradle project with one module per topic. Each module holds one or more MAS,
each described by a `.mas2j` file; the agents are under `src/main/asl`, the
Java parts (environments, internal actions) under `src/main/java`, the tests
under `src/test/java`. Every MAS works, and a test runs each of them. The
exercises are in [`EXERCISES.md`](EXERCISES.md).

| module | MAS | what it shows |
|---|---|---|
| [`helloworld`](helloworld/) | `helloworld` | one agent, one goal, one plan |
| [`computation`](computation/) | `recursion`, `finiteRecursion` | a goal that adopts itself again |
| | `whileIteration`, `forEachIteration` | loops in a plan body |
| | `guards`, `conditions` | plans chosen by context; if-then-else |
| | `internalActions` | an internal action, `.my_name` |
| | `failure` | an action that fails, and no plan for it |
| | `multiGoals`, `multiIntentions` | goals pursued at once; `!!` |
| | `bingo` | test goals, a failure plan that retries |
| | `dummyFibonacci`, `fibonacci` | a rule; test goals that remember |
| [`interaction`](interaction/) | `asyncPingPong`, `syncPingPong` | `tell`, reacting to it or waiting for it |
| | `clientService` | `askOne`, answered by a test-goal plan |
| | `hideAndSeek` | `.broadcast` |
| [`fanboy`](fanboy/) | `fanboy` | two agents share one phone |
| [`domotic`](domotic/) | `domotic` | a robot brings its owner a beer; an environment with a GUI |
| [`contractnet`](contractnet/) | `contractnet` | the contract-net protocol |
| [`thermostat`](thermostat/) | `thermostat` | an agent regulating its environment |
| [`robots`](robots/) | `robots` | a rescuer robot leads a lost one home |

`fanboy`, `domotic` and `contractnet` come from the Jason book's examples.

## Running it

In a Terminal, from this directory. Each `X.mas2j` runs with the task
`runXMas`, `X` capitalised:

```bash
./gradlew runHelloworldMas
./gradlew runSyncPingPongMas
```

The agents print in Jason's MAS Console, a window of its own; `domotic` and
`robots` open their environment's window too. Close the console to stop the MAS.

```bash
./gradlew tasks --group run
```

lists them all.

## Testing it

```bash
./gradlew test
./gradlew :robots:test
./gradlew :computation:test --tests '*TestFailure'
```

All of them, one module, or one test class. Each test runs a MAS without its
windows and checks what its agents print. The reports are in each module's
`build/reports/tests/test/index.html`.

## On Windows

PowerShell and Git Bash take these commands as they are. In the Command Prompt,
write `gradlew` for `./gradlew`, and leave out the quotes:
`gradlew :computation:test --tests *TestFailure`.
