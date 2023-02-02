
package grpc_key_string_maps

class room_control_service_key_string_maps {
    companion object {
            class CreateRoomRequest {
                companion object {
                    @JvmField 
                    var roomName: String = "roomName"
                }
            }

            class CreateRoomResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var success: String = "success"
                }
            }

            class AllowJoinRequest {
                companion object {
                    @JvmField 
                    var roomName: String = "roomName"
                    var identity: String = "identity"
                }
            }

            class AllowJoinResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var accessToken: String = "accessToken"
                }
            }

            class RoomInfo {
                companion object {
                    @JvmField 
                    var roomName: String = "roomName"
                    var numberOfParticipants: String = "numberOfParticipants"
                }
            }

            class ListRoomsResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var rooms: String = "rooms"
                }
            }

            class DeleteRoomRequest {
                companion object {
                    @JvmField 
                    var roomName: String = "roomName"
                }
            }

            class DeleteRoomResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var success: String = "success"
                }
            }
    }
}