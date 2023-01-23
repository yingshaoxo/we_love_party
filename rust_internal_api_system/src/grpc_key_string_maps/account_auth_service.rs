pub struct HelloRequest {
}
                    
impl HelloRequest {
    pub const name: &str = "name";
}
                    


pub struct HelloReply {
}
                    
impl HelloReply {
    pub const message: &str = "message";
}
                    


pub struct RegisterRequest {
}
                    
impl RegisterRequest {
    pub const email: &str = "email";
}
                    


pub struct RegisterReply {
}
                    
impl RegisterReply {
    pub const result: &str = "result";
    pub const error: &str = "error";
}
                    


pub struct RegisterConfirmRequest {
}
                    
impl RegisterConfirmRequest {
    pub const email: &str = "email";
    pub const random_string: &str = "random_string";
}
                    


pub struct RegisterConfirmReply {
}
                    
impl RegisterConfirmReply {
    pub const jwt: &str = "jwt";
    pub const error: &str = "error";
}
                    


pub struct IsJwtOkRequest {
}
                    
impl IsJwtOkRequest {
    pub const jwt: &str = "jwt";
}
                    


pub struct IsJwtOkReply {
}
                    
impl IsJwtOkReply {
    pub const email: &str = "email";
    pub const error: &str = "error";
}