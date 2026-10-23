package thermostat;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** thermostat.mas2j: an agent that regulates the temperature of its environment. */
public class TestThermostat {

    @Test(timeout = 60_000)
    public void reachesTheTarget() throws Exception {
        try (MasRun mas = MasRun.startText("""
                MAS thermostat {
                    environment: env.TemperatureEnvironment(18)
                    agents: thermostat thermostat_agent;
                    aslSourcePath: "src/main/asl";
                }
                """)) {
            assertTrue(mas.await("need to warm up", 10_000));
            assertTrue(mas.await(": it's ok.", 30_000));
        }
    }
}
