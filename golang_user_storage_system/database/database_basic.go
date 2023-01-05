package database

import (
	"fmt"

	"gorm.io/driver/postgres"

	"gorm.io/gorm"
	"gorm.io/gorm/schema"

	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/store"
)

type User struct {
	gorm.Model
	Email      string
	Password   string
	Username   string
	Head_image string //base64 string of an image
	Sex        int32  //AI detect. 0: female, 1: male
	Age        int32  //AI detect.
}

func Get_postgres_sql_database() *gorm.DB {
	dsn := fmt.Sprintf(
		"host=%s user=%s password=%s dbname=postgres port=5432 sslmode=disable",
		store.Environment_variables.Postgres_sql_host,
		store.Environment_variables.Postgres_sql_user,
		store.Environment_variables.Postgres_sql_password,
	)
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{
		NamingStrategy: schema.NamingStrategy{
			TablePrefix:   "",   // table name prefix, table for `User` would be `t_users`
			SingularTable: true, // use singular table name, table for `User` would be `user` with this option enabled
			NoLowerCase:   false,
		},
	})
	if err != nil {
		panic("failed to connect database")
	}
	db.AutoMigrate(&User{})
	return db
}

func Add_a_new_user(db *gorm.DB, user *User) error {
	// user := UserInDatabase{Chat_id: chat_id, User_id: user_id, Verified: verified, Register_time: timestamp_string}

	operation_result := db.Create(user)
	return operation_result.Error
}
