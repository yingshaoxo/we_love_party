from src import config
from src import utils

myO365 = utils.MyO365(config.O365_credentials)

async def test_send_email():
    myO365.send_email("yingshaoxo@gmail.com", "hi", "i'm your friend.")