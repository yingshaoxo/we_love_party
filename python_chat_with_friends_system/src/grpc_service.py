import asyncio

from grpclib.server import Server
from src.generated_grpc.chat_with_friends_service import *

from func_timeout import func_timeout, FunctionTimedOut

from src import config
from src import utils
from src.database.mongodb import MyMongoDB


class MyChatWithFriendsService(ChatWithFriendsServiceBase):
    def __init__(self, myMongoDB: MyMongoDB):
        self.myMongoDB = myMongoDB

    async def add_or_update_friend(
        self, add_or_update_friend_request: "AddOrUpdateFriendRequest"
    ) -> "AddOrUpdateFriendResponse":
        default_response = AddOrUpdateFriendResponse()
        try:
            self.myMongoDB.insert_or_update_one_friend(
                add_or_update_friend_request
            )
            default_response.error = None
        except Exception as e:
            print(e)
            default_response.error = str(e)
        finally:
            return default_response

    async def get_friend_list(
        self, get_friend_list_request: "GetFriendListRequest"
    ) -> "GetFriendListResponse":
        default_response = GetFriendListResponse()
        try:
            friend_list = self.myMongoDB.get_friend_list(
                getFriendListRequest=get_friend_list_request
            )
            default_response.friend_list = friend_list
            default_response.error = None
        except Exception as e:
            print(e)
            default_response.error = str(e)
        finally:
            return default_response

    async def delete_friend(
        self, delete_friend_request: "DeleteFriendRequest"
    ) -> "DeleteFriendResponse":
        default_response = DeleteFriendResponse()
        try:
            self.myMongoDB.delete_a_friend(
                delete_friend_request
            )
            default_response.error = None
        except Exception as e:
            print(e)
            default_response.error = str(e)
        finally:
            return default_response


async def run_service(host: str, port: int, myMongoDB: MyMongoDB):
    server = Server([
        MyChatWithFriendsService(
            myMongoDB=myMongoDB
        )
    ])
    await server.start(host, port)
    await server.wait_closed()