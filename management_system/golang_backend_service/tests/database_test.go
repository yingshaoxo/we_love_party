package tests

import (
	"context"
	"fmt"
	"os"
	"testing"
	"time"

	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/database"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/store"
)

// var postgres_sql_database *gorm.DB
var my_context context.Context
var cancel context.CancelFunc

// var postgres_sql_database *sql.DB
var fuckTheDatabaseClass database.FuckTheDatabaseClass

func TestMain(m *testing.M) {
	my_context, cancel = context.WithTimeout(context.Background(), 10000*time.Second)
	defer cancel()

	store.Init()
	fuckTheDatabaseClass = database.FuckTheDatabaseClass{
		// Postgres_sql: postgres_sql_database,
	}
	fuckTheDatabaseClass.Init()
	// defer fuckTheDatabaseClass.End()
	fmt.Println("database initialized")
	defer func() {
	}()

	code := m.Run()
	fmt.Printf("the code of TestMain returns: %v", code)

	// disk_tool.Remove_a_file_or_folder("test.db")
	os.Exit(code)
}

func Test_create_a_user(t *testing.T) {
	fuckTheDatabaseClass.Print_all_data_in_a_table("user")
}

// func Test_if_database_exists(t *testing.T) {
// 	result := terminal_tool.Run_command("ls -l")

// 	// built_in_functions.Print(result)
// 	if !strings.Contains(result, "test.db") {
// 		t.Fatalf("There should have a file called 'test.db'")
// 	}
// }
