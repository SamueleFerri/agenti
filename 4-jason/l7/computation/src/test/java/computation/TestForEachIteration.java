package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** forEachIteration.mas2j: a for loop over the solutions of a rule. */
public class TestForEachIteration {

    @Test(timeout = 60_000)
    public void enumeratesTheNaturals() throws Exception {
        try (MasRun mas = MasRun.start("forEachIteration.mas2j")) {
            assertTrue(mas.await("[agent3] value s(s(s(z)))", 10_000));
        }
    }
}
