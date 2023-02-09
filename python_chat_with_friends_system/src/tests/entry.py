import asyncio
import src.config as config

async def async_function():
    pass

def main():
    # loop = asyncio.get_event_loop()
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    loop.run_until_complete(async_function())