
from typing import List

class CreateAUserRequest:
    email: str = "email"
    __property_list__: List[str] = ["email"]

class CreateAUserResponse:
    result: str = "result"
    error: str = "error"
    __property_list__: List[str] = ["result", "error"]

class DeleteAUserRequest:
    email: str = "email"
    __property_list__: List[str] = ["email"]

class DeleteAUserResponse:
    result: str = "result"
    error: str = "error"
    __property_list__: List[str] = ["result", "error"]

class GetUserRequest:
    email: str = "email"
    __property_list__: List[str] = ["email"]

class GetUserResponse:
    error: str = "error"
    user_exists: str = "user_exists"
    email: str = "email"
    username: str = "username"
    head_image: str = "head_image"
    sex: str = "sex"
    age: str = "age"
    __property_list__: List[str] = ["error", "user_exists", "email", "username", "head_image", "sex", "age"]

class CheckIfUserExistsRequest:
    email: str = "email"
    __property_list__: List[str] = ["email"]

class CheckIfUserExistsResponse:
    error: str = "error"
    user_exists: str = "user_exists"
    __property_list__: List[str] = ["error", "user_exists"]