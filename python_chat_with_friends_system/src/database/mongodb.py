from pymongo import MongoClient

class MyMongoDB:
    def __init__(self, mongo_server_address: str="mongodb://yingshaoxo:yingshaoxo@127.0.0.1:27017/"):
        self.client = MongoClient(mongo_server_address)