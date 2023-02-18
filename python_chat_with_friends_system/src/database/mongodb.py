import json
import re
import time

from typing import Any
from pymongo import MongoClient
from src.generated_grpc.chat_with_friends_service import *
import src.grpc_key_string_maps.chat_with_friends_service as chat_with_friends_service_property_dict


def _underline_substitute_function(match_obj: re.Match):
    return match_obj.group(0).upper().replace("_", "")

def underline_variable_to_first_character_capitalized_version(text: str):
    return re.sub(r"(?<!^)_\w", _underline_substitute_function, text)

def my_protobuff_object_to_dict_function(protobuff_obj: Any, property_list: List[str]) -> Dict[str, Any]:
    if type(protobuff_obj) is dict:
        return protobuff_obj

    old_dict: dict = protobuff_obj.to_dict()

    result = {}
    for property in property_list:
        the_stupid_key = underline_variable_to_first_character_capitalized_version(property)
        if the_stupid_key not in old_dict:
            # result[property] = None 
            result[property] = protobuff_obj._get_field_default(property) # type: ignore
        else:
            result[property] = old_dict.get(the_stupid_key)
    return result

def get_message_id(from_: str, to_: str, unix_timestamp_in_seconds: int):
    """
    unix_timestamp_in_seconds: 10-digit
    """
    list_ = [from_.strip(), to_.strip()]
    list_.sort()
    list_.append(str(unix_timestamp_in_seconds))
    return "&".join(list_)

def get_conversation_id(from_: str, to_: str):
    list_ = [from_.strip(), to_.strip()]
    list_.sort()
    return "&".join(list_)


class MyMongoDB:
    def __init__(self, mongo_server_address: str="mongodb://yingshaoxo:yingshaoxo@127.0.0.1:27017/"):
        self.client = MongoClient(mongo_server_address)
        self.friend_list_database = self.client["friend_list"]
        self.message_list_database = self.client["message_list"]
        self.conversation_list_database = self.client["conversation_list"]

        self.connection_test()
    
    def connection_test(self):
        self.client.list_database_names()
        return
    
    def rename_database(self, old_name, new_name):
        assert self.client.get_database(old_name) is not None

        have_at_least_one_data = False

        #copying collections and documents from old to new database
        for i in self.client.get_database(old_name).list_collection_names():
            self.client[new_name]
            self.client[new_name][i]
            for j in self.client[old_name][i].find():
                self.client[new_name][i].insert_one(j)
                have_at_least_one_data = True

        #dropping old database
        if have_at_least_one_data == True:
            self.client.drop_database(old_name)
    
    def get_friend(self, your_email: str, target_email: str) -> Friend | None:
        the_collection = self.friend_list_database.get_collection(your_email)
        the_filter = {
            chat_with_friends_service_property_dict.Friend.email: target_email,
        }
        found = the_collection.find_one(filter=the_filter)
        if found == None:
            return None
        else:
            return Friend().from_dict(
                my_protobuff_object_to_dict_function(
                    found, 
                    chat_with_friends_service_property_dict.Friend.__property_list__
                )
            ) 
    
    def insert_or_update_one_friend(self, addOrUpdateRequest: AddOrUpdateFriendRequest):
        addOrUpdateRequest.friend.email = addOrUpdateRequest.friend.email.strip()

        if (addOrUpdateRequest.friend.email == addOrUpdateRequest.your_email):
            raise Exception("You shouldn't add yourself in.")

        the_collection = self.friend_list_database.get_collection(addOrUpdateRequest.your_email)
        the_filter = {
            chat_with_friends_service_property_dict.Friend.email: addOrUpdateRequest.friend.email,
        }
        found = the_collection.find_one(filter=the_filter)

        the_new_friend_dict = my_protobuff_object_to_dict_function(addOrUpdateRequest.friend, chat_with_friends_service_property_dict.Friend.__property_list__)

        if found == None:
            # aren't found
            the_collection.insert_one(the_new_friend_dict)
        else:
            # found
            the_collection.update_one(filter=the_filter, update={"$set": the_new_friend_dict})
    
    def delete_a_friend(self, deleteFriendRequest: DeleteFriendRequest):
        the_collection = self.friend_list_database.get_collection(deleteFriendRequest.your_email)
        the_filter = {
            chat_with_friends_service_property_dict.Friend.email: deleteFriendRequest.friend_email,
        }
        the_collection.delete_one(filter=the_filter)
    
    def get_friend_list(self, getFriendListRequest:GetFriendListRequest) -> List[Friend]:
        the_collection = self.friend_list_database.get_collection(getFriendListRequest.your_email)
        result = the_collection.find()
        return [Friend().from_dict(one) for one in result]

    async def send_message_to_friend(
        self, send_message_to_friend_request: "SendMessageToFriendRequest"
    ):
        send_message_to_friend_request.chat_message.date_in_seconds_in_unix_timestamps = int(time.time());

        # handle message 
        conversation_id = get_conversation_id(
            send_message_to_friend_request.chat_message.from_email, 
            send_message_to_friend_request.chat_message.to_email
        )

        send_message_to_friend_request.chat_message.my_id = get_message_id(
            from_ = send_message_to_friend_request.chat_message.from_email,
            to_ = send_message_to_friend_request.chat_message.to_email,
            unix_timestamp_in_seconds = send_message_to_friend_request.chat_message.date_in_seconds_in_unix_timestamps
        )
        the_new_message_dict = my_protobuff_object_to_dict_function(
            send_message_to_friend_request.chat_message, 
            chat_with_friends_service_property_dict.ChatMessage.__property_list__
        )

        self.message_list_database[conversation_id].insert_one(
            the_new_message_dict
        )

        ## add your email to all previous message people_who_seen list
        messages_that_unseen = self.message_list_database[conversation_id].find(filter={
            chat_with_friends_service_property_dict.ChatMessage.people_who_seen: { "$nin" : [
                send_message_to_friend_request.chat_message.from_email
            ]}
        })
        for msg in messages_that_unseen:
            self.message_list_database[conversation_id].update_one(
                filter={
                    '_id': msg['_id']
                }, 
                update={
                    "$push": {
                        chat_with_friends_service_property_dict.ChatMessage.people_who_seen: 
                        send_message_to_friend_request.chat_message.from_email
                    }
                }
            )

        # handle converstation for you
        the_collection = self.conversation_list_database.get_collection(send_message_to_friend_request.chat_message.from_email)
        the_filter = {
            chat_with_friends_service_property_dict.Conversation.my_id: conversation_id,
        }
        found = the_collection.find_one(filter=the_filter)

        a_friend = self.get_friend(
            your_email=send_message_to_friend_request.chat_message.from_email,
            target_email=send_message_to_friend_request.chat_message.to_email
        )
        if (a_friend == None):
            a_friend = Friend(
                email=send_message_to_friend_request.chat_message.to_email,
                name=send_message_to_friend_request.chat_message.to_email,
                nickname=send_message_to_friend_request.chat_message.to_email,
                got_blocked=False,
                super_like=False,
                unknown=True
            )

        if send_message_to_friend_request.chat_message.message_type == ChatMessageType.text:
            last_saying = send_message_to_friend_request.chat_message.content
        else:
            last_saying = ""
        
        the_conversation_dict = my_protobuff_object_to_dict_function(
                    Conversation(
                        my_id = conversation_id, 
                        friend = a_friend, 
                        last_active_date_in_seconds_in_unix_timestamps = send_message_to_friend_request.chat_message.date_in_seconds_in_unix_timestamps,
                        last_saying = last_saying,
                        got_new_message=False
                    ), 
                    chat_with_friends_service_property_dict.Conversation.__property_list__
                )

        if found == None:
            # aren't found
            the_collection.insert_one(the_conversation_dict)
        else:
            # found
            the_collection.update_one(filter=the_filter, update={"$set": the_conversation_dict})

        # handle converstation for others
        the_collection = self.conversation_list_database.get_collection(send_message_to_friend_request.chat_message.to_email)
        the_filter = {
            chat_with_friends_service_property_dict.Conversation.my_id: conversation_id,
        }
        found = the_collection.find_one(filter=the_filter)

        a_friend = self.get_friend(
            your_email=send_message_to_friend_request.chat_message.to_email,
            target_email=send_message_to_friend_request.chat_message.from_email
        )
        if (a_friend == None):
            a_friend = Friend(
                email=send_message_to_friend_request.chat_message.from_email,
                name=send_message_to_friend_request.chat_message.from_email,
                nickname=send_message_to_friend_request.chat_message.from_email,
                got_blocked=False,
                super_like=False,
                unknown=True
            )

        if send_message_to_friend_request.chat_message.message_type == ChatMessageType.text:
            last_saying = send_message_to_friend_request.chat_message.content
        else:
            last_saying = ""
        
        the_conversation_dict = my_protobuff_object_to_dict_function(
                    Conversation(
                        my_id = conversation_id, 
                        friend = a_friend, 
                        last_active_date_in_seconds_in_unix_timestamps = send_message_to_friend_request.chat_message.date_in_seconds_in_unix_timestamps,
                        last_saying = last_saying,
                        got_new_message=True
                    ), 
                    chat_with_friends_service_property_dict.Conversation.__property_list__
                )

        if found == None:
            # aren't found
            the_collection.insert_one(the_conversation_dict)
        else:
            # found
            the_collection.update_one(filter=the_filter, update={"$set": the_conversation_dict})

    async def get_converstation_list(
        self, get_conversation_list_request: "GetConversationListRequest"
    ) -> List[Conversation]:
        the_collection = self.conversation_list_database.get_collection(get_conversation_list_request.your_email)
        result = the_collection.find() \
                            .sort(chat_with_friends_service_property_dict.Conversation.last_active_date_in_seconds_in_unix_timestamps, -1) \
                            .skip(get_conversation_list_request.page_number*get_conversation_list_request.page_size) \
                            .limit(get_conversation_list_request.page_size)
        return [Conversation().from_dict(one) for one in result]

    async def get_chat_message_list(
        self, get_chat_message_list_request: "GetChatMessageListRequest"
    ) -> List[ChatMessage]:
        conversation_id = get_conversation_id(
            get_chat_message_list_request.your_email, 
            get_chat_message_list_request.target_email
        )
        the_collection = self.message_list_database.get_collection(conversation_id)
        result = the_collection.find()
        result = [ChatMessage().from_dict(one) for one in result]

        # set got_new_message to false
        the_collection = self.conversation_list_database.get_collection(get_chat_message_list_request.your_email)
        the_filter = {
            chat_with_friends_service_property_dict.Conversation.my_id: conversation_id,
        }
        found = the_collection.find_one(filter=the_filter)
        if found != None:
            found[chat_with_friends_service_property_dict.Conversation.got_new_message] = False
            the_collection.update_one(filter=the_filter, update={"$set": found})

        return result

    async def delete_message(
        self, delete_message_request: "DeleteMessageRequest"
    ):
        conversation_id = get_conversation_id(
            delete_message_request.message.from_email, 
            delete_message_request.message.to_email, 
        )
        the_collection = self.message_list_database.get_collection(conversation_id)
        the_collection.delete_one(
            {chat_with_friends_service_property_dict.ChatMessage.my_id: delete_message_request.message.my_id},
        )

    async def delete_converstation(
        self, delete_converstation_request: "DeleteConverstationRequest"
    ):
        the_collection = self.conversation_list_database.get_collection(delete_converstation_request.your_email)
        the_collection.delete_one(
            {chat_with_friends_service_property_dict.Conversation.my_id: delete_converstation_request.conversation.my_id},
        )