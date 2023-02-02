
package grpc_key_string_maps

class account_storage_service_key_string_maps {
    companion object {
            class CreateUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                }
            }

            class CreateUserResponse {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
                }
            }

            class DeleteUserRequest {
                companion object {
                    @JvmField 
                    var email: String = "email"
                }
            }

            class DeleteUserResponse {
                companion object {
                    @JvmField 
                    var result: String = "result"
                    var error: String = "error"
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
                }
            }

            class UpdateUserResponse {
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

            class UserModel {
                companion object {
                    @JvmField 
                    var email: String = "email"
                    var username: String = "username"
                    var head_image: String = "head_image"
                    var sex: String = "sex"
                    var age: String = "age"
                }
            }
    }
}