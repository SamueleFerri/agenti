package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** conditions.mas2j: the same, with if-then-else in the plan body. */
public class TestConditions {

    @Test(timeout = 60_000)
    public void tellsEvenFromOdd() throws Exception {
        try (MasRun mas = MasRun.start("conditions.mas2j")) {
            assertTrue(mas.await("[agent7] hello world 10 even", 10_000));
            assertTrue(mas.indexOf("[agent7] hello world 7 odd") >= 0);
        }
    }
}
