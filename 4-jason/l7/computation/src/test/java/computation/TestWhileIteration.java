package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** whileIteration.mas2j: a while loop over a belief. */
public class TestWhileIteration {

    @Test(timeout = 60_000)
    public void countsOn() throws Exception {
        try (MasRun mas = MasRun.start("whileIteration.mas2j")) {
            assertTrue(mas.await("[agent2] value 3", 10_000));
        }
    }
}
