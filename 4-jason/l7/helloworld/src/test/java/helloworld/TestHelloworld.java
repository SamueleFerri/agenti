package helloworld;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** helloworld.mas2j: one agent, one goal, one plan. */
public class TestHelloworld {

    @Test(timeout = 60_000)
    public void printsHelloWorld() throws Exception {
        try (MasRun mas = MasRun.start("helloworld.mas2j")) {
            assertTrue(mas.await("[agent1] hello world", 10_000));
        }
    }
}
