from grpclib.server import Server

from src import utils, config
from src.auth import MyAuthClass
from src.utils import MyO365
from src.generated_grpc.account_auth_service import *

from auto_everything.my_email import Telegram_Bot

from func_timeout import func_timeout, FunctionTimedOut #type: ignore


class AccountAuthenticationService(AccountAuthenticationServiceBase):
    def __init__(self, my_o365: MyO365, my_authentication_class: MyAuthClass, telegram_bot: Telegram_Bot):
        self.my_o365 = my_o365
        self.my_authentication_class = my_authentication_class
        self.telegram_bot = telegram_bot

    async def say_hello(self, hello_request: HelloRequest) -> HelloReply:
        return HelloReply(message="hi: " + hello_request.name)

    async def user_register_request(
        self, register_request: RegisterRequest
    ) -> RegisterResponse:
        email = register_request.email
        if not utils.check_if_it_is_email(email):
            return RegisterResponse(
                the_email_the_user_need_to_send_verify_code_to=self.my_authentication_class.our_email, 
                the_verify_code_the_user_need_to_send_back="", 
                error="email is not valid."
            )
        
        random_string = utils.generate_x_random_number_string(x=10)
        if self.my_authentication_class.check_if_the_user_is_tester(email=email):
            random_string = "123456"
            await self.my_authentication_class.add_info_to_unverified_pool(email=email, random_string=random_string)
        else:
            await self.my_authentication_class.add_info_to_unverified_pool(email=email, random_string=random_string)

        return RegisterResponse(
            the_email_the_user_need_to_send_verify_code_to=self.my_authentication_class.our_email, 
            the_verify_code_the_user_need_to_send_back=random_string, 
            error=None
        )
        # func_timeout(20, self.my_o365.send_email2, args=(email, "Thank you for registering WeLoveParty App", "Here is your verification code: " + randomString))

    async def user_register_confirm(
        self, register_confirm_request: RegisterConfirmRequest
    ) -> RegisterConfirmResponse:
        email = register_confirm_request.email
        the_verify_code_the_user_need_to_send_back = register_confirm_request.the_verify_code_the_user_need_to_send_back

        if self.my_authentication_class.check_if_the_user_is_tester(email=email):
            pass
        else:
            matched = await self.my_authentication_class.check_if_all_info_matchs_in_unverified_pool(email=email, random_string=the_verify_code_the_user_need_to_send_back)
            if matched == False:
                return RegisterConfirmResponse(jwt="", error="No matched info found.")
        
        random_string = utils.generate_x_random_number_string(x=11)
        await self.my_authentication_class.add_info_to_verified_pool(email=email, random_string=random_string)
        jwt_string = await self.my_authentication_class.get_auth_jwt_string(email=email, random_string=random_string)

        if self.my_authentication_class.check_if_the_user_is_admin(email=email):
            try:
                # func_timeout(20, self.my_o365.send_email2, args=(email, "Thank you for running WeLoveParty service", "Here is your JWT code: <br><br>" + jwt_string))
                print("start to send greeting email to admin...", flush=True)
                self.telegram_bot.send_message(chat_id=config.Telegram_Owner_Chat_ID, text=f"Thank you for running WeLoveParty service.\n\nHere is your JWT code: \n\n{jwt_string}")
                print("message sent.", flush=True)
            except FunctionTimedOut:
                pass
            except Exception as e:
                print(e)

        return RegisterConfirmResponse(
            jwt=jwt_string,
            error=None
        )

    async def is_jwt_ok(self, is_jwt_ok_request: IsJwtOkRequest) -> IsJwtOkReply:
        email = await self.my_authentication_class.auth_jwt_string(raw_jwt_string=is_jwt_ok_request.jwt)

        if (email is None):
            return IsJwtOkReply(email="", error="Invalid JWT.")
        
        return IsJwtOkReply(email=email, error=None)

    async def is_admin(self, is_admin_request: IsAdminRequest) -> IsAdminResponse:
        email = await self.my_authentication_class.auth_jwt_string(raw_jwt_string=is_admin_request.jwt)

        if (email is None):
            return IsAdminResponse(yes=True, error="Invalid JWT.")
        
        if not self.my_authentication_class.check_if_the_user_is_admin(email=email):
            return IsAdminResponse(yes=False, error="You are not an admin.")
        
        return IsAdminResponse(yes=True, error=None)

    async def is_online(
        self, is_online_request: IsOnlineRequest
    ) -> IsOnlineResponse:
        if is_online_request.email != None:
            try:
                await self.my_authentication_class.add_email_to_online_pool(email=is_online_request.email)
            except Exception as e:
                print(e)
                return IsOnlineResponse(error=str(e), online=False)
        return IsOnlineResponse(error=None, online=True)

async def run_service(host: str, port: int, my_o365: MyO365, my_authentication_class: MyAuthClass, telegram_bot: Telegram_Bot):
    server = Server([
        AccountAuthenticationService(
            my_o365=my_o365, 
            my_authentication_class=my_authentication_class,
            telegram_bot=telegram_bot
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