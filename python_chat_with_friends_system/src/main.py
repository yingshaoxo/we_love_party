import os
import sys
cur_path=os.path.abspath(os.path.dirname(__file__))
sys.path.insert(0, cur_path+"/..")

import asyncio
import multiprocessing

from src import config
from src.database.mongodb import MyMongoDB
from src.grpc_service import run_service


mongo_db_url = os.getenv("MONGO_DB_URL")
if mongo_db_url:
    config.MONGO_DB_URL = mongo_db_url

postgresql_db_url = os.getenv("POSTGRESQL_DB_URL")
if postgresql_db_url:
    config.POSTGRESQL_DB_URL = postgresql_db_url


def start_grpc_service():
    host="0.0.0.0"
    port=40056

    print("\n\n" + f"grpc service is running on: {host}:{port}" + "\n\n")

    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    asyncio.run(run_service(
            host=host, 
            port=port, 
            myMongoDB=MyMongoDB(mongo_server_address=config.MONGO_DB_URL)
        ))


def start():
    process_1 = multiprocessing.Process(target=start_grpc_service)
    process_1.start()

    # Wait processes to complete
    process_1.join()


if __name__ == '__main__':
    start()