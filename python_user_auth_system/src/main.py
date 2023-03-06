import os
import sys

cur_path=os.path.abspath(os.path.dirname(__file__))
sys.path.insert(0, cur_path+"/..")

import asyncio
from datetime import datetime
from socket import timeout
import uvicorn

import multiprocessing
from src.grpc_service import run_service

from fastapi import FastAPI
from fastapi import Request, Response, status
from fastapi.middleware.cors import CORSMiddleware

from func_timeout import func_timeout, FunctionTimedOut

from src import config
from src import utils
from src import models

from src.utils import MyO365
from src.auth import MyAuthClass
from src.database.sqlite import MyDatabase
from src.database.redis import MyRedis
from src.config import ADMIN_EMAIL_LIST


redis_network_name = os.getenv("redis_network_name")
if redis_network_name:
    config.REDIS_HOST_URL = redis_network_name


my_database = MyDatabase(DATABASE_URL=config.DATABASE_URL)
my_redis_1 = MyRedis(redis_host_URL=config.REDIS_HOST_URL, db_number=config.REDIS_DB_NUMBER)
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


@ app.get("/v1/jwt_auth_gateway/", response_model=str)
async def v1_jwt_auth_gateway(request: Request, response: Response):
    print("headers: ", request.headers)
    raw_jwt_string = request.headers.get("jwt", None)
    if raw_jwt_string == None:
        response.status_code = status.HTTP_401_UNAUTHORIZED
    else:
        # response.status_code = status.HTTP_202_ACCEPTED
        # return "ok"
        email = await my_auth_class.auth_jwt_string(raw_jwt_string=raw_jwt_string)
        if (email is None):
            print(f"error: invalid jwt: {raw_jwt_string}")
            response.status_code = status.HTTP_401_UNAUTHORIZED
        else:
            #print(f"success: valid jwt from user: {user.email}")
            response.headers.update({
                "user_email": email
            })
            response.status_code = status.HTTP_202_ACCEPTED
            return "ok"
    return "error"


@ app.get("/v1/admin_jwt_auth_gateway/", response_model=str)
async def v1_admin_jwt_auth_gateway(request: Request, response: Response):
    print("headers: ", request.headers)
    raw_jwt_string = request.headers.get("jwt", None)
    if raw_jwt_string == None:
        response.status_code = status.HTTP_401_UNAUTHORIZED
    else:
        # response.status_code = status.HTTP_202_ACCEPTED
        # return "ok"
        email = await my_auth_class.auth_jwt_string(raw_jwt_string=raw_jwt_string)
        if (email is None):
            print(f"error: invalid jwt: {raw_jwt_string}")
            response.status_code = status.HTTP_401_UNAUTHORIZED
        else:
            if not my_auth_class.check_if_the_user_is_admin(email=email):
                print(f"error: you are not admin according to: {raw_jwt_string}")
                response.status_code = status.HTTP_401_UNAUTHORIZED
            else:
                #print(f"success: valid jwt from user: {user.email}")
                response.headers.update({
                    "user_email": email
                })
                response.status_code = status.HTTP_202_ACCEPTED
                return "ok"
    return "error"


def start_grpc_service():
    print("\n\n" + "grpc service is running on: 127.0.0.1:40052" + "\n\n")

    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    asyncio.run(
        run_service(host="0.0.0.0", port=40052, my_o365=my_o365, my_authentication_class=my_auth_class)
    )


def start_restful_service():
    port = 40051

    #print(f"\n\n\nThe service is running on: http://localhost:{port}\n\n")
    
    uvicorn.run(app=app, # type: ignore #"src.main:app", 
                host="0.0.0.0",
                port=port) 
                # debug=True) #reload=True, workers=8)
                


def start():
    # launch with: poetry run dev

    process_1 = multiprocessing.Process(target=start_grpc_service)
    process_2 = multiprocessing.Process(target=start_restful_service)

    process_1.start()
    process_2.start()

    # Wait processes to complete
    process_1.join()
    process_2.join()


if __name__ == '__main__':
    start()