
package grpc_key_string_maps

class room_control_service_key_string_maps {
    companion object {
            class CreateRoomRequest {
                companion object {
                    @JvmField 
                    var roomName: String = "roomName"
                    val __property_list__: List<String> = listOf("roomName")
                }
            }

            class CreateRoomResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var success: String = "success"
                    val __property_list__: List<String> = listOf("error", "success")
                }
            }

            class AllowJoinRequest {
                companion object {
                    @JvmField 
                    var roomName: String = "roomName"
                    var identity: String = "identity"
                    val __property_list__: List<String> = listOf("roomName", "identity")
                }
            }

            class AllowJoinResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var accessToken: String = "accessToken"
                    val __property_list__: List<String> = listOf("error", "accessToken")
                }
            }

            class RoomInfo {
                companion object {
                    @JvmField 
                    var roomName: String = "roomName"
                    var numberOfParticipants: String = "numberOfParticipants"
                    val __property_list__: List<String> = listOf("roomName", "numberOfParticipants")
                }
            }

            class ListRoomsResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var rooms: String = "rooms"
                    val __property_list__: List<String> = listOf("error", "rooms")
                }
            }

            class DeleteRoomRequest {
                companion object {
                    @JvmField 
                    var roomName: String = "roomName"
                    val __property_list__: List<String> = listOf("roomName")
                }
            }

            class DeleteRoomResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var success: String = "success"
                    val __property_list__: List<String> = listOf("error", "success")
                }
            }
    }
}