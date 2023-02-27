package database

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq" // add this

	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/store"
)

type FuckTheDatabaseClass struct {
	Postgres_sql *sql.DB
}

type TestUser struct {
	Email      string
	Username   *string
	Head_image *string //base64 string of an image
	Sex        *int32  //AI detect. 0: female, 1: male
	Age        *int32  //AI detect.
}

func (self FuckTheDatabaseClass) Init() error {
	postgres_sql_information := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		store.Environment_variables.Postgres_sql_host, 5432,
		store.Environment_variables.Postgres_sql_user, store.Environment_variables.Postgres_sql_password,
		"postgres")
	db, err := sql.Open("postgres", postgres_sql_information)
	if err != nil {
		log.Fatal(err)
	}

	self.Postgres_sql = db
	//*self.Postgres_sql = *db

	return err
}

func (self FuckTheDatabaseClass) End() error {
	err := self.Postgres_sql.Close()
	return err
}

func (self FuckTheDatabaseClass) Print_all_data_in_a_table(table_name string) error {
	user := TestUser{}

	err := self.Postgres_sql.QueryRow("SELECT 'yingshaoxo', NULL").Scan(&user.Username, &user.Age)

	log.Println(user.Username)
	log.Println(user.Age)

	return err
}
