package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** finiteRecursion.mas2j: recursion with a base case. */
public class TestFiniteRecursion {

    @Test(timeout = 60_000)
    public void countsFrom0To10AndStops() throws Exception {
        try (MasRun mas = MasRun.start("finiteRecursion.mas2j")) {
            assertTrue(mas.await("[agent4] hello world 10", 10_000));
            List<String> lines = mas.after(1_000);
            assertEquals(11, lines.stream().filter(l -> l.startsWith("[agent4] hello world")).count());
        }
    }
}
