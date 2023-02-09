from pydoc import cli
import pytest

from src import config
from src.database.postgre_sql_db import My_PostgreSQL_DB


my_PostgreSQL_DB = My_PostgreSQL_DB(postgresql_server_address=config.POSTGRESQL_DB_URL)
client = my_PostgreSQL_DB.client


async def startup() -> None:
    if not client.is_connected:
        await client.connect()

async def shutdown() -> None:
    if client.is_connected:
        await client.disconnect()


@pytest.mark.asyncio
async def test_getting_function():
    await startup()

    result = await my_PostgreSQL_DB.client.fetch_all(query=r"""
SELECT * from "user";
    """.strip(), values=None)
    print(dict(**result[0])) # type: ignore

    await shutdown()