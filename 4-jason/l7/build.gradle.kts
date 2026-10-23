plugins {
    java
}

allprojects {
    apply<JavaPlugin>()

    java {
        sourceCompatibility = JavaVersion.VERSION_21
        targetCompatibility = JavaVersion.VERSION_21
    }

    repositories {
        mavenCentral()
        // Jason 3.3.x is published here, not on Maven Central
        maven("https://raw.githubusercontent.com/jacamo-lang/mvn-repo/master") {
            content { includeGroup("io.github.jason-lang") }
        }
    }

    group = "it.unibo.ise"
}

subprojects {
    sourceSets {
        main {
            resources {
                srcDir("src/main/asl")
            }
        }
    }

    dependencies {
        implementation("io.github.jason-lang:jason-interpreter:3.3.3")
        if (project.name != "testkit") {
            testImplementation(project(":testkit"))
        }
        testImplementation("junit:junit:4.13.2")
    }

    tasks.withType<Test>().configureEach {
        testLogging { events("passed", "failed"); showStandardStreams = false }
        maxParallelForks = (Runtime.getRuntime().availableProcessors() / 2).coerceAtLeast(1)
    }

    projectDir.listFiles().filter { it.extension == "mas2j" }.forEach { mas2jFile ->
        val name = mas2jFile.nameWithoutExtension.replaceFirstChar { it.uppercase() }
        tasks.register<JavaExec>("run${name}Mas") {
            group = "run"
            classpath = sourceSets.getByName("main").runtimeClasspath
            mainClass.set("jason.infra.local.RunLocalMAS")
            args(mas2jFile.path)
            standardInput = System.`in`
        }
    }
}
