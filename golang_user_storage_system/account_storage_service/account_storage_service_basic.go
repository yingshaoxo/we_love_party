package account_storage_service

import (
	"context"
	"log"
	"net"

	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/generated_grpc/account_storage_service"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/livekit"
	"github.com/yingshaoxo/we_love_party/golang_user_storage_system/store"
)

type GrpcAccountStorageServer struct {
	account_storage_service.UnimplementedAccountStorageServiceServer
	my_live_kit_controller livekit.MyLiveKitController
	call_info_dict         map[string]string
	token_dict             map[string]string
}

func (s *GrpcAccountStorageServer) clean_call_data_related_two_users(email1 string, email2 string) {
	delete(s.call_info_dict, email1)
	delete(s.call_info_dict, email2)

	delete(s.call_info_dict, email1)
	delete(s.call_info_dict, email2)

	delete(s.token_dict, email1)
	delete(s.token_dict, email2)
}

// func (s *GrpcAccountStorageServer) IAmOnline(context_ context.Context, in *generated_grpc.OnlineRequest) (*generated_grpc.OnlineResponse, error) {
// 	default_response := &generated_grpc.OnlineResponse{
// 		Error:         "",
// 		JsonString:    "",
// 		CallComing:    false,
// 		RoomName:      "",
// 		CallInitiator: "",
// 		Token:         "",
// 	}

// 	call_initiator, ok := s.call_info_dict[in.Email]
// 	if ok {
// 		default_response.CallComing = true
// 		default_response.RoomName = call_initiator
// 		default_response.CallInitiator = call_initiator
// 		default_response.Token = s.my_live_kit_controller.Get_room_join_token(call_initiator, in.Email)
// 		s.token_dict[in.Email] = default_response.Token

// 		time.Sleep(500000000)

// 		s.clean_call_data_related_two_users(in.Email, call_initiator)
// 	}

// 	return default_response, nil
// }

func (s *GrpcAccountStorageServer) CreateUser(context_ context.Context, request *account_storage_service.CreateUserRequest) (*account_storage_service.CreateUserResponse, error) {
	default_error := "method not implemented"
	default_response := &account_storage_service.CreateUserResponse{
		Result: "",
		Error:  &default_error,
	}

	return default_response, status.Errorf(codes.Unimplemented, "method CreateUser not implemented")
}
func (s *GrpcAccountStorageServer) DeleteUser(context_ context.Context, request *account_storage_service.DeleteUserRequest) (*account_storage_service.DeleteUserResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DeleteUser not implemented")
}
func (s *GrpcAccountStorageServer) UpdateUser(context_ context.Context, request *account_storage_service.UpdateUserRequest) (*account_storage_service.UpdateUserResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method UpdateUser not implemented")
}

// address example: 127.0.0.1:40058 ; 40059 is used for web grpc
func (_ GrpcAccountStorageServer) Start(grpc_account_storage_server *GrpcAccountStorageServer, address string, context_ context.Context) {
	lis, err := net.Listen("tcp", address)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := grpc.NewServer()

	my_livekit_controller := livekit.MyLiveKitController{
		Content:       context_,
		Host:          store.Livekit_host_https_address,
		Api_key:       store.Livekit_api_key,
		Api_secret:    store.Livekit_api_secret,
		Identity_name: "root",
	}
	my_livekit_controller.Init(&my_livekit_controller)

	grpc_account_storage_server.my_live_kit_controller = my_livekit_controller
	grpc_account_storage_server.call_info_dict = make(map[string]string)
	grpc_account_storage_server.token_dict = make(map[string]string)

	account_storage_service.RegisterAccountStorageServiceServer(s, grpc_account_storage_server)
	log.Printf("server listening at %v", lis.Addr())

	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
