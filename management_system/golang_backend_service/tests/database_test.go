package tests

import (
	"context"
	"fmt"
	"log"
	"os"
	"testing"
	"time"

	"github.com/fmorenovr/gotry"
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
	fuckTheDatabaseClass = database.FuckTheDatabaseClass{
		My_redis: database.Get_my_redis(),
	}
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

// func Test_if_jwt_ok(t *testing.T) {
// 	result := fuckTheDatabaseClass.Is_jwt_ok("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpbmdzaGFveG9AZ21haWwuY29tIiwicmFuZG9tX3N0cmluZyI6IjU1ODQ0OCJ9.kcVthYPI_IL6aD7Mx9KdDCFsAEXvgsxTtAM_dYs5Qko")
// 	log.Println(result)
// }

// func Test_if_it_is_admin(t *testing.T) {
// 	result := fuckTheDatabaseClass.Is_admin("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpbmdzaGFveG9AZ21haWwuY29tIiwicmFuZG9tX3N0cmluZyI6IjU1ODQ0OCJ9.kcVthYPI_IL6aD7Mx9KdDCFsAEXvgsxTtAM_dYs5Qko")
// 	log.Println(result)
// }

func Test_insert_a_position(t *testing.T) {
	uploader_email := "yingshaoxo@gmail.com"
	request := management_service.AddPlaceRequest{
		LocationOfFreeMap: &management_service.LocationOfFreeMap{
			LocationId:                 nil,
			UploaderEmail:              &uploader_email,
			Name:                       "yingshaoxo",
			YLatitude:                  72,
			XLongitude:                 21,
			Scores:                     0.5,
			OpenAllDay:                 true,
			HasCharger:                 true,
			HasWifi:                    true,
			HasWater:                   true,
			HasHotWater:                true,
			HasDesk:                    true,
			HasChair:                   true,
			HasToilet:                  true,
			HasShowering:               true,
			HasPackageReceivingStation: true,
			HasKfc:                     true,
			HasMcdonald:                true,
			HasStore:                   true,
		},
	}

	response := fuckTheDatabaseClass.Add_place(&request)
	log.Println(response.Error)
}

func simple_error_function() error {
	sum := 3
	for i := 1; i < 5; i++ {
		sum -= 1
		s := 2 / sum
		println(s)
	}
	return nil
}

func Test_error_handling(t *testing.T) {
	gotry.Try(func() {
		simple_error_function()
	}).Catch(func(e gotry.Exception) {
		// Print crash
		fmt.Println("Catch ---> exception catched:", e)
	}).Finally(func() {
		fmt.Println("Finally ---> This always print after all try block #1")
	})

	println("great")
}
