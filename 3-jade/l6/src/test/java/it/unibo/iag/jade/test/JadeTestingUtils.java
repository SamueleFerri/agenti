package it.unibo.iag.jade.test;

import jade.core.Agent;
import jade.core.Profile;
import jade.core.ProfileImpl;
import jade.core.Runtime;
import jade.wrapper.AgentController;
import jade.wrapper.ControllerException;
import jade.wrapper.PlatformController;

import java.io.IOException;
import java.net.ServerSocket;
import java.util.logging.Logger;

public class JadeTestingUtils {

    private static final Logger L = Logger.getLogger(TestBasicBehaviours.class.getName());
    private static PlatformController platform;

    private JadeTestingUtils() {
        throw new IllegalStateException(
                String.format(
                        "Class %s cannot be instantiated: it can only contain static methods",
                        JadeTestingUtils.class
                )
        );
    }

    public static synchronized void startNewPlatform() {
        if (platform == null) {
            L.info("Starting platform");
            // a port of its own: 1099 may be taken by a platform started with startPlatform
            var profile = new ProfileImpl();
            profile.setParameter(Profile.LOCAL_PORT, String.valueOf(freePort()));
            platform = Runtime.instance().createMainContainer(profile);
            if (platform == null) {
                throw new IllegalStateException("Could not start a Jade platform");
            }
            L.info("Started platform");
        } else {
            throw new IllegalStateException("A Jade platform is already running");
        }
    }

    private static int freePort() {
        try (var socket = new ServerSocket(0)) {
            return socket.getLocalPort();
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    public static synchronized void stopPlatform() {
        if (platform != null) {
            L.info("Shutting down platform");
            Runtime.instance().shutDown();
            TestingAgent.forgetInstances();
            L.info("Shut down platform");
            platform = null;
        } else {
            throw new IllegalStateException("A Jade platform must be running");
        }
    }

    public static synchronized <A extends TestingAgent> A spawnTestAgent(String localName, Class<A> klass, Object... args) {
        try {
            var controller = spawnAgent(localName, klass, args);
            controller.start();
            return (A) TestingAgent.getInstanceByName(controller.getName());
        } catch (ControllerException | InterruptedException e) {
            throw new Error(e);
        }
    }

    public static synchronized <A extends Agent> AgentController spawnAgent(String localName, Class<A> klass, Object... args) {
        if (platform != null) {
            try {
                var controller = platform.createNewAgent(localName, klass.getName(), args);
                controller.start();
                return controller;
            } catch (ControllerException e) {
                throw new Error(e);
            }
        } else {
            throw new IllegalStateException("A Jade platform must be running");
        }
    }
}
