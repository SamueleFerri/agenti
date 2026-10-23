package domotic;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** domotic.mas2j: the robot brings the owner a beer. */
public class TestDomotic {

    @Test(timeout = 60_000)
    public void ownerSipsABeer() throws Exception {
        try (MasRun mas = MasRun.start("domotic.mas2j")) {
            assertTrue(mas.await("[robot] doing: hand_in(beer)", 20_000));
            assertTrue(mas.await("[owner] doing: sip(beer)", 10_000));
        }
    }
}
