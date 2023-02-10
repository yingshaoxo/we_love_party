
from typing import List

class HelloRequest:
    name: str = "name"
    __property_list__: List[str] = ["name"]

class HelloReply:
    message: str = "message"
    __property_list__: List[str] = ["message"]

class RegisterRequest:
    email: str = "email"
    __property_list__: List[str] = ["email"]

class RegisterReply:
    result: str = "result"
    error: str = "error"
    __property_list__: List[str] = ["result", "error"]

class RegisterConfirmRequest:
    email: str = "email"
    random_string: str = "random_string"
    __property_list__: List[str] = ["email", "random_string"]

class RegisterConfirmReply:
    jwt: str = "jwt"
    error: str = "error"
    __property_list__: List[str] = ["jwt", "error"]

class IsJwtOkRequest:
    jwt: str = "jwt"
    __property_list__: List[str] = ["jwt"]

class IsJwtOkReply:
    email: str = "email"
    error: str = "error"
    __property_list__: List[str] = ["email", "error"]

class IsOnlineRequest:
    email: str = "email"
    __property_list__: List[str] = ["email"]

class IsOnlineResponse:
    error: str = "error"
    online: str = "online"
    __property_list__: List[str] = ["error", "online"]