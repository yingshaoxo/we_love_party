package kotlin_free_map_backend_system;

import io.grpc.ServerBuilder
import kotlin_free_map_backend_system.KotlinApp

class KotlinApp {
    public fun getGreeting(): String {
        return "yingshaoxo: hello, Kotlin, welcome to this world.";
    }

    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            var value = KotlinApp().getGreeting()
            println(value)

            val port = 40055

            val helloService = FreeMapService()
            val server = ServerBuilder
                .forPort(port)
                .addService(helloService)
                .build()

            Runtime.getRuntime().addShutdownHook(Thread {
                server.shutdown()
                server.awaitTermination()
            })

            println("free map service is running on: 127.0.0.1:${port}")
            server.start()
            server.awaitTermination()
        }
    }
}