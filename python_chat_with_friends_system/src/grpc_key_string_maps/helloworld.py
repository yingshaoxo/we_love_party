
from typing import List

class VoiceRequest:
    uuid: str = "uuid"
    timestamp: str = "timestamp"
    voice: str = "voice"
    __property_list__: List[str] = ["uuid", "timestamp", "voice"]

class VoiceReply:
    uuid: str = "uuid"
    timestamp: str = "timestamp"
    voice: str = "voice"
    __property_list__: List[str] = ["uuid", "timestamp", "voice"]

class CurrentUsersUUIDReply:
    uuid: str = "uuid"
    __property_list__: List[str] = ["uuid"]

class StartSpeakingRequest:
    uuid: str = "uuid"
    __property_list__: List[str] = ["uuid"]

class StopSpeakingRequest:
    uuid: str = "uuid"
    __property_list__: List[str] = ["uuid"]

class HelloRequest:
    name: str = "name"
    __property_list__: List[str] = ["name"]

class HelloReply:
    message: str = "message"
    __property_list__: List[str] = ["message"]