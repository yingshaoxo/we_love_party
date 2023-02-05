
package grpc_key_string_maps

class data_model_key_string_maps {
    companion object {
            class User {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    var username: String = "username"
                    var head_image: String = "head_image"
                    var sex: String = "sex"
                    var age: String = "age"
                    val __property_list__: List<String> = listOf("email", "username", "head_image", "sex", "age")
                }
            }

            class LocationOfFreeMap {
                companion object {
                    @JvmField 
                    var location_id: String = "location_id"
                    var uploader_email: String = "uploader_email"
                    var name: String = "name"
                    var y_latitude: String = "y_latitude"
                    var x_longitude: String = "x_longitude"
                    var scores: String = "scores"
                    var open_all_day: String = "open_all_day"
                    var has_charger: String = "has_charger"
                    var has_wifi: String = "has_wifi"
                    var has_water: String = "has_water"
                    var has_hot_water: String = "has_hot_water"
                    var has_desk: String = "has_desk"
                    var has_chair: String = "has_chair"
                    var has_toilet: String = "has_toilet"
                    var has_showering: String = "has_showering"
                    var has_package_receiving_station: String = "has_package_receiving_station"
                    var has_kfc: String = "has_kfc"
                    var has_mcdonald: String = "has_mcdonald"
                    var has_store: String = "has_store"
                    var open_and_close_time: String = "open_and_close_time"
                    val __property_list__: List<String> = listOf("location_id", "uploader_email", "name", "y_latitude", "x_longitude", "scores", "open_all_day", "has_charger", "has_wifi", "has_water", "has_hot_water", "has_desk", "has_chair", "has_toilet", "has_showering", "has_package_receiving_station", "has_kfc", "has_mcdonald", "has_store", "open_and_close_time")
                }
            }
    }
}