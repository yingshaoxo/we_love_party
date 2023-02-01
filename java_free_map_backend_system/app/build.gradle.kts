//import com.google.protobuf.gradle.*

plugins {
    // Apply the application plugin to add support for building a CLI application in Java.
    application
    kotlin("jvm") version "1.7.10"
//    id("com.google.protobuf") version "0.8.19"
}

repositories {
    // Use Maven Central for resolving dependencies.
    mavenCentral()
}

//protobuf {
//    protoc {
//        artifact = if (osdetector.os == "osx") {
//            "com.google.protobuf:protoc:3.20.3:osx-x86_64"
//        } else {
//            "com.google.protobuf:protoc:3.20.3"
//        }
//    }
//}

dependencies {
    // Use JUnit Jupiter for testing.
    testImplementation("org.junit.jupiter:junit-jupiter:5.7.2")

    // This dependency is used by the application.
    implementation("com.google.guava:guava:30.1.1-jre")
    implementation("io.grpc:grpc-netty:1.46.0")
    implementation("io.grpc:grpc-stub:1.46.0")
    implementation("io.grpc:grpc-kotlin-stub:1.2.0")
    implementation("io.grpc:grpc-protobuf:1.39.0")
    implementation("com.google.protobuf:protobuf-kotlin:3.20.3")
    implementation("com.google.protobuf:protobuf-java:3.20.3")
}

application {
    // Define the main class for the application.
    // mainClass.set("java_free_map_backend_system.App")
    mainClass.set("kotlin_free_map_backend_system.KotlinApp")
}

tasks.named<Test>("test") {
    // Use JUnit Platform for unit tests.
    useJUnitPlatform()
}
