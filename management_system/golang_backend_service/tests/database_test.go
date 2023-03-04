package tests

import (
	"context"
	"fmt"
	"os"
	"testing"
	"time"

	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/database"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/generated_grpc/management_service"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/store"
)

var my_context context.Context
var cancel context.CancelFunc

var fuckTheDatabaseClass database.FuckTheDatabaseClass

func TestMain(m *testing.M) {
	my_context, cancel = context.WithTimeout(context.Background(), 10000*time.Second)
	defer cancel()

	store.Init()
	fuckTheDatabaseClass = database.FuckTheDatabaseClass{}
	fmt.Println("database initialized")
	defer func() {
	}()

	code := m.Run()
	fmt.Printf("the code of TestMain returns: %v", code)

	os.Exit(code)
}

func Test_database_connection(t *testing.T) {
	fuckTheDatabaseClass.Test()
}

func Test_get_all_users(t *testing.T) {
	request := management_service.GetUsersRequest{
		PageNumber: 0,
		PageSize:   10,
	}

	response := fuckTheDatabaseClass.Get_all_user_data(&request)

	for _, user := range response.User {
		println(*user.Username)
	}
}
