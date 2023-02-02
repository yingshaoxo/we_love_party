
package grpc_key_string_maps

class internal_api_service_key_string_maps {
    companion object {
            class CreateAUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                }
            }

            class CreateAUserResponse {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
                }
            }

            class DeleteAUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                }
            }

            class DeleteAUserResponse {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
                }
            }

            class GetUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                }
            }

            class GetUserResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var user_exists: String = "user_exists"
                    var email: String = "email"
                    var username: String = "username"
                    var head_image: String = "head_image"
                    var sex: String = "sex"
                    var age: String = "age"
                }
            }

            class CheckIfUserExistsRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                }
            }

            class CheckIfUserExistsResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var user_exists: String = "user_exists"
                }
            }
    }
}