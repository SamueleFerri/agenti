status(lost).

!go_around.

+!go_around : status(lost) <-
    move(random);
    !go_around.
-!go_around : status(lost) <-
    !go_around.
-!go_around : not(status(lost)) <- true.

+follow_me[source(A)] : status(lost) <-
    .print("Coming, ", A, "!");
    -+status(following(A));
    !follow(A).

+!follow(A) : status(following(A)) & neighbour(A) <-
    .wait({ -neighbour(A) }, 500, _);
    !follow(A).
+!follow(A) : status(following(A)) <-
    move(towards(A));
    !follow(A).
+!follow(_) <- true.
-!follow(A) <-
    !follow(A).

+home[source(A)] : status(following(A)) <-
    .print("Home! Thank you, ", A, "!");
    -+status(safe).
