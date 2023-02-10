
from typing import List

class CreateUserRequest:
    email: str = "email"
    __property_list__: List[str] = ["email"]

class CreateUserResponse:
    result: str = "result"
    error: str = "error"
    __property_list__: List[str] = ["result", "error"]

class DeleteUserRequest:
    email: str = "email"
    __property_list__: List[str] = ["email"]

class DeleteUserResponse:
    result: str = "result"
    error: str = "error"
    __property_list__: List[str] = ["result", "error"]

class UpdateUserRequest:
    email: str = "email"
    username: str = "username"
    head_image: str = "head_image"
    sex: str = "sex"
    age: str = "age"
    __property_list__: List[str] = ["email", "username", "head_image", "sex", "age"]

class UpdateUserResponse:
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

class UserModel:
    email: str = "email"
    username: str = "username"
    head_image: str = "head_image"
    sex: str = "sex"
    age: str = "age"
    __property_list__: List[str] = ["email", "username", "head_image", "sex", "age"]