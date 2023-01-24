// GENERATED CODE -- DO NOT EDIT!

// package: internal_api_service
// file: internal_api_service.proto

import * as internal_api_service_pb from "./internal_api_service_pb";
import * as grpc from "@grpc/grpc-js";

interface IInternalApiServiceService extends grpc.ServiceDefinition<grpc.UntypedServiceImplementation> {
  createAUser: grpc.MethodDefinition<internal_api_service_pb.CreateAUserRequest, internal_api_service_pb.CreateAUserResponse>;
  deleteAUser: grpc.MethodDefinition<internal_api_service_pb.DeleteAUserRequest, internal_api_service_pb.DeleteAUserResponse>;
  checkIfUserExists: grpc.MethodDefinition<internal_api_service_pb.CheckIfUserExistsRequest, internal_api_service_pb.CheckIfUserExistsResponse>;
  getUser: grpc.MethodDefinition<internal_api_service_pb.GetUserRequest, internal_api_service_pb.GetUserResponse>;
}

export const InternalApiServiceService: IInternalApiServiceService;

export interface IInternalApiServiceServer extends grpc.UntypedServiceImplementation {
  createAUser: grpc.handleUnaryCall<internal_api_service_pb.CreateAUserRequest, internal_api_service_pb.CreateAUserResponse>;
  deleteAUser: grpc.handleUnaryCall<internal_api_service_pb.DeleteAUserRequest, internal_api_service_pb.DeleteAUserResponse>;
  checkIfUserExists: grpc.handleUnaryCall<internal_api_service_pb.CheckIfUserExistsRequest, internal_api_service_pb.CheckIfUserExistsResponse>;
  getUser: grpc.handleUnaryCall<internal_api_service_pb.GetUserRequest, internal_api_service_pb.GetUserResponse>;
}

export class InternalApiServiceClient extends grpc.Client {
  constructor(address: string, credentials: grpc.ChannelCredentials, options?: object);
  createAUser(argument: internal_api_service_pb.CreateAUserRequest, callback: grpc.requestCallback<internal_api_service_pb.CreateAUserResponse>): grpc.ClientUnaryCall;
  createAUser(argument: internal_api_service_pb.CreateAUserRequest, metadataOrOptions: grpc.Metadata | grpc.CallOptions | null, callback: grpc.requestCallback<internal_api_service_pb.CreateAUserResponse>): grpc.ClientUnaryCall;
  createAUser(argument: internal_api_service_pb.CreateAUserRequest, metadata: grpc.Metadata | null, options: grpc.CallOptions | null, callback: grpc.requestCallback<internal_api_service_pb.CreateAUserResponse>): grpc.ClientUnaryCall;
  deleteAUser(argument: internal_api_service_pb.DeleteAUserRequest, callback: grpc.requestCallback<internal_api_service_pb.DeleteAUserResponse>): grpc.ClientUnaryCall;
  deleteAUser(argument: internal_api_service_pb.DeleteAUserRequest, metadataOrOptions: grpc.Metadata | grpc.CallOptions | null, callback: grpc.requestCallback<internal_api_service_pb.DeleteAUserResponse>): grpc.ClientUnaryCall;
  deleteAUser(argument: internal_api_service_pb.DeleteAUserRequest, metadata: grpc.Metadata | null, options: grpc.CallOptions | null, callback: grpc.requestCallback<internal_api_service_pb.DeleteAUserResponse>): grpc.ClientUnaryCall;
  checkIfUserExists(argument: internal_api_service_pb.CheckIfUserExistsRequest, callback: grpc.requestCallback<internal_api_service_pb.CheckIfUserExistsResponse>): grpc.ClientUnaryCall;
  checkIfUserExists(argument: internal_api_service_pb.CheckIfUserExistsRequest, metadataOrOptions: grpc.Metadata | grpc.CallOptions | null, callback: grpc.requestCallback<internal_api_service_pb.CheckIfUserExistsResponse>): grpc.ClientUnaryCall;
  checkIfUserExists(argument: internal_api_service_pb.CheckIfUserExistsRequest, metadata: grpc.Metadata | null, options: grpc.CallOptions | null, callback: grpc.requestCallback<internal_api_service_pb.CheckIfUserExistsResponse>): grpc.ClientUnaryCall;
  getUser(argument: internal_api_service_pb.GetUserRequest, callback: grpc.requestCallback<internal_api_service_pb.GetUserResponse>): grpc.ClientUnaryCall;
  getUser(argument: internal_api_service_pb.GetUserRequest, metadataOrOptions: grpc.Metadata | grpc.CallOptions | null, callback: grpc.requestCallback<internal_api_service_pb.GetUserResponse>): grpc.ClientUnaryCall;
  getUser(argument: internal_api_service_pb.GetUserRequest, metadata: grpc.Metadata | null, options: grpc.CallOptions | null, callback: grpc.requestCallback<internal_api_service_pb.GetUserResponse>): grpc.ClientUnaryCall;
}
