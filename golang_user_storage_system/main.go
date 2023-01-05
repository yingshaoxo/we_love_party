package main

// try to convert database module to a 'class' style module if you can

import (
	"context"
	"io"
	"log"
	"os"

	"gorm.io/gorm"

	"github.com/yingshaoxo/gopython/disk_tool"

	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/account_storage_service"
	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/database"
	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/store"
)

var context_ context.Context
var err error

var postgres_sql_database *gorm.DB

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

	// set up store by using env variables
	store.Init()

	// set database
	postgres_sql_database = database.Get_postgres_sql_database()

	// set up grpc
	context_ = context.Background()
	account_storage_service := account_storage_service.GrpcAccountStorageServer{
		Postgres_sql_database: postgres_sql_database,
	}
	account_storage_service.Start(&account_storage_service, "0.0.0.0:40053", context_)
}
