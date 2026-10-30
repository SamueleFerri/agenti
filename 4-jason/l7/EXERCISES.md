# l7 – Exercises

Each exercise as set, then where it is worked out and the test that runs it.

1. **Guards** – write an agent that counts from 1 to 10 and says, for each
   number, whether it is even or odd, choosing between plans by their
   *context* only.
   Worked out in `computation/src/main/asl/guarded_agent.asl`, run by
   `computation:test --tests '*TestGuards'`. `conditional_agent.asl` does the
   same with an if-then-else in a single plan.
2. **Fibonacci, smartly** – `dummy_fibonacci_agent.asl` computes Fibonacci
   numbers through a rule, and slows down quickly. Write an agent that
   remembers what it has computed, through test goals and belief additions,
   and reaches `fib(100)`.
   Worked out in `computation/src/main/asl/smart_fibonacci_agent.asl`, run by
   `computation:test --tests '*TestFibonacci'`.
3. **Ping pong, asynchronous** – given `async_pinger_agent.asl`, write the
   ponger: it reacts to the ball when it arrives, and sends it back.
   Worked out in `interaction/src/main/asl/async_ponger_agent.asl`.
4. **Ping pong, synchronous** – given `sync_pinger_agent.asl`, write the
   ponger: it *waits* for the ball within a plan, and sends it back.
   Worked out in `interaction/src/main/asl/sync_ponger_agent.asl`. Both ping
   pongs are run by `interaction:test --tests '*TestPingPong'`.
5. **A calculator service** – given `client_agent.asl`, which asks the service
   `calculate(mult(sum(1, 2), 3), Result)` with `askOne`, write the service: it
   answers through a test-goal plan, reducing the expression with rules.
   Worked out in `interaction/src/main/asl/server_agent.asl`, run by
   `interaction:test --tests '*TestClientService'`.
6. **Rescue** – in a 10 × 10 arena, a robot is lost and wanders at random. The
   rescuer starts from home, `position(0, 0)`, explores, and when it meets the
   lost robot, leads it home. Complete the environment, which perceives what
   is around each robot and moves it, then the two agents.
   Worked out in `robots/src/main/java/env/Arena2DEnvironment.java`,
   `robots/src/main/asl/rescuer_agent.asl` and `lost_agent.asl`, run by
   `robots:test`.
