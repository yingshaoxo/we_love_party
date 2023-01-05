package main

// try to convert database module to a 'class' style module if you can

import (
	"context"
	"io"
	"log"
	"os"

	"github.com/yingshaoxo/gopython/disk_tool"
	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/account_storage_service"
	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/store"
)

var context_ context.Context
var err error

// var db *gorm.DB

func setup_logger(log_file_path string) {
	// delete old log
	if disk_tool.Exists(log_file_path) {
		disk_tool.Remove_a_file_or_folder(log_file_path)
	}
	// set log file
	f, err := os.OpenFile(log_file_path, os.O_RDWR|os.O_CREATE|os.O_APPEND, 0666)
	if err != nil {
		log.Fatalf("error opening file: %v", err)
	}
	// defer f.Close()
	wrt := io.MultiWriter(os.Stdout, f)
	log.SetOutput(wrt)
}

func main() {
	// set logger
	current_path := disk_tool.Get_current_working_directory()
	if len(current_path) != 0 {
		log_file_path := disk_tool.Path_join(current_path, "log.txt")
		//built_in_functions.Print(log_file_path)
		setup_logger(log_file_path)
	}

	// set up store
	store.Init()

	// // set database
	// postgres_sql_database := database.Get_postgres_sql_database()

	// your code here

	// go telegram_bot_loop()
	// my_operation_loop()

	// my_livekit_controller := livekit.MyLiveKitController{
	// 	Content:       context_,
	// 	Host:          store.Livekit_host_https_address,
	// 	Api_key:       store.Livekit_api_key,
	// 	Api_secret:    store.Livekit_api_secret,
	// 	Identity_name: "root",
	// }
	// my_livekit_controller.Init(&my_livekit_controller)

	// the_first_room_name := "number1"
	// room_time_out_in_seconds := 60 * 60 * 12 * 30 * 12
	// common_room := my_livekit_controller.Create_a_room(the_first_room_name, uint32(room_time_out_in_seconds))

	// token1 := my_livekit_controller.Get_room_join_token(common_room.Name, "yingshaoxo")
	// token2 := my_livekit_controller.Get_room_join_token(common_room.Name, "others")

	// fmt.Println("\n")
	// fmt.Printf(
	// 	"https://example.livekit.io/#/room?url=%v&token=%v&videoEnabled=1&audioEnabled=1&simulcast=1&dynacast=1&adaptiveStream=1&videoDeviceId=1\n",
	// 	store.Livekit_host_wss_address,
	// 	token1,
	// )
	// fmt.Println()
	// fmt.Printf(
	// 	"https://example.livekit.io/#/room?url=%v&token=%v&videoEnabled=1&audioEnabled=1&simulcast=1&dynacast=1&adaptiveStream=1&videoDeviceId=2\n",
	// 	store.Livekit_host_wss_address,
	// 	token2,
	// )

	context_ = context.Background()
	call_service := account_storage_service.GrpcAccountStorageServer{}
	call_service.Start(&call_service, "127.0.0.1:40058", context_)
}
