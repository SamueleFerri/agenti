package interaction;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** hideAndSeek.mas2j: three hiding agents, one seeker. */
public class TestHideAndSeek {

    @Test(timeout = 60_000)
    public void findsThemAll() throws Exception {
        try (MasRun mas = MasRun.start("hideAndSeek.mas2j")) {
            assertTrue(mas.await("[seeking_agent] I found you all!", 15_000));
        }
    }
}
