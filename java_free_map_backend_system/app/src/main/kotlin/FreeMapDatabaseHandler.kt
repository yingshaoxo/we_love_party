package kotlin_free_map_backend_system

import generated_grpc.free_map_service_grpc.free_map_service_grpc_types.*
import grpc_key_string_maps.*
import java.math.BigDecimal
import java.sql.Connection
import java.sql.DriverManager.getConnection
import java.sql.ResultSet
import java.sql.Statement
import java.util.*
import kotlin.Exception


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


var sql_data_type_to_kotlin_data_type_function = fun(it: Any): Any {
    if (it is BigDecimal) {
        return it.toDouble()
    }
    return it
}


class FreeMapDatabaseHandler {
    constructor() {
        create_free_map_database()

        create_free_map_table()
        create_final_free_map_table()
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

    fun create_free_map_table() {
        var db_connection = get_free_map_database_connection()

        val command_statement: Statement = db_connection.createStatement()
        val create_table_command = """
CREATE TABLE IF NOT EXISTS "free_map" (
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.location_id} serial PRIMARY KEY,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.uploader_email} TEXT NOT NULL,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.name} TEXT NOT NULL,
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
        """.trimIndent()

        command_statement.execute(create_table_command)

        command_statement.close()
        db_connection.close()
    }

    fun create_final_free_map_table() {
        var db_connection = get_free_map_database_connection()

        val command_statement: Statement = db_connection.createStatement()
        val create_table_command = """
CREATE TABLE IF NOT EXISTS "final_free_map" (
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.location_id} serial PRIMARY KEY,
    ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.name} TEXT NOT NULL,
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
        """.trimIndent()

        command_statement.execute(create_table_command)

        command_statement.close()
        db_connection.close()
    }

    fun does_position_exists_in_free_map(locationOfFreeMap: LocationOfFreeMap): Boolean {
        // check to make sure uploader_username, x_longitude, y_latitude won't repeat in database

        var db_connection = get_free_map_database_connection()
        val command_statement: Statement = db_connection.createStatement()

        // check to make sure uploader_username, x_longitude, y_latitude won't repeat in database
        var get_exists_record_counting_sql_command = """
SELECT count(*) AS counting
FROM free_map.public.free_map
WHERE 
    uploader_email = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.uploaderEmail
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
            var counting:Int = (counting_result.getObject("counting") as Long).toInt()
            if (counting > 0) {
                is_unique = true
            }
        }

        command_statement.close()
        db_connection.close()

        return is_unique
    }

    fun insert_one_record_to_free_map(locationOfFreeMap: LocationOfFreeMap) {
        if (does_position_exists_in_free_map(locationOfFreeMap)) {
            return
        }

        var db_connection = get_free_map_database_connection()
        val command_statement: Statement = db_connection.createStatement()

        var column_list = listOf<String>(
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.uploader_email,
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

        var column_value_list: List<Any> = column_list.map { it ->
            locationOfFreeMap.getField(
                locationOfFreeMap.descriptorForType.findFieldByName(it)
            )
        }
        var column_value_list_text: String = column_value_list.map{ kotlin_data_type_to_sql_data_type_function(it) }.joinToString(", ")

        var sql_command = """
INSERT INTO free_map(${column_key_list_text})
VALUES(${column_value_list_text});
        """.trimIndent()
        command_statement.execute(sql_command)

        command_statement.close()
        db_connection.close()

        add_or_update_a_record_to_final_free_map(locationOfFreeMap=locationOfFreeMap)
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

        var column_value_list: List<Any> = column_list.map { it ->
            locationOfFreeMap.getField(
                locationOfFreeMap.descriptorForType.findFieldByName(it)
            )
        }
        var column_value_list_text: String = column_value_list.map{ kotlin_data_type_to_sql_data_type_function(it) }.joinToString(", ")

        var update_sql_command = """
UPDATE free_map.public.free_map 
SET 
(${column_key_list_text}) 
= 
(${column_value_list_text})
WHERE 
    uploader_email = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.uploaderEmail
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

        add_or_update_a_record_to_final_free_map(locationOfFreeMap=locationOfFreeMap)
    }

    fun delete_one_record_in_free_map(locationOfFreeMap: LocationOfFreeMap) {
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

    fun delete_a_location_in_free_map(locationOfFreeMap: LocationOfFreeMap) {
        var db_connection = get_free_map_database_connection()
        val command_statement: Statement = db_connection.createStatement()

        var delete_sql_command = """
DELETE FROM free_map.public.free_map
WHERE 
    y_latitude = ${
            kotlin_data_type_to_sql_data_type_function(
                locationOfFreeMap.yLatitude
            )
        } 
    AND x_longitude = ${
            kotlin_data_type_to_sql_data_type_function(
                locationOfFreeMap.xLongitude
            )
        }
;
        """.trimIndent()
        command_statement.execute(delete_sql_command)

        command_statement.close()
        db_connection.close()
    }

    fun does_position_exists_in_final_free_map(locationOfFreeMap: LocationOfFreeMap): Boolean {
        // check to make sure uploader_username, x_longitude, y_latitude won't repeat in database

        var db_connection = get_free_map_database_connection()
        val command_statement: Statement = db_connection.createStatement()

        // check to make sure uploader_username, x_longitude, y_latitude won't repeat in database
        var get_exists_record_counting_sql_command = """
SELECT count(*) AS counting
FROM free_map.public.final_free_map
WHERE 
    y_latitude = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.yLatitude
        )} 
    AND x_longitude = ${kotlin_data_type_to_sql_data_type_function(
            locationOfFreeMap.xLongitude
        )}
;
        """.trimIndent()
        val counting_result: ResultSet = command_statement.executeQuery(
            get_exists_record_counting_sql_command
        )
        var is_unique: Boolean = false
        while (counting_result.next()) {
            var counting:Int = (counting_result.getObject("counting") as Long).toInt()
            if (counting > 0) {
                is_unique = true
            }
        }

        command_statement.close()
        db_connection.close()

        return is_unique
    }

    fun insert_one_record_to_final_free_map(locationOfFreeMap: LocationOfFreeMap) {
        if (does_position_exists_in_final_free_map(locationOfFreeMap)) {
            return
        }

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

        var column_value_list: List<Any> = column_list.map { it ->
            locationOfFreeMap.getField(
                locationOfFreeMap.descriptorForType.findFieldByName(it)
            )
        }
        var column_value_list_text: String = column_value_list.map{ kotlin_data_type_to_sql_data_type_function(it) }.joinToString(", ")

        var sql_command = """
INSERT INTO final_free_map(${column_key_list_text})
VALUES(${column_value_list_text});
        """.trimIndent()
        command_statement.execute(sql_command)

        command_statement.close()
        db_connection.close()
    }

    fun update_one_record_to_final_free_map(locationOfFreeMap: LocationOfFreeMap) {
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

        var column_value_list: List<Any> = column_list.map { it ->
            locationOfFreeMap.getField(
                locationOfFreeMap.descriptorForType.findFieldByName(it)
            )
        }
        var column_value_list_text: String = column_value_list.map{ kotlin_data_type_to_sql_data_type_function(it) }.joinToString(", ")

        var update_sql_command = """
UPDATE free_map.public.final_free_map 
SET 
(${column_key_list_text}) 
= 
(${column_value_list_text})
WHERE 
    y_latitude = ${kotlin_data_type_to_sql_data_type_function(
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

    fun add_or_update_a_record_to_final_free_map(locationOfFreeMap: LocationOfFreeMap) {
        // it's gonna check if that position is inside of the final_free_map
        // if so, add it
        // otherwise, calculate the average value, and update the old record
        if (does_position_exists_in_final_free_map(locationOfFreeMap) == false) {
            insert_one_record_to_final_free_map(locationOfFreeMap)
            return
        } else {
            var db_connection = get_free_map_database_connection()
            val command_statement: Statement = db_connection.createStatement()

            var boolean_column_list = listOf<String>(
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
            var boolean_column_query_command_list = boolean_column_list.map { it -> "    "+ "(avg(CAST(${it.toString()} = 'True' AS int)) > 0.5) AS ${it.toString()}," }
            var boolean_part_command = boolean_column_query_command_list.joinToString(separator = "\n")
                .removeSuffix(",")
                .removeSuffix(" ")
                .removeSuffix("\n")
                .trim()

            var column_key_list = mutableListOf<String>(
                free_map_service_key_string_maps.Companion.LocationOfFreeMap.scores
            )
            column_key_list.addAll(boolean_column_list)

            var query_average_value_command = """
SELECT 
    round(avg(${free_map_service_key_string_maps.Companion.LocationOfFreeMap.scores})::numeric,1) AS ${free_map_service_key_string_maps.Companion.LocationOfFreeMap.scores},
    ${boolean_part_command}
FROM free_map.public.free_map
WHERE 
    y_latitude = ${kotlin_data_type_to_sql_data_type_function(
                locationOfFreeMap.yLatitude
            )} 
    AND x_longitude = ${kotlin_data_type_to_sql_data_type_function(
                locationOfFreeMap.xLongitude
            )}
;
            """.trimIndent()

            val result: ResultSet = command_statement.executeQuery(query_average_value_command)
            while (result.next()) {
                var temp_location_builder: LocationOfFreeMap.Builder = LocationOfFreeMap.newBuilder()
                    .setName(locationOfFreeMap.name)
                    .setYLatitude(locationOfFreeMap.yLatitude)
                    .setXLongitude(locationOfFreeMap.xLongitude);

                column_key_list.forEach {
                    var descriptor_ = locationOfFreeMap.descriptorForType.findFieldByName(it)
                    var one_value_from_database = result.getObject(it)
                    temp_location_builder.setField(
                        descriptor_,
                        sql_data_type_to_kotlin_data_type_function(one_value_from_database)
                    )
                }

                var temp_location: LocationOfFreeMap = temp_location_builder.build()

                update_one_record_to_final_free_map(locationOfFreeMap=temp_location)

                break
            }

            command_statement.close()
            db_connection.close()
        }
    }

    fun search_locations_in_final_free_map(keywords_text: String, y_latitude: Double, x_longitude: Double, page_size: Int, page_number: Int): List<LocationOfFreeMap> {
        var keywords_list = keywords_text.split("""\s+""".toRegex())
        var where_command = keywords_list.map { it -> "${free_map_service_key_string_maps.Companion.LocationOfFreeMap.name} LIKE '%${it}%'" }.joinToString(separator = " AND ")

        var db_connection = get_free_map_database_connection()
        val command_statement: Statement = db_connection.createStatement()

        var sql_search_command = """
WITH free_map_with_distance AS (
    SELECT *, point(${free_map_service_key_string_maps.Companion.LocationOfFreeMap.y_latitude},${free_map_service_key_string_maps.Companion.LocationOfFreeMap.x_longitude})<->point(${y_latitude}, ${x_longitude}) AS distance
    FROM (
        SELECT * from free_map.public.final_free_map
        WHERE ${where_command}
    ) the_final_free_map
)
SELECT * FROM free_map_with_distance
ORDER BY free_map_with_distance.distance ASC
LIMIT ${page_size} 
OFFSET ${page_number * page_size}
;
        """.trimIndent()

        var location_list: MutableList<LocationOfFreeMap> = mutableListOf()
        val result: ResultSet = command_statement.executeQuery(sql_search_command)
        while (result.next()) {
            var location_builder = LocationOfFreeMap.newBuilder()
            free_map_service_key_string_maps.Companion.LocationOfFreeMap.__property_list__.forEach { column_name ->
                try {
                    val value = result.getObject(column_name)
                    val length = location_builder.descriptorForType.fields.size
                    location_builder.setField(
                        location_builder.descriptorForType.findFieldByName(column_name),
                        sql_data_type_to_kotlin_data_type_function(value)
                    )
                } catch (e: Exception) {
                }
            }
            location_list.add(location_builder.build())
        }

        command_statement.close()
        db_connection.close()

        return location_list
    }
}