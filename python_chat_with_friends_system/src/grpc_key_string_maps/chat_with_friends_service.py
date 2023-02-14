
from typing import List

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
    unknown: str = "unknown"
    __property_list__: List[str] = ["email", "name", "nickname", "got_blocked", "super_like", "unknown"]

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

class SendMessageToFriendRequest:
    chatMessage: str = "chatMessage"
    __property_list__: List[str] = ["chatMessage"]

class ChatMessage:
    my_id: str = "my_id"
    from_email: str = "from_email"
    to_email: str = "to_email"
    message_type: str = "message_type"
    content: str = "content"
    date_in_seconds_in_unix_timestamps: str = "date_in_seconds_in_unix_timestamps"
    people_who_seen: str = "people_who_seen"
    __property_list__: List[str] = ["my_id", "from_email", "to_email", "message_type", "content", "date_in_seconds_in_unix_timestamps", "people_who_seen"]

class SendMessageToFriendResponse:
    error: str = "error"
    __property_list__: List[str] = ["error"]

class GetConversationListRequest:
    your_email: str = "your_email"
    page_size: str = "page_size"
    page_number: str = "page_number"
    __property_list__: List[str] = ["your_email", "page_size", "page_number"]

class Conversation:
    my_id: str = "my_id"
    friend: str = "friend"
    last_active_date_in_seconds_in_unix_timestamps: str = "last_active_date_in_seconds_in_unix_timestamps"
    last_saying: str = "last_saying"
    got_new_message: str = "got_new_message"
    __property_list__: List[str] = ["my_id", "friend", "last_active_date_in_seconds_in_unix_timestamps", "last_saying", "got_new_message"]

class GetConversationListResponse:
    error: str = "error"
    conversation_list: str = "conversation_list"
    __property_list__: List[str] = ["error", "conversation_list"]

class GetChatMessageListRequest:
    your_email: str = "your_email"
    target_email: str = "target_email"
    __property_list__: List[str] = ["your_email", "target_email"]

class GetChatMessageListResponse:
    error: str = "error"
    chat_message_list: str = "chat_message_list"
    __property_list__: List[str] = ["error", "chat_message_list"]

class DeleteMessageRequest:
    message: str = "message"
    __property_list__: List[str] = ["message"]

class DeleteMessageResponse:
    error: str = "error"
    __property_list__: List[str] = ["error"]

class DeleteConverstationRequest:
    your_email: str = "your_email"
    conversation: str = "conversation"
    __property_list__: List[str] = ["your_email", "conversation"]

class DeleteConverstationResponse:
    error: str = "error"
    __property_list__: List[str] = ["error"]