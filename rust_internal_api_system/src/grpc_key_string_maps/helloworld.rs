pub struct VoiceRequest {
}
                    
impl VoiceRequest {
    pub const uuid: &str = "uuid";
    pub const timestamp: &str = "timestamp";
    pub const voice: &str = "voice";
}
                    


pub struct VoiceReply {
}
                    
impl VoiceReply {
    pub const uuid: &str = "uuid";
    pub const timestamp: &str = "timestamp";
    pub const voice: &str = "voice";
}
                    


pub struct CurrentUsersUUIDReply {
}
                    
impl CurrentUsersUUIDReply {
    pub const uuid: &str = "uuid";
}
                    


pub struct StartSpeakingRequest {
}
                    
impl StartSpeakingRequest {
    pub const uuid: &str = "uuid";
}
                    


pub struct StopSpeakingRequest {
}
                    
impl StopSpeakingRequest {
    pub const uuid: &str = "uuid";
}
                    


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