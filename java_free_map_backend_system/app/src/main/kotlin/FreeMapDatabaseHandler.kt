package kotlin_free_map_backend_system

import generated_grpc.free_map_service_grpc.free_map_service_grpc_types.*
import grpc_key_string_maps.*
import java.lang.Exception
import java.sql.Connection
import java.sql.DriverManager.getConnection
import java.sql.Statement
import java.util.*


class FreeMapDatabaseHandler {
    lateinit var locationOfFreeMap_2:LocationOfFreeMap

    constructor() {
        create_free_map_database()

        create_free_map_averaged_data_table()
        create_free_map_all_in_one_data_table()
    }

    private fun create_free_map_database() {
        var url = "jdbc:postgresql://${Configs.postgres_sql_host}:${Configs.postgres_sql_port}/"

        val props = Properties()
        props.setProperty("user", Configs.postgres_sql_user)
        props.setProperty("password", Configs.postgres_sql_password)
        props.setProperty("ssl", "false")
        val db_connection: Connection = getConnection(url, props)

        try {
            val st: Statement = db_connection.createStatement()
            st.execute("""
            CREATE DATABASE free_map
        """.trimIndent())
            st.close()
        } catch (e: Exception) {
            println(e.toString())
        }
    }

    private fun get_free_map_database_connection(): Connection {
        var url = "jdbc:postgresql://${Configs.postgres_sql_host}:${Configs.postgres_sql_port}/free_map"

        val props = Properties()
        props.setProperty("user", Configs.postgres_sql_user)
        props.setProperty("password", Configs.postgres_sql_password)
        props.setProperty("ssl", "false")
        val db_connection: Connection = getConnection(url, props)

        return db_connection
    }

    fun create_free_map_all_in_one_data_table() {
        var db_connection = get_free_map_database_connection()

        val command_statement: Statement = db_connection.createStatement()
        val result: Boolean = command_statement.execute("""
CREATE TABLE IF NOT EXISTS "free_map" (
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.location_id} serial PRIMARY KEY,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.name} VARCHAR(255) NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.y_latitude} decimal NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.x_longitude} decimal NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.scores} decimal NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.open_all_day} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_charger} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_wifi} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_water} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_hot_water} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_desk} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_chair} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_toilet} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_showering} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_package_receiving_station} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_kfc} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_mcdonald} BOOLEAN NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_store} BOOLEAN NOT NULL
);
        """.trimIndent())
//        println(result)

        command_statement.close()
        db_connection.close()
    }

    fun create_free_map_averaged_data_table() {
        var db_connection = get_free_map_database_connection()

        val command_statement: Statement = db_connection.createStatement()
        val result: Boolean = command_statement.execute("""
CREATE TABLE IF NOT EXISTS "final_free_map" (
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.location_id} serial PRIMARY KEY,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.name} VARCHAR(255) NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.y_latitude} decimal NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.x_longitude} decimal NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.scores} decimal NOT NULL
);
        """.trimIndent())
//        println(result)

        command_statement.close()
        db_connection.close()
    }

    fun insert_one_record_to_free_map(locationOfFreeMap: LocationOfFreeMap) {
        var db_connection = get_free_map_database_connection()

        val command_statement: Statement = db_connection.createStatement()

        var column_list = listOf<String>(
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.name,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.y_latitude,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.x_longitude,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.scores,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.open_all_day,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_charger,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_wifi,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_water,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_hot_water,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_desk,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_chair,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_toilet,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_showering,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_package_receiving_station,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_kfc,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_mcdonald,
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.has_store,
        )
        var column_key_list_text: String = column_list.joinToString(separator = ", ")
//        println(locationOfFreeMap.toString())
        var column_value_list: List<Any> = listOf<Any>(
            locationOfFreeMap.name,
            locationOfFreeMap.yLatitude,
            locationOfFreeMap.xLongitude,
            locationOfFreeMap.scores,
            locationOfFreeMap.openAllDay,
            locationOfFreeMap.hasCharger,
            locationOfFreeMap.hasWifi,
            locationOfFreeMap.hasWater,
            locationOfFreeMap.hasHotWater,
            locationOfFreeMap.hasDesk,
            locationOfFreeMap.hasChair,
            locationOfFreeMap.hasToilet,
            locationOfFreeMap.hasShowering,
            locationOfFreeMap.hasPackageReceivingStation,
            locationOfFreeMap.hasKfc,
            locationOfFreeMap.hasMcdonald,
            locationOfFreeMap.hasStore,
        )
        var transfer_function = fun(it: Any): String {
            if (it is String) {
                return "'${it}'"
            }
            if (it is Double) {
                return it.toString()
            }
            if (it is Boolean) {
                return if (it==true) "TRUE" else "FALSE"
            }
            return ""
        }
        var column_value_list_text: String = column_value_list.map{ transfer_function(it) }.joinToString(", ")

        var sql_command = """
INSERT INTO free_map(${column_key_list_text})
VALUES(${column_value_list_text});
        """.trimIndent()
        val result: Boolean = command_statement.execute(sql_command)
//        println(result)

        command_statement.close()
        db_connection.close()
    }
}