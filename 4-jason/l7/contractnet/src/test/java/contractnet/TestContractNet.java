package contractnet;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** contractnet.mas2j: a contract-net protocol, one refusing and one silent participant. */
public class TestContractNet {

    @Test(timeout = 60_000)
    public void awardsTheContract() throws Exception {
        try (MasRun mas = MasRun.start("contractnet.mas2j")) {
            assertTrue(mas.await("[client] Winner is ", 15_000));
            assertTrue(mas.await("won CNP 1 for fix(computer)!", 5_000));
            assertEquals(2, mas.after(1_000).stream().filter(l -> l.endsWith("I lost CNP 1.")).count());
        }
    }
}
