package interaction;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** asyncPingPong.mas2j and syncPingPong.mas2j: the ball goes and comes back. */
public class TestPingPong {

    @Test(timeout = 60_000)
    public void asynchronous() throws Exception {
        try (MasRun mas = MasRun.start("asyncPingPong.mas2j")) {
            assertTrue(mas.await("[pong] Received ball from ping", 10_000));
            assertTrue(mas.await("[ping] Received ball from pong", 10_000));
        }
    }

    @Test(timeout = 60_000)
    public void synchronous() throws Exception {
        try (MasRun mas = MasRun.start("syncPingPong.mas2j")) {
            assertTrue(mas.await("[pong] Received ball from ping", 10_000));
            assertTrue(mas.await("[ping] Received ball from pong", 10_000));
        }
    }
}
