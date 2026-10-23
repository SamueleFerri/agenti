plugins {
    // Apply the java plugin to add support for Java
    java
}

val platformName = property("platformName").toString()
val platformHost = property("platformHost").toString()
val containerBaseName = property("containerBaseName").toString()

repositories {
    mavenCentral()
    // maven("https://jade.tilab.com/maven/") // Stale certificates
}

dependencies {
    // implementation("com.tilab.jade:jade:4.6.0")
    implementation(fileTree("libs").also { it.include("**/*.jar") })
    testImplementation("junit:junit:4.13")
}

java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
}

tasks.register<JavaExec>("startPlatform") {
    mainClass.set("jade.Boot")
    group = "run"
    sourceSets.main {
        classpath = runtimeClasspath
    }
    args("-gui", "-name", platformName, "-container-name", containerBaseName + "main", "-local-host", platformHost)
}

tasks.register<JavaExec>("startContainer") {
    mainClass.set("jade.Boot")
    group = "run"
    sourceSets.main {
        classpath = runtimeClasspath
    }
    args("-container", "-container-name", containerBaseName + System.currentTimeMillis(), "-host", platformHost)
    if (project.hasProperty("agents")) {
        val agents = project.property("agents").toString()
        if (agents.isNotBlank()) {
            args("-agents", agents)
        }
    }
}
