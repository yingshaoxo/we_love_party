package main

// try to convert database module to a 'class' style module if you can

import (
	"context"
	"io"
	"log"
	"os"

	"database/sql"

	_ "github.com/lib/pq"

	"github.com/yingshaoxo/gopython/disk_tool"

	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/database"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/grpc_services"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/store"
)

var context_ context.Context

var postgres_sql_database *sql.DB

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
	// postgres_sql_information := fmt.Sprintf(
	// 	"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
	// 	store.Environment_variables.Postgres_sql_host, 5432,
	// 	store.Environment_variables.Postgres_sql_user, store.Environment_variables.Postgres_sql_password,
	// 	"postgres")
	// postgres_sql_database, err := sql.Open("postgres", postgres_sql_information)
	// if err != nil {
	// 	log.Fatal(err)
	// }
	// defer postgres_sql_database.Close()
	fuckTheDatabaseClass := database.FuckTheDatabaseClass{
		Postgres_sql: postgres_sql_database,
	}
	fuckTheDatabaseClass.Init()
	defer fuckTheDatabaseClass.End()

	// set up grpc
	context_ = context.Background()
	an_management_service := grpc_services.GrpcManagementServer{
		Postgres_sql_database: postgres_sql_database,
	}
	an_management_service.Start(&an_management_service, "0.0.0.0:40057", context_)
}
