import databases

class My_PostgreSQL_DB:
    # https://www.encode.io/databases/database_queries/#:~:text=behind%20the%20scenes.-,Raw%20queries,-In%20addition%20to
    def __init__(self, postgresql_server_address: str="postgresql://yingshaoxo:yingshaoxo@localhost:5432/"):
        self.client = databases.Database(postgresql_server_address)