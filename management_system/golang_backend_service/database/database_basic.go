package database

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq" // add this

	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/generated_grpc/management_service"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/grpc_key_string_maps/management_service_grpc_key_string_maps"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/store"
)

type FuckTheDatabaseClass struct {
}

type TestUser struct {
	Email      string
	Username   *string
	Head_image *string //base64 string of an image
	Sex        *int32  //AI detect. 0: female, 1: male
	Age        *int32  //AI detect.
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

func (self FuckTheDatabaseClass) Get_database_connection(database_name string) (sql.DB, error) {
	postgres_sql_information := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		store.Environment_variables.Postgres_sql_host, 5432,
		store.Environment_variables.Postgres_sql_user, store.Environment_variables.Postgres_sql_password,
		database_name)
	db, err := sql.Open("postgres", postgres_sql_information)

	return *db, err
}

func (self FuckTheDatabaseClass) Test() error {
	db, err := self.Get_database_connection(store.Database_Name_Dict.Postgres)
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
	db, err := self.Get_database_connection(store.Database_Name_Dict.Postgres)
	defer db.Close()
	if err != nil {
		log.Fatal(err)
	}

	rows, err := db.Query(
		fmt.Sprintf(`
			SELECT * FROM "user"
			LIMIT %v
			OFFSET %v
		`,
			request.PageSize,
			request.PageNumber*request.PageSize))
	defer rows.Close()
	if err != nil {
		log.Fatal(err)
	}

	error_string := "unknown error"

	response := management_service.GetUsersResponse{}
	response.Error = &error_string

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
