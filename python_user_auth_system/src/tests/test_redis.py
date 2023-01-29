import src.models as models
from src.database.redis import MyRedis
import pytest


# async def test_it(my_redis: MyRedis):
#     theKey = "hi"

#     assert my_redis.get(theKey) is None

#     assert my_redis.set(theKey, "hello") is True

#     assert my_redis.get(theKey) == "hello"

#     my_redis.delete(theKey)

#     assert my_redis.get(theKey) is None

@pytest.mark.asyncio
async def test_multiple_db_in_redis():
    my_redis_0 = MyRedis(redis_host_URL='localhost', db_number=0)
    my_redis_1 = MyRedis(redis_host_URL='localhost', db_number=1)

    my_redis_0.set("hi1", "ok")
    value = my_redis_0.get("hi1")
    assert value == "ok"

    my_redis_1.set("hi2", "yes")
    value = my_redis_1.get("hi2")
    assert value == "yes"

    value = my_redis_0.get("hi2")
    assert value == None

    my_redis_0.delete("hi1")
    my_redis_1.delete("hi2")

    value = my_redis_0.get("hi1")
    assert value == None