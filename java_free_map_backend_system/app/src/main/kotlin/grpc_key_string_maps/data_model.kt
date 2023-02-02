
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
                }
            }

            class LocationOfFreeMap {
                companion object {
                    @JvmField 
                    var location_id: String = "location_id"
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
                }
            }
    }
}