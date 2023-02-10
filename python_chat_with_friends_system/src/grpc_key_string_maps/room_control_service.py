
from typing import List

class CreateRoomRequest:
    roomName: str = "roomName"
    __property_list__: List[str] = ["roomName"]

class CreateRoomResponse:
    error: str = "error"
    success: str = "success"
    __property_list__: List[str] = ["error", "success"]

class AllowJoinRequest:
    roomName: str = "roomName"
    identity: str = "identity"
    __property_list__: List[str] = ["roomName", "identity"]

class AllowJoinResponse:
    error: str = "error"
    accessToken: str = "accessToken"
    __property_list__: List[str] = ["error", "accessToken"]

class RoomInfo:
    roomName: str = "roomName"
    numberOfParticipants: str = "numberOfParticipants"
    __property_list__: List[str] = ["roomName", "numberOfParticipants"]

class ListRoomsResponse:
    error: str = "error"
    rooms: str = "rooms"
    __property_list__: List[str] = ["error", "rooms"]

class DeleteRoomRequest:
    roomName: str = "roomName"
    __property_list__: List[str] = ["roomName"]

class DeleteRoomResponse:
    error: str = "error"
    success: str = "success"
    __property_list__: List[str] = ["error", "success"]