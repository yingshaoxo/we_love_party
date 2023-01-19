package tests

import (
	"context"
	"fmt"
	"os"
	"testing"
	"time"

	"gorm.io/gorm"
	"gorm.io/gorm/clause"

	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/database"
	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/store"
)

var postgres_sql_database *gorm.DB
var my_context context.Context
var cancel context.CancelFunc

var chat_id string = "11"

func TestMain(m *testing.M) {
	my_context, cancel = context.WithTimeout(context.Background(), 10000*time.Second)
	defer cancel()

	store.Init()
	postgres_sql_database = database.Get_postgres_sql_database()
	fmt.Println("database initialized")
	defer func() {
	}()

	code := m.Run()
	fmt.Printf("the code of TestMain returns: %v", code)

	// disk_tool.Remove_a_file_or_folder("test.db")
	os.Exit(code)
}

// func Test_if_database_exists(t *testing.T) {
// 	result := terminal_tool.Run_command("ls -l")

// 	// built_in_functions.Print(result)
// 	if !strings.Contains(result, "test.db") {
// 		t.Fatalf("There should have a file called 'test.db'")
// 	}
// }

func Test_create_a_user(t *testing.T) {
	user := database.User{
		Email:      "1576570260@qq.com", //"yingshaoxo@gmail.com",
		Username:   "",
		Head_image: "",
		Sex:        -1,
		Age:        -1,
	}
	result := postgres_sql_database.Clauses(clause.OnConflict{DoNothing: true}).Create(&user)
	if result.Error != nil {
		t.Fatalf(result.Error.Error())
	}
}

func Test_update_a_user_info(t *testing.T) {
	user := database.User{
		Email:      "yingshaoxo@gmail.com",
		Username:   "",
		Head_image: "",
		Sex:        -1,
		Age:        -1,
	}

	// result := postgres_sql_database.Clauses(clause.OnConflict{
	// 	Columns: []clause.Column{{Name: "email"}}, // key colume
	// 	// DoUpdates: clause.AssignmentColumns([]string{"name", "age"}), // column needed to be updated
	// 	UpdateAll:   true,
	// }).Create(&user)

	result := postgres_sql_database.Model(&user).Where("email = ?", user.Email).Updates(&user)

	if result.Error != nil {
		t.Fatalf(result.Error.Error())
	}
}

func Test_delete_a_user(t *testing.T) {
	user := database.User{
		Email: "1576570260@qq.com",
	}

	result := postgres_sql_database.Unscoped().Where("email = ?", user.Email).Delete(&user)

	if result.Error != nil {
		t.Fatalf(result.Error.Error())
	}
}

func Test_raw_sql_command(t *testing.T) {
	rows, _ := postgres_sql_database.Raw(`select * from "user" where email = ?`, "yingshaoxo@gmail.com").Rows()
	defer rows.Close()

	var user database.User
	for rows.Next() {
		postgres_sql_database.ScanRows(rows, &user)
		println(user.UpdatedAt.String())
	}
}

// func Test_get_a_user(t *testing.T) {
// 	var user database.User
// 	err := database.Get_a_user(postgres_sql_database, &user, "yingshaoxo@gmail.com")
// 	if err != nil {
// 		fmt.Println(err.Error())
// 	} else {
// 		fmt.Println(user.Email)
// 	}
// }
