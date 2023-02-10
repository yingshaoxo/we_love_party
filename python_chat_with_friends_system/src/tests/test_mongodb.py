import pytest

from src import config
from src.database.mongodb import MyMongoDB, underline_variable_to_first_character_capitalized_version
from src.generated_grpc.chat_with_friends_service import *

@pytest.mark.asyncio
async def test_for_fun():
    myMongoDB = MyMongoDB(mongo_server_address=config.MONGO_DB_URL)
    myMongoDB.rename_database("test", "new_db")
    print(myMongoDB.client.list_database_names())

    for friend_email in ["ggboy@gmail.com", "dailylife@twitter.com"]:
        myMongoDB.insert_or_update_one_friend(
            AddOrUpdateFriendRequest(
                your_email="yingshaoxo@gmail.com", 
                friend=Friend(
                    email=friend_email,
                    name="unknown",
                    nickname="girlfriend?",
                    got_blocked=True,
                    super_like=False,
                )
            ))

    # myMongoDB.delete_a_friend(DeleteFriendRequest(
    #     your_email="yingshaoxo@gmail.com",
    #     friend_email="ggboy@gmail.com"
    # ))

    result = myMongoDB.get_friend_list(GetFriendListRequest(your_email="yingshaoxo@gmail.com"))
    
    print(result)

def test_regex_replacement():
    print(underline_variable_to_first_character_capitalized_version("_gk_dahg_d"))