
package grpc_key_string_maps

class free_map_service_key_string_maps {
    companion object {
            class SearchPlacesRequest {
                companion object {
                    @JvmField 
                    var key_words: String = "key_words"
                    var y_latitude: String = "y_latitude"
                    var x_longitude: String = "x_longitude"
                    var radius_distance: String = "radius_distance"
                }
            }

            class LocationOfFreeMap {
                companion object {
                    @JvmField 
                    var location_id: String = "location_id"
                    var uploader_username: String = "uploader_username"
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

            class SearchPlacesResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var location_of_free_map: String = "location_of_free_map"
                }
            }

            class AddPlaceRequest {
                companion object {
                    @JvmField 
                    var location_of_free_map: String = "location_of_free_map"
                }
            }

            class AddPlaceResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var success: String = "success"
                }
            }

            class DeleteRequest {
                companion object {
                    @JvmField 
                    var location_id: String = "location_id"
                }
            }

            class DeleteResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var success: String = "success"
                }
            }
    }
}