package main

// try to convert database module to a 'class' style module if you can

import (
	"context"
	"io"
	"log"
	"os"

	_ "github.com/lib/pq"

	"github.com/yingshaoxo/gopython/disk_tool"

	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/database"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/grpc_services"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/store"
)

var context_ context.Context

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
	fuckTheDatabaseClass := database.FuckTheDatabaseClass{
		My_redis: database.Get_my_redis(),
	}

	// set up grpc
	context_ = context.Background()
	an_management_service := grpc_services.GrpcManagementServer{
		FuckTheDatabaseClass: fuckTheDatabaseClass,
	}
	an_management_service.Start(&an_management_service, "0.0.0.0:40057", context_)
}
