from typing import Optional
import databases
import sqlalchemy

import src.models as models


class MyDatabase:
    def __init__(self, DATABASE_URL: str) -> None:
        self.database = databases.Database(DATABASE_URL)
        self.metadata = sqlalchemy.MetaData()

        self.users_table = sqlalchemy.Table(
            "users",
            self.metadata,
            sqlalchemy.Column("id", sqlalchemy.Integer, primary_key=True),
            sqlalchemy.Column("email", sqlalchemy.String),
            sqlalchemy.Column("username", sqlalchemy.String),
            sqlalchemy.Column("pictureid", sqlalchemy.String),
        )

        self.engine = sqlalchemy.create_engine(
            DATABASE_URL, connect_args={"check_same_thread": False}
        )

        self.metadata.create_all(self.engine)

    async def getAUserByEmail(self, email: str) -> Optional[models.User]:
        query = self.users_table.select().where((self.users_table.columns.email == email))
        query = query.compile(compile_kwargs={"literal_binds": True})
        user = await self.database.fetch_one(query=str(query))
        if user is None:
            return None
        return models.User.parse_obj(user)

    async def addAUser(self, aUser: models.User) -> Optional[int]:
        query = self.users_table.insert().values(**aUser.dict())
        query = query.compile(compile_kwargs={"literal_binds": True})
        the_new_user_id = await self.database.execute(query)
        if the_new_user_id is not None:
            return the_new_user_id
        return None
    
    async def updateAUser(self, id: int, aUser: models.User) -> bool:
        old_user = await self.getAUser(id=id)
        if old_user is None:
            return False

        old_user_dict = old_user.dict()
        old_user_dict.update(aUser.dict())

        query = self.users_table.update().where(
            self.users_table.c.id == id
        ).values(**old_user_dict)

        query = query.compile(compile_kwargs={"literal_binds": True})
        return await self.database.execute(query) is not None
    
    async def getAUser(self, id: int) -> Optional[models.User]:
        query = self.users_table.select().where(self.users_table.c.id == id)
        query = query.compile(compile_kwargs={"literal_binds": True})
        user = await self.database.fetch_one(query)
        if user is None:
            return None
        return models.User.parse_obj(user)
    
    async def listUsers(self) -> list[models.User]:
        query = self.users_table.select()
        query = query.compile(compile_kwargs={"literal_binds": True})
        users = await self.database.fetch_all(query)
        return [models.User.parse_obj(user) for user in users]
    
    async def deleteAUser(self, id: int) -> bool:
        query = self.users_table.delete().where(self.users_table.c.id == id)
        query = query.compile(compile_kwargs={"literal_binds": True})
        return await self.database.execute(query) is not None

    async def deleteAllUsers(self) -> bool:
        query = self.users_table.delete()
        query = query.compile(compile_kwargs={"literal_binds": True})
        return await self.database.execute(query) is not None