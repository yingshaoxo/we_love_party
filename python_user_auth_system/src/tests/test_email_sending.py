import pytest

from src import config
from src import utils

myO365 = utils.MyO365(config.O365_credentials)

@pytest.mark.asyncio
async def test_email_sending():
    myO365.send_email("yingshaoxo@gmail.com", "hi", "I'm your friend.<br><br>---yingshaoxo")