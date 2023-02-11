import json
import re
from typing import Any
from pymongo import MongoClient
from src.generated_grpc.chat_with_friends_service import *
import src.grpc_key_string_maps.chat_with_friends_service as chat_with_friends_service_property_dict


def _underline_substitute_function(match_obj: re.Match):
    return match_obj.group(0).upper().replace("_", "")

def underline_variable_to_first_character_capitalized_version(text: str):
    return re.sub(r"(?<!^)_\w", _underline_substitute_function, text)

def my_protobuff_object_to_dict_function(protobuff_obj: Any, property_list: List[str]) -> Dict[str, Any]:
    old_dict = protobuff_obj.to_dict()

    result = {}
    for property in property_list:
        the_stupid_key = underline_variable_to_first_character_capitalized_version(property)
        if the_stupid_key not in old_dict:
            # result[property] = None 
            result[property] = protobuff_obj._get_field_default(property)
        else:
            result[property] = old_dict.get(the_stupid_key)
    return result


class MyMongoDB:
    def __init__(self, mongo_server_address: str="mongodb://yingshaoxo:yingshaoxo@127.0.0.1:27017/"):
        self.client = MongoClient(mongo_server_address)
        self.friend_list_database = self.client["friend_list"]
    
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
    
    def insert_or_update_one_friend(self, addOrUpdateRequest: AddOrUpdateFriendRequest):
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
