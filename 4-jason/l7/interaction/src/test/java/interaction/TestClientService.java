package interaction;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** clientService.mas2j: askOne, answered by a test-goal plan. */
public class TestClientService {

    @Test(timeout = 60_000)
    public void computesTheExpression() throws Exception {
        try (MasRun mas = MasRun.start("clientService.mas2j")) {
            assertTrue(mas.await("[service] ... response: 9", 10_000));
            assertTrue(mas.await("[client] ... result: 9", 10_000));
        }
    }
}
