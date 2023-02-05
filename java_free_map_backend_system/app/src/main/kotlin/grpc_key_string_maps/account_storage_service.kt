
package grpc_key_string_maps

class account_storage_service_key_string_maps {
    companion object {
            class CreateUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    val __property_list__: List<String> = listOf("email")
                }
            }

            class CreateUserResponse {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
                    val __property_list__: List<String> = listOf("result", "error")
                }
            }

            class DeleteUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    val __property_list__: List<String> = listOf("email")
                }
            }

            class DeleteUserResponse {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
                    val __property_list__: List<String> = listOf("result", "error")
                }
            }

            class UpdateUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    var username: String = "username"
                    var head_image: String = "head_image"
                    var sex: String = "sex"
                    var age: String = "age"
                    val __property_list__: List<String> = listOf("email", "username", "head_image", "sex", "age")
                }
            }

            class UpdateUserResponse {
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

            class UserModel {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    var username: String = "username"
                    var head_image: String = "head_image"
                    var sex: String = "sex"
                    var age: String = "age"
                    val __property_list__: List<String> = listOf("email", "username", "head_image", "sex", "age")
                }
            }
    }
}