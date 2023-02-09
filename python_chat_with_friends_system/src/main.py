import os
import sys
cur_path=os.path.abspath(os.path.dirname(__file__))
sys.path.insert(0, cur_path+"/..")

import asyncio
import multiprocessing

# from src.grpc_service import run_service
# from func_timeout import func_timeout, FunctionTimedOut

from src import config
# from src import utils
# from src import models


mongo_db_url = os.getenv("MONGO_DB_URL")
if mongo_db_url:
    config.MONGO_DB_URL = mongo_db_url

postgresql_db_url = os.getenv("POSTGRESQL_DB_URL")
if postgresql_db_url:
    config.POSTGRESQL_DB_URL = postgresql_db_url


def start_grpc_service():
    print("\n\n" + "grpc service is running on: 127.0.0.1:40056" + "\n\n")

    loop = asyncio.get_event_loop()
    # loop.run_until_complete(run_service(host="0.0.0.0", port=40056))

    # async def fake_function():
    #     i = 0
    #     while True:
    #         i += 1
    #         print(i)
    #         if i > 1000:
    #             i = 0
    #         await asyncio.sleep(1)

    # loop.run_until_complete(fake_function())


def start():
    # launch with: poetry run dev

    process_1 = multiprocessing.Process(target=start_grpc_service)

    process_1.start()

    # Wait processes to complete
    process_1.join()


if __name__ == '__main__':
    start()