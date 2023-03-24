import re
import jwt
from src.database.redis import MyRedis

# from src import models
import src.config as config
# import src.database.sqlite as sqlite
from typing import Optional, Any


REDIS_BEGIN_EMAIL_VERIFY_ACTION_KEY = 'verify_email_begin'
REDIS_EMAIL_WE_GOT_VERIFY_ACTION_KEY = 'verify_email_we_got'
REDIS_JWT_ACTION_KEY = 'jwt'
REDIS_IS_ONLINE_ACTION_KEY = 'online'


class MyAuthClass:
    def __init__(self, redis: MyRedis) -> None:
        self.myRedis: MyRedis = redis
        self.our_email = config.OUR_EMAIL


    async def check_if_the_user_is_admin(self, email: str) -> bool:
        if email not in config.ADMIN_EMAIL_LIST:
            return False
        else:
            return True


    async def check_if_the_user_is_tester(self, email: str) -> bool:
        if email not in config.TESTER_EMAIL_LIST:
            return False
        else:
            return True


    # async def auth_email(self, email: str) -> Optional[models.User]:
    #     user = await self.myDatabase.getAUserByEmail(email=email)
    #     if (not user):
    #         return None
    #     return user


    def encode_jwt(self, payload: dict[str, Any]):
        return jwt.encode(payload, config.SECRET, algorithm='HS256')


    def decode_jwt(self, raw_string: str):
        return jwt.decode(raw_string, config.SECRET, algorithms=['HS256'])


    def regex_validate_for_jwt(self, raw_string: str):
        return bool(re.match(r'^[a-zA-Z0-9\-_]+?\.[a-zA-Z0-9\-_]+?\.([a-zA-Z0-9\-_]+)?$', raw_string))


    # jwt: JSON Web Token
    async def auth_jwt_string(self, raw_jwt_string: str) -> Optional[str]:
        # print("the jwt I got: ", raw_jwt_string)
        
        if not self.regex_validate_for_jwt(raw_jwt_string):
            return None

        try: 
            object = self.decode_jwt(raw_jwt_string)
        except Exception as e:
            print(e)
            return None

        email = object.get('email')
        random_string = object.get('random_string')
        if not email or not random_string:
            return None
        
        verified = await self.check_if_the_info_is_in_verified_pool(email=email, random_string=random_string)
        if not verified:
            return None
        
        # user is verified, you may want to save it to golang handled database
        return email


    async def get_auth_jwt_string(self, email: str, random_string: str) -> str:
        return self.encode_jwt({'email': email, 'random_string': random_string})


    async def add_info_to_unverified_pool(self, email: str, random_string: str) -> None:
        key = f"{email}.{REDIS_BEGIN_EMAIL_VERIFY_ACTION_KEY}"
        value = f"{random_string}"

        expire_time_left_in_seconds = self.myRedis.redis.ttl(key)
        if (expire_time_left_in_seconds < 0):
            #The command returns -2 if the key does not exist.
            #The command returns -1 if the key exists but has no associated expire.
            self.myRedis.set(key, value, expire_time_in_seconds=180)
        else:
            # do nothing since for each 3 minutes, the user can only require login once
            pass


    def add_info_that_was_come_from_email_system_to_unverified_pool(self, email: str, random_string: str) -> None:
        key = f"{email}.{REDIS_EMAIL_WE_GOT_VERIFY_ACTION_KEY}"
        value = f"{random_string}"
        self.myRedis.set(key, value, expire_time_in_seconds=180)

    
    async def check_if_all_info_matchs_in_unverified_pool(self, email: str, random_string: str) -> bool:
        key1 = f"{email}.{REDIS_BEGIN_EMAIL_VERIFY_ACTION_KEY}"
        key2 = f"{email}.{REDIS_EMAIL_WE_GOT_VERIFY_ACTION_KEY}"
        value1 = self.myRedis.get(key1)
        value2 = self.myRedis.get(key2)
        return value1 == value2 == random_string


    async def add_info_to_verified_pool(self, email: str, random_string: str) -> None:
        key = f"{email}.{REDIS_JWT_ACTION_KEY}"
        value = f"{random_string}.device_name"

        old_value = self.myRedis.get(key)
        if old_value == None:
            self.myRedis.set(key, value)
        else:
            self.myRedis.set(key, old_value + "&" + value)
    

    async def check_if_the_info_is_in_verified_pool(self, email: str, random_string: str) -> bool:
        key = f"{email}.{REDIS_JWT_ACTION_KEY}"
        value = f"{random_string}.device_name"

        old_value = self.myRedis.get(key)
        if old_value == None:
            return False
        else:
            old_value_list = old_value.split("&")
            for one in old_value_list.copy():
                if one == value:
                    if len(old_value_list) > 25:
                        # we allow no more than 25 devices log in by using same account.
                        for one in old_value_list:
                            if one != value:
                                self.myRedis.delete(one)
                    return True
            return False

    
    async def get_all_devices_by_email_from_verified_pool(self, email: str) -> list[str]:
        key = f"{email}.{REDIS_JWT_ACTION_KEY}"
        value = self.myRedis.get(key)
        if value != None:
            value_list = value.split("&")
            result_list = []
            for one in value_list:
                splits = one.split(".")
                if len(splits) >= 2:
                    result_list.append(splits[1])
            return result_list
        else:
            return []


    async def log_out_all_devices_by_email_from_verified_pool(self, email: str) -> None:
        key = f"{email}.{REDIS_JWT_ACTION_KEY}"
        self.myRedis.delete(key)


    async def add_email_to_online_pool(self, email: str) -> None:
        key = f"{email}.{REDIS_IS_ONLINE_ACTION_KEY}"
        value = "1"
        self.myRedis.set(key, value, expire_time_in_seconds=10)
        # self.myRedis.redis.set(key, value, ex=10)
    

    async def check_if_email_is_in_online_pool(self, email: str) -> bool:
        key = f"{email}.{REDIS_IS_ONLINE_ACTION_KEY}"
        value = "1"
        return self.myRedis.get(key) == value
