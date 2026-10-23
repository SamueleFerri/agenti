package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** failure.mas2j: an action that fails, and no plan to handle the failure. */
public class TestFailure {

    @Test(timeout = 60_000)
    public void dropsTheIntention() throws Exception {
        try (MasRun mas = MasRun.start("failure.mas2j")) {
            assertTrue(mas.await("[agent8] Cross! I lost :C", 30_000));
            assertTrue(mas.await("No failure event was generated for +!gamble", 5_000));
        }
    }
}
