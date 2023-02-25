package kotlin_free_map_backend_system

class Configs {
    companion object {
        @JvmField
        var redis_network_name: String = "dragonfly"
        var postgres_sql_host: String = "127.0.0.1"
        var postgres_sql_port: String = "5432"
        var postgres_sql_user: String = "yingshaoxo"
        var postgres_sql_password: String = "yingshaoxo"

        @JvmStatic
        fun init() {
            var temp_variable: String?

            temp_variable = System.getenv("redis_network_name")
            if (temp_variable != null) {
                redis_network_name = temp_variable
            }

            temp_variable = System.getenv("postgres_sql_host")
            if (temp_variable != null) {
                postgres_sql_host = temp_variable
            }

            temp_variable = System.getenv("postgres_sql_user")
            if (temp_variable != null) {
                postgres_sql_user = temp_variable
            }

            temp_variable = System.getenv("postgres_sql_password")
            if (temp_variable != null) {
                postgres_sql_password = temp_variable
            }
        }
    }
}