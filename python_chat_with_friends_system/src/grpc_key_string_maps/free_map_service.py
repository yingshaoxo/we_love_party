
from typing import List

class SearchPlacesRequest:
    key_words: str = "key_words"
    y_latitude: str = "y_latitude"
    x_longitude: str = "x_longitude"
    page_size: str = "page_size"
    page_number: str = "page_number"
    __property_list__: List[str] = ["key_words", "y_latitude", "x_longitude", "page_size", "page_number"]

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

class SearchPlacesResponse:
    error: str = "error"
    location_of_free_map: str = "location_of_free_map"
    __property_list__: List[str] = ["error", "location_of_free_map"]

class AddPlaceRequest:
    location_of_free_map: str = "location_of_free_map"
    __property_list__: List[str] = ["location_of_free_map"]

class AddPlaceResponse:
    error: str = "error"
    success: str = "success"
    __property_list__: List[str] = ["error", "success"]

class UpdatePlaceRequest:
    location_of_free_map: str = "location_of_free_map"
    __property_list__: List[str] = ["location_of_free_map"]

class UpdatePlaceResponse:
    error: str = "error"
    success: str = "success"
    __property_list__: List[str] = ["error", "success"]

class DeletePlaceRequest:
    location_id: str = "location_id"
    __property_list__: List[str] = ["location_id"]

class DeletePlaceResponse:
    error: str = "error"
    success: str = "success"
    __property_list__: List[str] = ["error", "success"]