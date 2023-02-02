
package grpc_key_string_maps

class helloworld_key_string_maps {
    companion object {
            class VoiceRequest {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                    var timestamp: String = "timestamp"
                    var voice: String = "voice"
                }
            }

            class VoiceReply {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                    var timestamp: String = "timestamp"
                    var voice: String = "voice"
                }
            }

            class CurrentUsersUUIDReply {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                }
            }

            class StartSpeakingRequest {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                }
            }

            class StopSpeakingRequest {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                }
            }

            class HelloRequest {
                companion object {
                    @JvmField 
                    var name: String = "name"
                }
            }

            class HelloReply {
                companion object {
                    @JvmField 
                    var message: String = "message"
                }
            }
    }
}