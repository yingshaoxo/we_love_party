package database

import (
	"database/sql"
	"fmt"
	"log"
	"reflect"
	"strings"

	_ "github.com/lib/pq" // add this

	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/generated_grpc/management_service"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/grpc_key_string_maps/management_service_grpc_key_string_maps"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/store"

	gopython_database "github.com/yingshaoxo/gopython/database"
	"github.com/yingshaoxo/gopython/string_tool"
)

var REDIS_VERIFY_ACTION_KEY string = "verify"
var REDIS_JWT_ACTION_KEY string = "jwt"
var REDIS_IS_ONLINE_ACTION_KEY string = "online"

var JWT_SECRET = "secret is a secret"

type FuckTheDatabaseClass struct {
	My_redis gopython_database.MyRedis_Type
}

type TestUser struct {
	Email      string
	Username   *string
	Head_image *string //base64 string of an image
	Sex        *int32  //AI detect. 0: female, 1: male
	Age        *int32  //AI detect.
}

func Get_database_connection(database_name string) (sql.DB, error) {
	postgres_sql_information := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		store.Environment_variables.Postgres_sql_host, 5432,
		store.Environment_variables.Postgres_sql_user, store.Environment_variables.Postgres_sql_password,
		database_name)
	db, err := sql.Open("postgres", postgres_sql_information)

	return *db, err
}

func Get_my_redis() gopython_database.MyRedis_Type {
	return gopython_database.MyRedis(
		store.Environment_variables.Redis_host,
		store.Environment_variables.Redis_port,
		store.Environment_variables.Redis_db_number,
	)
}

func Golang_data_type_to_sql_data_type_function(it interface{}) string {
	if reflect.TypeOf(it).Kind() == reflect.String {
		return fmt.Sprintf("'%s'", it)
	}

	if reflect.TypeOf(it).Kind() == reflect.Float64 {
		return fmt.Sprintf("%.6f", it)
	}

	if reflect.TypeOf(it).Kind() == reflect.Float32 {
		return fmt.Sprintf("%.6f", it)
	}

	if reflect.TypeOf(it).Kind() == reflect.Int64 {
		return string_tool.Int64_to_string(it.(int64))
	}

	if reflect.TypeOf(it).Kind() == reflect.Int32 {
		return string_tool.Int32_to_string(it.(int32))
	}

	if reflect.TypeOf(it).Kind() == reflect.Int {
		return string_tool.Int_to_string(it.(int))
	}

	if reflect.TypeOf(it).Kind() == reflect.Bool {
		if it == true {
			return "TRUE"
		} else {
			return "FALSE"
		}
	}

	return it.(string)
}

func SQL_query_result_to_a_dict(list *sql.Rows) (rows []map[string]interface{}) {
	fields, _ := list.Columns()
	result_rows := make([]map[string]interface{}, 0)

	for list.Next() {
		scans := make([]interface{}, len(fields))
		row := make(map[string]interface{})

		for i := range scans {
			scans[i] = &scans[i]
		}
		list.Scan(scans...)
		for i, v := range scans {
			// var value = ""
			// if v != nil {
			// 	value = fmt.Sprintf("%v", v)
			// }
			// row[fields[i]] = value
			row[fields[i]] = v
		}
		result_rows = append(result_rows, row)
	}

	return result_rows
}

func (self FuckTheDatabaseClass) Test() error {
	db, err := Get_database_connection(store.Database_Name_Dict.Postgres)
	defer db.Close()
	if err != nil {
		log.Fatal(err)
	}

	user := TestUser{}
	db.QueryRow("SELECT 'yingshaoxo', NULL").Scan(&user.Username, &user.Age)
	log.Println(*user.Username)
	log.Println(user.Age)

	return nil
}

func (self FuckTheDatabaseClass) Get_all_user_data(request *management_service.GetUsersRequest) management_service.GetUsersResponse {
	response := management_service.GetUsersResponse{}
	error_string := "unknown error"
	response.Error = &error_string

	db, err := Get_database_connection(store.Database_Name_Dict.Postgres)
	defer db.Close()
	if err != nil {
		log.Println(err)

		error_string = err.Error()
		response.Error = &error_string
		return response
	}

	rows, err := db.Query(
		fmt.Sprintf(`
			SELECT * FROM "%s"
			LIMIT %v
			OFFSET %v
		`,
			store.Database_Table_Name_Dict.User,
			request.PageSize,
			request.PageNumber*request.PageSize,
		),
	)
	defer rows.Close()
	if err != nil {
		log.Println(err)

		error_string = err.Error()
		response.Error = &error_string
		return response
	}

	result := SQL_query_result_to_a_dict(rows)
	for _, item := range result {
		username := item[management_service_grpc_key_string_maps.UserModel.Username].(string)
		sex := int32(item[management_service_grpc_key_string_maps.UserModel.Sex].(int64))
		age := int32(item[management_service_grpc_key_string_maps.UserModel.Age].(int64))
		head_image := item[management_service_grpc_key_string_maps.UserModel.Head_image].(string)
		response.User = append(response.User,
			&management_service.UserModel{
				Email:     item[management_service_grpc_key_string_maps.UserModel.Email].(string),
				Username:  &username,
				Sex:       &sex,
				Age:       &age,
				HeadImage: &head_image,
			},
		)
	}

	response.Error = nil
	return response
}

// func (self FuckTheDatabaseClass) Is_jwt_ok(jwt_string string) bool {
// 	data, _ := gopython_jwt.Jwt_decode(jwt_string, JWT_SECRET)
// 	email := data["email"]

// 	key := fmt.Sprintf("%s.%s", email, REDIS_VERIFY_ACTION_KEY)

// 	_, err := self.My_redis.Get(key)
// 	if err != nil {
// 		return false
// 	} else {
// 		return true
// 	}
// }

// func (self FuckTheDatabaseClass) Is_admin(jwt_string string) bool {
// 	data, _ := gopython_jwt.Jwt_decode(jwt_string, JWT_SECRET)
// 	email := data["email"]

// 	key := fmt.Sprintf("%s.%s", email, REDIS_VERIFY_ACTION_KEY)

// 	_, err := self.My_redis.Get(key)
// 	if err != nil {
// 		return false
// 	} else {
// 		if email == "yingshaoxo@gmail.com" {
// 			return true
// 		} else {
// 			return false
// 		}
// 	}
// }

func (self FuckTheDatabaseClass) Search_places(request *management_service.SearchPlacesRequest) management_service.SearchPlacesResponse {
	response := management_service.SearchPlacesResponse{}
	error_string := "unknown error"
	response.Error = &error_string

	db, err := Get_database_connection(store.Database_Name_Dict.Free_map)
	defer db.Close()
	if err != nil {
		log.Println(err)

		error_string = err.Error()
		response.Error = &error_string
		return response
	}

	keyword_string := strings.TrimSpace(request.KeyWords)
	keyword_list := strings.Split(keyword_string, " ")
	where_command_list := make([]string, 0)
	for _, keyword := range keyword_list {
		new_keyword := strings.TrimSpace(keyword)
		if len(new_keyword) >= 1 {
			where_command_list = append(where_command_list,
				management_service_grpc_key_string_maps.LocationOfFreeMap.Name+" LIKE "+"'%"+keyword+"%'",
			)
		}
	}
	var where_command string = strings.Join(where_command_list, " AND ")

	var sql_command = ""
	if len(where_command) == 0 {
		sql_command =
			fmt.Sprintf(`
			WITH free_map_with_distance AS (
				SELECT *, point(%s,%s)<->point(%s, %s) AS distance
				FROM (
					SELECT * from %s.public.%s
				) the_final_free_map
			)
			SELECT * FROM free_map_with_distance
			ORDER BY free_map_with_distance.distance ASC
			LIMIT %s
			OFFSET %s
			;
			`,
				management_service_grpc_key_string_maps.LocationOfFreeMap.Y_latitude,
				management_service_grpc_key_string_maps.LocationOfFreeMap.X_longitude,
				string_tool.Float64_to_string(request.YLatitude, 6),
				string_tool.Float64_to_string(request.XLongitude, 6),
				store.Database_Name_Dict.Free_map,
				store.Database_Table_Name_Dict.Final_free_map,
				string_tool.Int32_to_string(request.PageSize),
				string_tool.Int32_to_string(request.PageNumber*request.PageSize),
			)
	} else {
		sql_command =
			fmt.Sprintf(`
			WITH free_map_with_distance AS (
				SELECT *, point(%s,%s)<->point(%s, %s) AS distance
				FROM (
					SELECT * from %s.public.%s
					WHERE %s
				) the_final_free_map
			)
			SELECT * FROM free_map_with_distance
			ORDER BY free_map_with_distance.distance ASC
			LIMIT %s
			OFFSET %s
			;
			`,
				management_service_grpc_key_string_maps.LocationOfFreeMap.Y_latitude,
				management_service_grpc_key_string_maps.LocationOfFreeMap.X_longitude,
				string_tool.Float64_to_string(request.YLatitude, 6),
				string_tool.Float64_to_string(request.XLongitude, 6),
				store.Database_Name_Dict.Free_map,
				store.Database_Table_Name_Dict.Final_free_map,
				where_command,
				string_tool.Int32_to_string(request.PageSize),
				string_tool.Int32_to_string(request.PageNumber*request.PageSize),
			)
	}

	rows, err := db.Query(
		sql_command,
	)
	defer rows.Close()
	if err != nil {
		log.Println(err)

		error_string = err.Error()
		response.Error = &error_string
		return response
	}

	result := SQL_query_result_to_a_dict(rows)
	for _, item := range result {
		location_id := int32(item[management_service_grpc_key_string_maps.LocationOfFreeMap.Location_id].(int64))

		response.LocationOfFreeMap = append(response.LocationOfFreeMap,
			&management_service.LocationOfFreeMap{
				LocationId:                 &location_id,
				UploaderEmail:              nil,
				Name:                       item[management_service_grpc_key_string_maps.LocationOfFreeMap.Name].(string),
				YLatitude:                  string_tool.StringBytes_to_float64(item[management_service_grpc_key_string_maps.LocationOfFreeMap.Y_latitude].([]byte), 0),
				XLongitude:                 string_tool.StringBytes_to_float64(item[management_service_grpc_key_string_maps.LocationOfFreeMap.X_longitude].([]byte), 0),
				Scores:                     string_tool.StringBytes_to_float64(item[management_service_grpc_key_string_maps.LocationOfFreeMap.Scores].([]byte), 2.5),
				OpenAllDay:                 item[management_service_grpc_key_string_maps.LocationOfFreeMap.Open_all_day].(bool),
				HasCharger:                 item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_charger].(bool),
				HasWifi:                    item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_wifi].(bool),
				HasWater:                   item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_water].(bool),
				HasHotWater:                item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_hot_water].(bool),
				HasDesk:                    item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_desk].(bool),
				HasChair:                   item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_chair].(bool),
				HasToilet:                  item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_toilet].(bool),
				HasShowering:               item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_showering].(bool),
				HasPackageReceivingStation: item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_package_receiving_station].(bool),
				HasKfc:                     item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_kfc].(bool),
				HasMcdonald:                item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_mcdonald].(bool),
				HasStore:                   item[management_service_grpc_key_string_maps.LocationOfFreeMap.Has_store].(bool),
			},
		)
	}

	response.Error = nil
	return response
}

func (self FuckTheDatabaseClass) Add_place(request *management_service.AddPlaceRequest) management_service.AddPlaceResponse {
	response := management_service.AddPlaceResponse{}
	error_string := "unknown error"
	response.Error = &error_string

	db, err := Get_database_connection(store.Database_Name_Dict.Free_map)
	defer db.Close()
	if err != nil {
		log.Println(err)

		error_string = err.Error()
		response.Error = &error_string
		return response
	}

	column_key_list := []string{
		management_service_grpc_key_string_maps.LocationOfFreeMap.Name,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Y_latitude,
		management_service_grpc_key_string_maps.LocationOfFreeMap.X_longitude,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Scores,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Open_all_day,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_charger,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_wifi,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_water,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_hot_water,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_desk,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_chair,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_toilet,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_showering,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_package_receiving_station,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_kfc,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_mcdonald,
		management_service_grpc_key_string_maps.LocationOfFreeMap.Has_store,
	}
	column_key_list_text := strings.Join(column_key_list, ", ")

	column_value_list_1 := []interface{}{
		request.LocationOfFreeMap.Name,
		request.LocationOfFreeMap.YLatitude,
		request.LocationOfFreeMap.XLongitude,
		fmt.Sprintf("%.1f", request.LocationOfFreeMap.Scores),
		request.LocationOfFreeMap.OpenAllDay,
		request.LocationOfFreeMap.HasCharger,
		request.LocationOfFreeMap.HasWifi,
		request.LocationOfFreeMap.HasWater,
		request.LocationOfFreeMap.HasHotWater,
		request.LocationOfFreeMap.HasDesk,
		request.LocationOfFreeMap.HasChair,
		request.LocationOfFreeMap.HasToilet,
		request.LocationOfFreeMap.HasShowering,
		request.LocationOfFreeMap.HasPackageReceivingStation,
		request.LocationOfFreeMap.HasKfc,
		request.LocationOfFreeMap.HasMcdonald,
		request.LocationOfFreeMap.HasStore,
	}
	column_value_list_2 := make([]string, 0)
	for _, value := range column_value_list_1 {
		column_value_list_2 = append(column_value_list_2,
			Golang_data_type_to_sql_data_type_function(value),
		)
	}
	column_value_list_text := strings.Join(column_value_list_2, ", ")

	_, err = db.Exec(
		fmt.Sprintf(`
			INSERT INTO %s(%s)
			VALUES(%s);
		`,
			store.Database_Table_Name_Dict.Final_free_map,
			column_key_list_text,
			column_value_list_text,
		),
	)
	if err != nil {
		log.Println(err)

		error_string = err.Error()
		response.Error = &error_string
		return response
	}

	response.Error = nil
	return response
}

func (self FuckTheDatabaseClass) Delete_place(request *management_service.DeletePlaceRequest) management_service.DeletePlaceResponse {
	response := management_service.DeletePlaceResponse{}
	error_string := "unknown error"
	response.Error = &error_string

	db, err := Get_database_connection(store.Database_Name_Dict.Free_map)
	defer db.Close()
	if err != nil {
		log.Println(err)

		error_string = err.Error()
		response.Error = &error_string
		return response
	}

	_, err = db.Exec(
		fmt.Sprintf(`
		DELETE FROM %s.public.%s
		WHERE 
			location_id = %s 
		;
		`,
			store.Database_Name_Dict.Free_map,
			store.Database_Table_Name_Dict.Final_free_map,
			Golang_data_type_to_sql_data_type_function(request.LocationId),
		),
	)
	if err != nil {
		log.Println(err)

		error_string = err.Error()
		response.Error = &error_string
		return response
	}

	response.Error = nil
	return response
}
