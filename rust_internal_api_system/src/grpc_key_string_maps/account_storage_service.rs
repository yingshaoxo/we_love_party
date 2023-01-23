pub struct CreateUserRequest {
}
                    
impl CreateUserRequest {
    pub const email: &str = "email";
}
                    


pub struct CreateUserResponse {
}
                    
impl CreateUserResponse {
    pub const result: &str = "result";
    pub const error: &str = "error";
}
                    


pub struct DeleteUserRequest {
}
                    
impl DeleteUserRequest {
    pub const email: &str = "email";
}
                    


pub struct DeleteUserResponse {
}
                    
impl DeleteUserResponse {
    pub const result: &str = "result";
    pub const error: &str = "error";
}
                    


pub struct UpdateUserRequest {
}
                    
impl UpdateUserRequest {
    pub const email: &str = "email";
    pub const username: &str = "username";
    pub const head_image: &str = "head_image";
    pub const sex: &str = "sex";
    pub const age: &str = "age";
}
                    


pub struct UpdateUserResponse {
}
                    
impl UpdateUserResponse {
    pub const result: &str = "result";
    pub const error: &str = "error";
}
                    


pub struct IsUserProfileCompleteRequest {
}
                    
impl IsUserProfileCompleteRequest {
    pub const email: &str = "email";
}
                    


pub struct IsUserProfileCompleteResponse {
}
                    
impl IsUserProfileCompleteResponse {
    pub const complete: &str = "complete";
    pub const error: &str = "error";
}
                    


pub struct GetUserRequest {
}
                    
impl GetUserRequest {
    pub const email: &str = "email";
}
                    


pub struct GetUserResponse {
}
                    
impl GetUserResponse {
    pub const error: &str = "error";
    pub const user_exists: &str = "user_exists";
    pub const email: &str = "email";
    pub const username: &str = "username";
    pub const head_image: &str = "head_image";
    pub const sex: &str = "sex";
    pub const age: &str = "age";
}
                    


pub struct UserModel {
}
                    
impl UserModel {
    pub const email: &str = "email";
    pub const username: &str = "username";
    pub const head_image: &str = "head_image";
    pub const sex: &str = "sex";
    pub const age: &str = "age";
}