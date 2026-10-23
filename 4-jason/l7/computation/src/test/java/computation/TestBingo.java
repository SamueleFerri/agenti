package computation;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** bingo.mas2j: test goals, and a failure plan that retries. */
public class TestBingo {

    @Test(timeout = 60_000)
    public void drawsDistinctNumbers() throws Exception {
        try (MasRun mas = MasRun.start("bingo.mas2j")) {
            List<String> lines = mas.after(6_000);
            List<Integer> drawn = lines.stream().filter(l -> l.startsWith("[agent11] "))
                    .map(l -> Integer.parseInt(l.substring(10).trim())).toList();
            assertTrue(drawn.size() >= 3);
            assertEquals(drawn.size(), drawn.stream().distinct().count());
            assertTrue(drawn.stream().allMatch(n -> n >= 1 && n <= 90));
        }
    }
}
