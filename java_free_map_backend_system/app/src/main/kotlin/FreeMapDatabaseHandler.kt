package kotlin_free_map_backend_system

import generated_grpc.free_map_service_grpc.free_map_service_grpc_types.*
import grpc_key_string_maps.*
import java.lang.Exception
import java.sql.Connection
import java.sql.DriverManager.getConnection
import java.sql.ResultSet
import java.sql.Statement
import java.util.*


var kotlin_data_type_to_sql_data_type_function = fun(it: Any): String {
    if (it is String) {
        return "'${it}'"
    }
    if (it is Double) {
        return it.toString()
    }
    if (it is Boolean) {
        return if (it==true) "TRUE" else "FALSE"
    }
    return it.toString()
}


class FreeMapDatabaseHandler {
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
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.uploader_username} VARCHAR(255) NOT NULL,
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

        // check to make sure uploader_username, x_longitude, y_latitude won't repeat in database
        var get_exists_record_counting_sql_command = """
SELECT count(*) AS counting
FROM free_map.public.free_map
WHERE 
    uploader_username = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.uploaderUsername
    )} 
    AND y_latitude = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.yLatitude
    )} 
    AND x_longitude = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.xLongitude
    )}
;
        """.trimIndent()
        val counting_result: ResultSet = command_statement.executeQuery(get_exists_record_counting_sql_command)
        var is_unique: Boolean = false
        while (counting_result.next()) {
            // Now that `rs` points to a valid row (rs.next() is true), we can use the `getString`
            // and `getLong` methods to return each column value of the row as a string and long
            // respectively, and print it to the console
            var counting:Int = (counting_result.getObject("counting") as Long).toInt()
            if (counting > 0) {
                is_unique = true
            }
//            println(counting)
        }
        if (is_unique == true) {
            return
        }

        var column_list = listOf<String>(
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.uploader_username,
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
            locationOfFreeMap.uploaderUsername,
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
        var column_value_list_text: String = column_value_list.map{ kotlin_data_type_to_sql_data_type_function(it) }.joinToString(", ")

        var sql_command = """
INSERT INTO free_map(${column_key_list_text})
VALUES(${column_value_list_text});
        """.trimIndent()
        val result: Boolean = command_statement.execute(sql_command)
//        println(result)

        command_statement.close()
        db_connection.close()
    }

    fun update_one_record_to_free_map(locationOfFreeMap: LocationOfFreeMap) {
        var db_connection = get_free_map_database_connection()
        val command_statement: Statement = db_connection.createStatement()

        var column_list = listOf<String>(
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.name,
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

        var column_value_list: List<Any> = listOf<Any>(
            locationOfFreeMap.name,
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
        var column_value_list_text: String = column_value_list.map{ kotlin_data_type_to_sql_data_type_function(it) }.joinToString(", ")

        var update_sql_command = """
UPDATE free_map.public.free_map 
SET 
(${column_key_list_text}) 
= 
(${column_value_list_text})
WHERE 
    uploader_username = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.uploaderUsername
        )} 
    AND y_latitude = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.yLatitude
        )} 
    AND x_longitude = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.xLongitude
        )}
        """.trimIndent()

        command_statement.execute(update_sql_command)

        command_statement.close()
        db_connection.close()
    }

    fun delete_one_record_to_free_map(locationOfFreeMap: LocationOfFreeMap) {
        var db_connection = get_free_map_database_connection()
        val command_statement: Statement = db_connection.createStatement()

        var delete_sql_command = """
DELETE FROM free_map.public.free_map
WHERE 
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.location_id} = ${kotlin_data_type_to_sql_data_type_function(locationOfFreeMap.locationId)} 
        """.trimIndent()
        command_statement.execute(delete_sql_command)

        command_statement.close()
        db_connection.close()
    }
}