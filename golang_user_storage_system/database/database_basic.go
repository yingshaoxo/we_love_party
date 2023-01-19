package database

import (
	"errors"
	"fmt"

	"gorm.io/driver/postgres"

	"gorm.io/gorm"
	"gorm.io/gorm/schema"

	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/store"
)

type User struct {
	gorm.Model
	Email      string
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

func Get_a_user(db *gorm.DB, email string) (User, error) {
	var user_list []User
	var the_user User

	operation_result := db.Where("email = ?", email).Find(&user_list)
	if operation_result.Error != nil {
		return the_user, operation_result.Error
	}

	if len(user_list) == 0 {
		return the_user, errors.New("not found")
	}

	the_user = user_list[0]

	return the_user, nil
}
