package kotlin_free_map_backend_system;

import kotlin_free_map_backend_system.KotlinApp

class KotlinApp {
    public fun getGreeting(): String {
        return "Kotlin: Hello world.";
    }

    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            var value = KotlinApp().getGreeting()
            println(value)
        }
    }
}