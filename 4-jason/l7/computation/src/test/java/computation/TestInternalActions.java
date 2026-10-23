package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** internalActions.mas2j: an internal action in a plan context. */
public class TestInternalActions {

    @Test(timeout = 60_000)
    public void saysItsName() throws Exception {
        try (MasRun mas = MasRun.start("internalActions.mas2j")) {
            assertTrue(mas.await("[agent6] hello, I'm agent6", 10_000));
        }
    }
}
