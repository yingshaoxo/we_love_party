
package grpc_key_string_maps

class account_auth_service_key_string_maps {
    companion object {
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

            class RegisterRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                }
            }

            class RegisterReply {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
                }
            }

            class RegisterConfirmRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    var random_string: String = "random_string"
                }
            }

            class RegisterConfirmReply {
                companion object {
                    @JvmField 
                    var jwt: String = "jwt"
                    var error: String = "error"
                }
            }

            class IsJwtOkRequest {
                companion object {
                    @JvmField 
                    var jwt: String = "jwt"
                }
            }

            class IsJwtOkReply {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    var error: String = "error"
                }
            }

            class IsOnlineRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                }
            }

            class IsOnlineResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var online: String = "online"
                }
            }
    }
}