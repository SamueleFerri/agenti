package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** multiIntentions.mas2j: !! adopts a goal as a new intention, alongside. */
public class TestMultiIntentions {

    @Test(timeout = 60_000)
    public void startsASecondCount() throws Exception {
        try (MasRun mas = MasRun.start("multiIntentions.mas2j")) {
            assertTrue(mas.await("[agent10] count 8", 15_000));
            List<String> lines = mas.after(1_500);
            assertEquals(2, lines.stream().filter(l -> l.equals("[agent10] count 1")).count());
        }
    }
}
