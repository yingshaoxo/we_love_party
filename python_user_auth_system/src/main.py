import asyncio
from datetime import datetime
from socket import timeout
import sys
import uvicorn

import multiprocessing
from src.grpc_service import run_service

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from func_timeout import func_timeout, FunctionTimedOut

from src import config
from src import utils
from src import models

from src.utils import MyO365
from src.auth import MyAuthClass
from src.database.sqlite import MyDatabase
from src.database.redis import MyRedis

my_database = MyDatabase(DATABASE_URL=config.DATABASE_URL)
my_redis_1 = MyRedis(redis_host_URL=config.REDIS_HOST_URL, db_number=1)
my_auth_class = MyAuthClass(database=my_database, redis=my_redis_1)
my_o365 = MyO365(config.O365_credentials)


app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@ app.get("/", response_model=str)
async def home():
    return "Hello, World!"


# @ app.post("/user_register_request/", response_model=models.UserRegisterOutput)
# async def user_register(input: models.UserRegisterInput):
#     email = input.email
#     if not utils.check_if_it_is_email(email):
#         return models.UserRegisterOutput.parse_obj({"result": "failed.", "error": "email is not valid."})

#     randomString = utils.generate_x_random_number_string(x=6)
#     await my_auth_class.add_info_to_unverified_pool(email=email, random_string=randomString)

#     try:
#         func_timeout(5, my_o365.send_email2, args=(email, "Thanks for register WeLoveParty App", "Here is your verification code: " + randomString))
#     except FunctionTimedOut:
#         print(f"Sening email to {email} timeout!")
#         return models.UserRegisterOutput.parse_obj({"result": "failed.", "error": "can't send email."})
#     except Exception as e:
#         # Handle any exceptions that doit might raise here
#         print(e)
#         return models.UserRegisterOutput.parse_obj({"result": "failed.", "error": "can't send email."})

#     # myO365.send_email2(email, "Thanks for register WeLoveParty App", "Here is your verification code: " + randomString)

#     return models.UserRegisterOutput.parse_obj({"result": "success.", "error": None})


# @ app.post("/user_register_confirm/", response_model=models.UserRegisterConfirmOutput)
# async def user_register_confirm(input: models.UserRegisterConfirmInput):
#     email = input.email
#     randomString = input.random_string

#     matched = await my_auth_class.check_if_any_info_matchs_in_unverified_pool(email=email, random_string=randomString)
#     if (not matched):
#         return models.UserRegisterConfirmOutput.parse_obj({"result": None, "error": "No matched info found."})
    
#     await my_auth_class.add_info_to_verified_pool(email=email, random_string=randomString)
#     jwt_string = await my_auth_class.get_auth_jwt_string(email=email, random_string=randomString)
#     return models.UserRegisterConfirmOutput.parse_obj(
#     {
#         "result": {
#             "jwt": jwt_string,
#         }, 
#         "error": None
#     })



@ app.post("/auth_jwt/", response_model=models.AuthJwtOutput)
async def auth_jwt(input: models.AuthJwtInput):
    user = await my_auth_class.auth_jwt_string(raw_jwt_string=input.jwt)

    if (user is None):
        return models.AuthJwtOutput.parse_obj({"email": "", "error": "Invalid JWT."})
    
    return models.AuthJwtOutput.parse_obj({"email": user.email, "error": None})



# @ app.post("/get_data/", response_model=models.GetDataOutput)
# async def get_data(input: models.GetDataInput):
#     user = await my_auth_class.auth_jwt_string(raw_jwt_string=input.jwt)

#     if (user is None):
#         return models.GetDataOutput.parse_obj({"result": None, "error": "Invalid JWT."})
    
#     return models.GetDataOutput.parse_obj({"result": "Hello, " + user.email + "!", "error": None})


def start_grpc_service():
    print("\n\n" + "grpc service is running on: 127.0.0.1:40052" + "\n\n")

    loop = asyncio.get_event_loop()
    loop.run_until_complete(run_service(port=40052, my_o365=my_o365, my_authentication_class=my_auth_class))


def start_restful_service():
    # port = sys.argv[-1]
    # if port.isdigit():
    #     port = int(port)
    # else:
    #     port = 40051

    # while utils.is_port_in_use(port):
    #     port += 1

    # print(f"\n\n\nThe service is running on: http://localhost:{port}\n\n")

    # uvicorn.run("src.main:app", host="127.0.0.1",
    #             port=port, debug=True, reload=True, workers=8)

    port = 40051

    #print(f"\n\n\nThe service is running on: http://localhost:{port}\n\n")

    uvicorn.run("src.main:app", 
                host="127.0.0.1",
                port=port, 
                debug=True, reload=True, workers=8)


def start():
    # launch with: poetry run dev

    process_1 = multiprocessing.Process(target=start_grpc_service)
    process_2 = multiprocessing.Process(target=start_restful_service)

    process_1.start()
    process_2.start()

    # Wait processes to complete
    process_1.join()
    process_2.join()