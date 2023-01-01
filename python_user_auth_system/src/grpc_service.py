import asyncio
from grpclib.server import Server

from src.generated_grpc.account_auth_service import *

# from src import config
from src import utils

from src.auth import MyAuthClass
# from src.database.sqlite import MyDatabase
# from src.database.redis import MyRedis
from src.utils import MyO365

from func_timeout import func_timeout, FunctionTimedOut


class AccountAuthenticationService(AccountAuthenticationServiceBase):
    def __init__(self, my_o365: MyO365, my_authentication_class: MyAuthClass):
        self.my_o365 = my_o365
        self.my_authentication_class = my_authentication_class

    async def say_hello(self, hello_request: HelloRequest) -> HelloReply:
        return HelloReply(message="hi: " + hello_request.name)

    async def user_register_request(
        self, register_request: RegisterRequest
    ) -> RegisterReply:
        email = register_request.email
        if not utils.check_if_it_is_email(email):
            return RegisterReply(result="failed", error="email is not valid.")

        randomString = utils.generate_x_random_number_string(x=6)
        await self.my_authentication_class.add_info_to_unverified_pool(email=email, random_string=randomString)

        try:
            func_timeout(20, self.my_o365.send_email2, args=(email, "Thanks for register WeLoveParty App", "Here is your verification code: " + randomString))
        except FunctionTimedOut:
            print(f"Sening email to {email} timeout!")
            return RegisterReply(result="failed", error="can't send email. timeout.")
        except Exception as e:
            # Handle any exceptions that doit might raise here
            print(e)
            return RegisterReply(result="failed", error=f"can't send email. {str(e)}")

        return RegisterReply(result="success", error=None)

    async def user_register_confirm(
        self, register_confirm_request: RegisterConfirmRequest
    ) -> RegisterConfirmReply:
        email = register_confirm_request.email
        random_string = register_confirm_request.random_string

        matched = await self.my_authentication_class.check_if_any_info_matchs_in_unverified_pool(email=email, random_string=random_string)
        if matched is None:
            return RegisterConfirmReply(jwt="", error="No matched info found.")
        
        await self.my_authentication_class.add_info_to_verified_pool(email=email, random_string=random_string)
        jwt_string = await self.my_authentication_class.get_auth_jwt_string(email=email, random_string=random_string)
        return RegisterConfirmReply(
            jwt=jwt_string,
            error=None
        )

    async def is_jwt_ok(self, jwt_is_ok_request: IsJwtOkRequest) -> IsJwtOkReply:
        email = await self.my_authentication_class.auth_jwt_string(raw_jwt_string=jwt_is_ok_request.jwt)

        if (email is None):
            return IsJwtOkReply(email="", error="Invalid JWT.")
        
        return IsJwtOkReply(email=email, error=None)


async def run_service(host: str, port: int, my_o365: MyO365, my_authentication_class: MyAuthClass):
    server = Server([
        AccountAuthenticationService(
            my_o365=my_o365, 
            my_authentication_class=my_authentication_class
        )
    ])
    await server.start(host, port)
    await server.wait_closed()


# if __name__ == '__main__':
#     my_o365 = MyO365(config.O365_credentials)
#     my_database = MyDatabase(DATABASE_URL=config.DATABASE_URL)
#     my_redis_1 = MyRedis(redis_host_URL=config.REDIS_HOST_URL, db_number=1)
#     my_authentication_class = MyAuthClass(database=my_database, redis=my_redis_1)

#     loop = asyncio.get_event_loop()
#     loop.run_until_complete(run_service(port=40052, my_o365=my_o365, my_authentication_class=my_authentication_class))