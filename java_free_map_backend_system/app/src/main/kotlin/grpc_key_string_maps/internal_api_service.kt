
package grpc_key_string_maps

class internal_api_service_key_string_maps {
    companion object {
            class CreateAUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    val __property_list__: List<String> = listOf("email")
                }
            }

            class CreateAUserResponse {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
                    val __property_list__: List<String> = listOf("result", "error")
                }
            }

            class DeleteAUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    val __property_list__: List<String> = listOf("email")
                }
            }

            class DeleteAUserResponse {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
                    val __property_list__: List<String> = listOf("result", "error")
                }
            }

            class GetUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    val __property_list__: List<String> = listOf("email")
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
                    val __property_list__: List<String> = listOf("error", "user_exists", "email", "username", "head_image", "sex", "age")
                }
            }

            class CheckIfUserExistsRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    val __property_list__: List<String> = listOf("email")
                }
            }

            class CheckIfUserExistsResponse {
                companion object {
                    @JvmField 
                    var error: String = "error"
                    var user_exists: String = "user_exists"
                    val __property_list__: List<String> = listOf("error", "user_exists")
                }
            }
    }
}