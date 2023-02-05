
package grpc_key_string_maps

class account_auth_service_key_string_maps {
    companion object {
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

            class RegisterRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    val __property_list__: List<String> = listOf("email")
                }
            }

            class RegisterReply {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
                    val __property_list__: List<String> = listOf("result", "error")
                }
            }

            class RegisterConfirmRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    var random_string: String = "random_string"
                    val __property_list__: List<String> = listOf("email", "random_string")
                }
            }

            class RegisterConfirmReply {
                companion object {
                    @JvmField 
                    var jwt: String = "jwt"
                    var error: String = "error"
                    val __property_list__: List<String> = listOf("jwt", "error")
                }
            }

            class IsJwtOkRequest {
                companion object {
                    @JvmField 
                    var jwt: String = "jwt"
                    val __property_list__: List<String> = listOf("jwt")
                }
            }

            class IsJwtOkReply {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    var error: String = "error"
                    val __property_list__: List<String> = listOf("email", "error")
                }
            }

            class IsOnlineRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    val __property_list__: List<String> = listOf("email")
                }
            }

            class IsOnlineResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var online: String = "online"
                    val __property_list__: List<String> = listOf("error", "online")
                }
            }
    }
}