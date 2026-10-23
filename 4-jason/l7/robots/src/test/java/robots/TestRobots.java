package robots;

import static org.junit.Assert.*;

import it.unibo.iag.jason.MasRun;
import java.util.List;
import org.junit.Test;

/** robots.mas2j: the rescuer finds the lost robot and leads it home. */
public class TestRobots {

    @Test(timeout = 60_000)
    public void bringsTheLostRobotHome() throws Exception {
        try (MasRun mas = MasRun.startText("""
                MAS robots {
                    environment: env.Arena2DEnvironment(10, 10, 0, 20)
                    agents: rescuer rescuer_agent; lost lost_agent;
                    aslSourcePath: "src/main/asl";
                }
                """)) { // 20 actions a second, not 1
            assertTrue(mas.await("[rescuer] Hello lost! Follow me!", 30_000));
            assertTrue(mas.await("[lost] Coming, rescuer!", 5_000));
            assertTrue(mas.await("[rescuer] Home, sweet home!", 50_000));
            assertTrue(mas.await("[lost] Home! Thank you, rescuer!", 5_000));
        }
    }
}
