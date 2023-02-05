
package grpc_key_string_maps

class helloworld_key_string_maps {
    companion object {
            class VoiceRequest {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                    var timestamp: String = "timestamp"
                    var voice: String = "voice"
                    val __property_list__: List<String> = listOf("uuid", "timestamp", "voice")
                }
            }

            class VoiceReply {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                    var timestamp: String = "timestamp"
                    var voice: String = "voice"
                    val __property_list__: List<String> = listOf("uuid", "timestamp", "voice")
                }
            }

            class CurrentUsersUUIDReply {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                    val __property_list__: List<String> = listOf("uuid")
                }
            }

            class StartSpeakingRequest {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                    val __property_list__: List<String> = listOf("uuid")
                }
            }

            class StopSpeakingRequest {
                companion object {
                    @JvmField 
                    var uuid: String = "uuid"
                    val __property_list__: List<String> = listOf("uuid")
                }
            }

            class HelloRequest {
                companion object {
                    @JvmField 
                    var name: String = "name"
                    val __property_list__: List<String> = listOf("name")
                }
            }

            class HelloReply {
                companion object {
                    @JvmField 
                    var message: String = "message"
                    val __property_list__: List<String> = listOf("message")
                }
            }
    }
}