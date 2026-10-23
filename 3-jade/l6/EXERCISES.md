# l6 – Exercises

Each exercise as it was set, then where it is worked out, the test that checks
it, and the alternatives—right and wrong.

## Exercise 1

Provide an implementation for the methods in `it.unibo.iag.jade.Behaviours` in
such a way that all tests in `it.unibo.iag.jade.test.TestBasicBehaviours`
succeed: `atomic` and `stop` first, then `sequence`, then `any` and `all`, then
`repeatWhile` and `repeatForEver`, then `send`, then `receive`.

- worked out in `Behaviours` and `impl/*`
- checked by `TestBasicBehaviours`

Waiting for a message, three ways—checked by `TestReceiveAlternatives`:

- `impl/Receive` calls `block()` on an empty mailbox: the behaviour waits, and
  the agent's other behaviours go on
- `pitfalls/BusyReceive` does not: it works, but it runs again and again while
  it waits
- `pitfalls/BlockingReceive` calls the agent's `blockingReceive()`: it works,
  but the whole agent waits with it

## Exercise 2

Provide an implementation for the `Pinger` in such a way that all tests in
`it.unibo.iag.jade.test.TestPingPong` succeed.

- worked out in `exercise/Pinger`, a loop: send a ping, wait for the pong
- checked by `TestPingPong`

The alternatives:

- `exercise/ReactivePinger`, the way `Ponger` does it: a ping in answer to every
  pong—checked by `TestReactivePingPong`
- `pitfalls/CompositeLoopPinger`, `Pinger` with its loop a `CompositeDoWhile`:
  one round, and it hangs—checked by `TestCompositeLoopPinger`

## Exercise 3

Provide an implementation for the `SmartPinger` in such a way that all tests in
`it.unibo.iag.jade.test.TestSmartPingPong` succeed. What are the main
differences from exercise 2?

> HINT: the `SmartPinger`'s and `Ponger`'s names are randomly generated in
> `TestSmartPingPong`

- worked out in `exercise/SmartPinger`: the first ping to every agent the AMS
  knows of, then a ping in answer to every pong
- checked by `TestSmartPingPong`

The alternative:

- `exercise/Pinger` in its place pings `ponger`, which is not there: nobody
  answers—checked by `TestFixedNamePinger`
