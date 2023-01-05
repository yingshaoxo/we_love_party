package account_storage_service

import (
	"context"
	"log"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"

	"gorm.io/gorm"
	"gorm.io/gorm/clause"

	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/database"
	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/generated_grpc/account_storage_service"
)

// if success, return nil, if no, return error_string
func return_nil_if_header_user_email_matchs_target_email(request_context context.Context, email string) *string {
	error_string := "unknown error"

	headers, ok := metadata.FromIncomingContext(request_context)
	if !ok {
		error_string = "Can't read Matadata from grpc requests"
		return &error_string
	}

	user_email_list := headers.Get("user_email")
	if len(user_email_list) == 0 {
		error_string = "No valid JWT, no user_email in matadata"
		return &error_string
	}

	if user_email_list[0] == email {
		return nil
	} else {
		error_string = "You can't handle others account.\nTarget email do not match the email in JWT(matadata)"
		return &error_string
	}
}

type GrpcAccountStorageServer struct {
	account_storage_service.UnimplementedAccountStorageServiceServer
	Postgres_sql_database *gorm.DB
}

func (self *GrpcAccountStorageServer) CreateUser(context_ context.Context, request *account_storage_service.CreateUserRequest) (*account_storage_service.CreateUserResponse, error) {
	error_string := "unknown error"
	default_response := &account_storage_service.CreateUserResponse{
		Result: "",
		Error:  &error_string,
	}

	an_error := return_nil_if_header_user_email_matchs_target_email(context_, request.Email)
	if an_error != nil {
		default_response.Error = an_error
		return default_response, nil
	}

	user := database.User{
		Email:      request.Email,
		Password:   "",
		Username:   "",
		Head_image: "",
		Sex:        -1,
		Age:        -1,
	}
	result := self.Postgres_sql_database.Clauses(clause.OnConflict{DoNothing: true}).Create(&user)
	if result.Error != nil {
		error_string = result.Error.Error()
		default_response.Error = &error_string
	} else {
		default_response.Result = "ok"
		default_response.Error = nil
	}

	return default_response, nil
}

func (self *GrpcAccountStorageServer) DeleteUser(context_ context.Context, request *account_storage_service.DeleteUserRequest) (*account_storage_service.DeleteUserResponse, error) {
	error_string := "unknown error"
	default_response := &account_storage_service.DeleteUserResponse{
		Result: "",
		Error:  &error_string,
	}

	an_error := return_nil_if_header_user_email_matchs_target_email(context_, request.Email)
	if an_error != nil {
		default_response.Error = an_error
		return default_response, nil
	}

	result := self.Postgres_sql_database.Unscoped().Where("email = ?", request.Email).Delete(&database.User{})
	if result.Error != nil {
		error_string = result.Error.Error()
		default_response.Error = &error_string
	} else {
		default_response.Result = "ok"
		default_response.Error = nil
	}

	return default_response, nil
}

func (self *GrpcAccountStorageServer) UpdateUser(context_ context.Context, request *account_storage_service.UpdateUserRequest) (*account_storage_service.UpdateUserResponse, error) {
	error_string := "unknown error"
	default_response := &account_storage_service.UpdateUserResponse{
		Result: "",
		Error:  &error_string,
	}

	an_error := return_nil_if_header_user_email_matchs_target_email(context_, request.Email)
	if an_error != nil {
		default_response.Error = an_error
		return default_response, nil
	}

	var users []database.User
	operation_result := self.Postgres_sql_database.Where("email = ?", request.Email).Find(&users)
	if operation_result.Error != nil {
		error_string = operation_result.Error.Error()
		default_response.Error = &error_string
		return default_response, nil
	}

	if len(users) == 0 {
		error_string = "not found"
		default_response.Error = &error_string
		return default_response, nil
	}

	user := users[0]
	if request.Password != nil {
		user.Password = *request.Password
	}
	if request.Username != nil {
		user.Username = *request.Username
	}
	if request.HeadImage != nil {
		user.Head_image = *request.HeadImage
	}
	if request.Sex != nil {
		user.Sex = *request.Sex
	}
	if request.Age != nil {
		user.Age = *request.Age
	}

	result := self.Postgres_sql_database.Clauses(clause.OnConflict{
		Columns:   []clause.Column{{Name: "email"}}, // key colume
		UpdateAll: true,
	}).Create(&user)

	if result.Error != nil {
		error_string = result.Error.Error()
		default_response.Error = &error_string
	} else {
		default_response.Result = "ok"
		default_response.Error = nil
	}

	return default_response, nil
}

// func interceptor(ctx_ context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
// 	headers, ok := metadata.FromIncomingContext(ctx_)
// 	if !ok {
// 		return nil, grpc.Errorf(codes.Unauthenticated, "Can't read Matadata from grpc requests")
// 	}

// 	user_email_list := headers.Get("user_email")
// 	if len(user_email_list) == 0 {
// 		return nil, grpc.Errorf(codes.Unauthenticated, "No valid JWT, no user_email in matadata")
// 	}

// 	return handler(ctx_, req)
// }

func (_ GrpcAccountStorageServer) Start(grpc_account_storage_server *GrpcAccountStorageServer, address string, context_ context.Context) {
	lis, err := net.Listen("tcp", address)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := grpc.NewServer(
	// grpc.UnaryInterceptor(interceptor),
	)

	// my_livekit_controller := livekit.MyLiveKitController{
	// 	Content:       context_,
	// 	Host:          store.Livekit_host_https_address,
	// 	Api_key:       store.Livekit_api_key,
	// 	Api_secret:    store.Livekit_api_secret,
	// 	Identity_name: "root",
	// }
	// my_livekit_controller.Init(&my_livekit_controller)

	// grpc_account_storage_server.call_info_dict = make(map[string]string)
	// grpc_account_storage_server.token_dict = make(map[string]string)

	account_storage_service.RegisterAccountStorageServiceServer(s, grpc_account_storage_server)
	log.Printf("server listening at %v", lis.Addr())

	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
