package fanboy;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** fanboy.mas2j: mum and pierre share one phone, through messages. */
public class TestFanboy {

    @Test(timeout = 60_000)
    public void pierreGetsThePhone() throws Exception {
        try (MasRun mas = MasRun.start("fanboy.mas2j")) {
            assertTrue(mas.await("[pierre] Finally I got the phone!", 30_000));
            assertTrue(mas.await("[mum] Got the phone", 30_000));
        }
    }
}
