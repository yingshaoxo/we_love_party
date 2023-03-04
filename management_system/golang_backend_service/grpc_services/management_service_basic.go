package grpc_services

import (
	"context"
	"log"
	"net"

	_ "github.com/lib/pq"

	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"

	"github.com/yingshaoxo/gopython/error_tool"

	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/database"
	"github.com/yingshaoxo/we_love_party/management_system/golang_backend_service/generated_grpc/management_service"
)

// if success, return nil, if no, return error_string
func return_error_if_header_user_email_not_match_target_email(request_context context.Context, email string) *error {
	headers, ok := metadata.FromIncomingContext(request_context)
	if !ok {
		return error_tool.Get_error_memory_pointer_from_string("Can't read Matadata from grpc requests")
	}

	user_email_list := headers.Get("user_email")
	if len(user_email_list) == 0 {
		return error_tool.Get_error_memory_pointer_from_string("No valid JWT, no user_email in matadata")
	}

	if user_email_list[0] == email {
		return nil
	} else {
		return error_tool.Get_error_memory_pointer_from_string("You can't handle others account.\nTarget email do not match the email in JWT(matadata)")
	}

	// return error_tool.Get_error_memory_pointer_from_string("unknown error")
}

func Get_error_memory_pointer_from_string() {
	panic("unimplemented")
}

type GrpcManagementServer struct {
	management_service.UnimplementedManagementServiceServer
	FuckTheDatabaseClass database.FuckTheDatabaseClass
}

// GetUsers(ctx context.Context, in *GetUsersRequest, opts ...grpc.CallOption) (*GetUsersResponse, error)
// AddPlace(ctx context.Context, in *AddPlaceRequest, opts ...grpc.CallOption) (*AddPlaceResponse, error)
// UpdatePlace(ctx context.Context, in *UpdatePlaceRequest, opts ...grpc.CallOption) (*UpdatePlaceResponse, error)
// DeletePlace(ctx context.Context, in *DeletePlaceRequest, opts ...grpc.CallOption) (*DeletePlaceResponse, error)

func (self *GrpcManagementServer) GetUsers(context_ context.Context, request *management_service.GetUsersRequest) (*management_service.GetUsersResponse, error) {
	// error_string := "unknown error"
	// default_response := &management_service.GetUsersResponse{
	// 	Error: &error_string,
	// }

	response := self.FuckTheDatabaseClass.Get_all_user_data(request)

	return &response, nil
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

func (_ GrpcManagementServer) Start(grpc_account_storage_server *GrpcManagementServer, address string, context_ context.Context) {
	lis, err := net.Listen("tcp", address)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := grpc.NewServer(
	// grpc.UnaryInterceptor(interceptor), //here should have an interceptor that checks if the jwt belong's to an admin or not
	)

	management_service.RegisterManagementServiceServer(s, grpc_account_storage_server)
	log.Printf("server listening at %v", lis.Addr())

	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
