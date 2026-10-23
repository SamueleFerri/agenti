package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** guards.mas2j: plans chosen by their context. */
public class TestGuards {

    @Test(timeout = 60_000)
    public void tellsEvenFromOdd() throws Exception {
        try (MasRun mas = MasRun.start("guards.mas2j")) {
            assertTrue(mas.await("[agent5] hello world 10 even", 10_000));
            assertTrue(mas.indexOf("[agent5] hello world 7 odd") >= 0);
        }
    }
}
