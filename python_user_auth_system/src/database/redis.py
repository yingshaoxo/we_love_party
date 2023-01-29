from typing import Optional
import redis

class MyRedis:
    def __init__(self, redis_host_URL: str = 'localhost', db_number=0) -> None:
        self.redis = redis.Redis(host=redis_host_URL, port=6379, db=db_number)
    
    def get(self, key: str) -> Optional[str]:
        data = self.redis.get(key)
        if data is None:
            return None
        else:
            return data.decode('utf-8')

    def set(self, key: str, value: str, expire_time_in_seconds: float | None = None) -> bool:
        result = self.redis.set(key, value, ex=expire_time_in_seconds)
        if result is None:
            return False
        else:
            return result
    
    def delete(self, key: str) -> bool:
        result = self.redis.delete(key)
        if result is None:
            return False
        else:
            return True
    
    def delete_all(self):
        for key in self.redis.keys('*'):
            self.redis.delete(key)