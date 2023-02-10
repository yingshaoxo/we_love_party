
from typing import List

class User:
    email: str = "email"
    username: str = "username"
    head_image: str = "head_image"
    sex: str = "sex"
    age: str = "age"
    __property_list__: List[str] = ["email", "username", "head_image", "sex", "age"]

class LocationOfFreeMap:
    location_id: str = "location_id"
    uploader_email: str = "uploader_email"
    name: str = "name"
    y_latitude: str = "y_latitude"
    x_longitude: str = "x_longitude"
    scores: str = "scores"
    open_all_day: str = "open_all_day"
    has_charger: str = "has_charger"
    has_wifi: str = "has_wifi"
    has_water: str = "has_water"
    has_hot_water: str = "has_hot_water"
    has_desk: str = "has_desk"
    has_chair: str = "has_chair"
    has_toilet: str = "has_toilet"
    has_showering: str = "has_showering"
    has_package_receiving_station: str = "has_package_receiving_station"
    has_kfc: str = "has_kfc"
    has_mcdonald: str = "has_mcdonald"
    has_store: str = "has_store"
    open_and_close_time: str = "open_and_close_time"
    __property_list__: List[str] = ["location_id", "uploader_email", "name", "y_latitude", "x_longitude", "scores", "open_all_day", "has_charger", "has_wifi", "has_water", "has_hot_water", "has_desk", "has_chair", "has_toilet", "has_showering", "has_package_receiving_station", "has_kfc", "has_mcdonald", "has_store", "open_and_close_time"]