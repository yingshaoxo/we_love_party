pub struct CreateAUserRequest {
}
                    
impl CreateAUserRequest {
    pub const email: &str = "email";
}
                    


pub struct CreateAUserResponse {
}
                    
impl CreateAUserResponse {
    pub const result: &str = "result";
    pub const error: &str = "error";
}
                    


pub struct DeleteAUserRequest {
}
                    
impl DeleteAUserRequest {
    pub const email: &str = "email";
}
                    


pub struct DeleteAUserResponse {
}
                    
impl DeleteAUserResponse {
    pub const result: &str = "result";
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