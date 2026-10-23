package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** dummyFibonacci.mas2j, a rule; fibonacci.mas2j, test goals that remember. */
public class TestFibonacci {

    @Test(timeout = 60_000)
    public void dummyIsRightButSlow() throws Exception {
        try (MasRun mas = MasRun.start("dummyFibonacci.mas2j")) {
            assertTrue(mas.await("[agent12] fib(20) = 10946", 20_000));
            assertFalse(mas.await("[agent12] fib(100)", 3_000));
        }
    }

    @Test(timeout = 60_000)
    public void smartReaches100() throws Exception {
        try (MasRun mas = MasRun.start("fibonacci.mas2j")) {
            assertTrue(mas.await("[agent13] fib(20) = 10946", 10_000));
            assertTrue(mas.await("[agent13] Done", 20_000));
        }
    }
}
