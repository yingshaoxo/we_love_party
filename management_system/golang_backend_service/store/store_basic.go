package store

import (
	"os"
)

type EnvironmentVariables struct {
	Postgres_sql_host     string
	Postgres_sql_user     string
	Postgres_sql_password string
}

var Environment_variables EnvironmentVariables = EnvironmentVariables{
	Postgres_sql_host:     "127.0.0.1",
	Postgres_sql_user:     "yingshaoxo",
	Postgres_sql_password: "yingshaoxo",
}

func Init() {
	Postgres_sql_host := os.Getenv("postgres_sql_host")
	Postgres_sql_user := os.Getenv("postgres_sql_user")
	Postgres_sql_password := os.Getenv("postgres_sql_password")

	if len(Postgres_sql_host) > 0 {
		Environment_variables.Postgres_sql_host = Postgres_sql_host
	}
	if len(Postgres_sql_user) > 0 {
		Environment_variables.Postgres_sql_user = Postgres_sql_user
	}
	if len(Postgres_sql_password) > 0 {
		Environment_variables.Postgres_sql_password = Postgres_sql_password
	}
}
