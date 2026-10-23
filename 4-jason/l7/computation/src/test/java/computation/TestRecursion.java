package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** recursion.mas2j: a goal that adopts itself again, for ever. */
public class TestRecursion {

    @Test(timeout = 60_000)
    public void countsOnWithoutEnd() throws Exception {
        try (MasRun mas = MasRun.start("recursion.mas2j")) {
            assertTrue(mas.await("[agent1] hello world 3", 10_000));
        }
    }
}
