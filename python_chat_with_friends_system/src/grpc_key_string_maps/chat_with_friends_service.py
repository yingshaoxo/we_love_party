
from typing import List

class ChatMessage:
    from_email: str = "from_email"
    to_email: str = "to_email"
    message_type: str = "message_type"
    content: str = "content"
    date_in_seconds_in_unix_timestamps: str = "date_in_seconds_in_unix_timestamps"
    __property_list__: List[str] = ["from_email", "to_email", "message_type", "content", "date_in_seconds_in_unix_timestamps"]

class AddOrUpdateFriendRequest:
    your_email: str = "your_email"
    friend: str = "friend"
    __property_list__: List[str] = ["your_email", "friend"]

class Friend:
    email: str = "email"
    name: str = "name"
    nickname: str = "nickname"
    got_blocked: str = "got_blocked"
    super_like: str = "super_like"
    __property_list__: List[str] = ["email", "name", "nickname", "got_blocked", "super_like"]

class AddOrUpdateFriendResponse:
    error: str = "error"
    __property_list__: List[str] = ["error"]

class GetFriendListRequest:
    your_email: str = "your_email"
    __property_list__: List[str] = ["your_email"]

class GetFriendListResponse:
    error: str = "error"
    friend_list: str = "friend_list"
    __property_list__: List[str] = ["error", "friend_list"]

class DeleteFriendRequest:
    your_email: str = "your_email"
    friend_email: str = "friend_email"
    __property_list__: List[str] = ["your_email", "friend_email"]

class DeleteFriendResponse:
    error: str = "error"
    __property_list__: List[str] = ["error"]