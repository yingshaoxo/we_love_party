import pytest

from src import config
from src.database.mongodb import MyMongoDB

@pytest.mark.asyncio
async def test_for_fun():
    myMongoDB = MyMongoDB(mongo_server_address=config.MONGO_DB_URL)
    print(myMongoDB.client.list_database_names())