package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** multiGoals.mas2j: two goals pursued at once, interleaved. */
public class TestMultiGoals {

    @Test(timeout = 60_000)
    public void interleavesUpAndDown() throws Exception {
        try (MasRun mas = MasRun.start("multiGoals.mas2j")) {
            assertTrue(mas.await("[agent9] up 2", 10_000));
            assertTrue(mas.await("[agent9] down 98", 5_000));
            assertTrue(mas.indexOf("[agent9] down 99") < mas.indexOf("[agent9] up 2"));
        }
    }
}
