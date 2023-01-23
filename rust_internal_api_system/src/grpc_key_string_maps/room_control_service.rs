pub struct CreateRoomRequest {
}
                    
impl CreateRoomRequest {
    pub const roomName: &str = "roomName";
}
                    


pub struct CreateRoomResponse {
}
                    
impl CreateRoomResponse {
    pub const success: &str = "success";
    pub const error: &str = "error";
}
                    


pub struct AllowJoinRequest {
}
                    
impl AllowJoinRequest {
    pub const roomName: &str = "roomName";
    pub const identity: &str = "identity";
}
                    


pub struct AllowJoinResponse {
}
                    
impl AllowJoinResponse {
    pub const accessToken: &str = "accessToken";
    pub const error: &str = "error";
}
                    


pub struct RoomInfo {
}
                    
impl RoomInfo {
    pub const roomName: &str = "roomName";
    pub const numberOfParticipants: &str = "numberOfParticipants";
}
                    


pub struct ListRoomsResponse {
}
                    
impl ListRoomsResponse {
    pub const rooms: &str = "rooms";
    pub const error: &str = "error";
}
                    


pub struct DeleteRoomRequest {
}
                    
impl DeleteRoomRequest {
    pub const roomName: &str = "roomName";
}
                    


pub struct DeleteRoomResponse {
}
                    
impl DeleteRoomResponse {
    pub const success: &str = "success";
    pub const error: &str = "error";
}