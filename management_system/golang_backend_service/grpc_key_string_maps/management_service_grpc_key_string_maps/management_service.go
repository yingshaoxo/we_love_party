package management_service_grpc_key_string_maps


var GetUsersRequest = struct {
    Page_size    string
    Page_number    string

    Column_key_list__    []string
} {
    Page_size:    "page_size",
    Page_number:    "page_number",

    Column_key_list__:    []string{
        "page_size",
        "page_number",
    },
}


var GetUsersResponse = struct {
    Error    string
    User    string

    Column_key_list__    []string
} {
    Error:    "error",
    User:    "user",

    Column_key_list__:    []string{
        "error",
        "user",
    },
}


var AddPlaceRequest = struct {
    Location_of_free_map    string

    Column_key_list__    []string
} {
    Location_of_free_map:    "location_of_free_map",

    Column_key_list__:    []string{
        "location_of_free_map",
    },
}


var AddPlaceResponse = struct {
    Error    string
    Success    string

    Column_key_list__    []string
} {
    Error:    "error",
    Success:    "success",

    Column_key_list__:    []string{
        "error",
        "success",
    },
}


var UpdatePlaceRequest = struct {
    Location_of_free_map    string

    Column_key_list__    []string
} {
    Location_of_free_map:    "location_of_free_map",

    Column_key_list__:    []string{
        "location_of_free_map",
    },
}


var UpdatePlaceResponse = struct {
    Error    string
    Success    string

    Column_key_list__    []string
} {
    Error:    "error",
    Success:    "success",

    Column_key_list__:    []string{
        "error",
        "success",
    },
}


var DeletePlaceRequest = struct {
    Location_id    string

    Column_key_list__    []string
} {
    Location_id:    "location_id",

    Column_key_list__:    []string{
        "location_id",
    },
}


var DeletePlaceResponse = struct {
    Error    string
    Success    string

    Column_key_list__    []string
} {
    Error:    "error",
    Success:    "success",

    Column_key_list__:    []string{
        "error",
        "success",
    },
}


var UserModel = struct {
    Email    string
    Username    string
    Head_image    string
    Sex    string
    Age    string

    Column_key_list__    []string
} {
    Email:    "email",
    Username:    "username",
    Head_image:    "head_image",
    Sex:    "sex",
    Age:    "age",

    Column_key_list__:    []string{
        "email",
        "username",
        "head_image",
        "sex",
        "age",
    },
}


var LocationOfFreeMap = struct {
    Location_id    string
    Uploader_email    string
    Name    string
    Y_latitude    string
    X_longitude    string
    Scores    string
    Open_all_day    string
    Has_charger    string
    Has_wifi    string
    Has_water    string
    Has_hot_water    string
    Has_desk    string
    Has_chair    string
    Has_toilet    string
    Has_showering    string
    Has_package_receiving_station    string
    Has_kfc    string
    Has_mcdonald    string
    Has_store    string
    Open_and_close_time    string

    Column_key_list__    []string
} {
    Location_id:    "location_id",
    Uploader_email:    "uploader_email",
    Name:    "name",
    Y_latitude:    "y_latitude",
    X_longitude:    "x_longitude",
    Scores:    "scores",
    Open_all_day:    "open_all_day",
    Has_charger:    "has_charger",
    Has_wifi:    "has_wifi",
    Has_water:    "has_water",
    Has_hot_water:    "has_hot_water",
    Has_desk:    "has_desk",
    Has_chair:    "has_chair",
    Has_toilet:    "has_toilet",
    Has_showering:    "has_showering",
    Has_package_receiving_station:    "has_package_receiving_station",
    Has_kfc:    "has_kfc",
    Has_mcdonald:    "has_mcdonald",
    Has_store:    "has_store",
    Open_and_close_time:    "open_and_close_time",

    Column_key_list__:    []string{
        "location_id",
        "uploader_email",
        "name",
        "y_latitude",
        "x_longitude",
        "scores",
        "open_all_day",
        "has_charger",
        "has_wifi",
        "has_water",
        "has_hot_water",
        "has_desk",
        "has_chair",
        "has_toilet",
        "has_showering",
        "has_package_receiving_station",
        "has_kfc",
        "has_mcdonald",
        "has_store",
        "open_and_close_time",
    },
}