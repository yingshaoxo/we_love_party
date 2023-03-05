package store

import (
	"os"
)

var Environment_variables = struct {
	Postgres_sql_host     string
	Postgres_sql_user     string
	Postgres_sql_password string
	Redis_host            string
	Redis_port            string
	Redis_db_number       string
}{
	Postgres_sql_host:     "127.0.0.1",
	Postgres_sql_user:     "yingshaoxo",
	Postgres_sql_password: "yingshaoxo",
	Redis_host:            "127.0.0.1",
	Redis_port:            "6379",
	Redis_db_number:       "1",
}

func Init() {
	Postgres_sql_host := os.Getenv("postgres_sql_host")
	Postgres_sql_user := os.Getenv("postgres_sql_user")
	Postgres_sql_password := os.Getenv("postgres_sql_password")
	Redis_host := os.Getenv("redis_host")
	Redis_port := os.Getenv("redis_port")
	Redis_db_number := os.Getenv("redis_db_number")

	if len(Postgres_sql_host) > 0 {
		Environment_variables.Postgres_sql_host = Postgres_sql_host
	}
	if len(Postgres_sql_user) > 0 {
		Environment_variables.Postgres_sql_user = Postgres_sql_user
	}
	if len(Postgres_sql_password) > 0 {
		Environment_variables.Postgres_sql_password = Postgres_sql_password
	}
	if len(Redis_host) > 0 {
		Environment_variables.Redis_host = Redis_host
	}
	if len(Redis_port) > 0 {
		Environment_variables.Redis_port = Redis_port
	}
	if len(Redis_db_number) > 0 {
		Environment_variables.Redis_db_number = Redis_db_number
	}
}

var Database_Name_Dict = struct {
	Postgres string
	Free_map string
}{
	Postgres: "postgres",
	Free_map: "free_map",
}

var Database_Table_Name_Dict = struct {
	User           string
	Free_map       string
	Final_free_map string
}{
	User:           "user",
	Free_map:       "free_map",
	Final_free_map: "final_free_map",
}

/*
{
	postgres: {
		user
	}

	free_map: {
		free_map,
		final_free_map
	}
}
*/
