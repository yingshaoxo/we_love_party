// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('@grpc/grpc-js');
var internal_api_service_pb = require('./internal_api_service_pb.js');

function serialize_internal_api_service_CheckIfUserExistsRequest(arg) {
  if (!(arg instanceof internal_api_service_pb.CheckIfUserExistsRequest)) {
    throw new Error('Expected argument of type internal_api_service.CheckIfUserExistsRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_internal_api_service_CheckIfUserExistsRequest(buffer_arg) {
  return internal_api_service_pb.CheckIfUserExistsRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_internal_api_service_CheckIfUserExistsResponse(arg) {
  if (!(arg instanceof internal_api_service_pb.CheckIfUserExistsResponse)) {
    throw new Error('Expected argument of type internal_api_service.CheckIfUserExistsResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_internal_api_service_CheckIfUserExistsResponse(buffer_arg) {
  return internal_api_service_pb.CheckIfUserExistsResponse.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_internal_api_service_CreateAUserRequest(arg) {
  if (!(arg instanceof internal_api_service_pb.CreateAUserRequest)) {
    throw new Error('Expected argument of type internal_api_service.CreateAUserRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_internal_api_service_CreateAUserRequest(buffer_arg) {
  return internal_api_service_pb.CreateAUserRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_internal_api_service_CreateAUserResponse(arg) {
  if (!(arg instanceof internal_api_service_pb.CreateAUserResponse)) {
    throw new Error('Expected argument of type internal_api_service.CreateAUserResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_internal_api_service_CreateAUserResponse(buffer_arg) {
  return internal_api_service_pb.CreateAUserResponse.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_internal_api_service_DeleteAUserRequest(arg) {
  if (!(arg instanceof internal_api_service_pb.DeleteAUserRequest)) {
    throw new Error('Expected argument of type internal_api_service.DeleteAUserRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_internal_api_service_DeleteAUserRequest(buffer_arg) {
  return internal_api_service_pb.DeleteAUserRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_internal_api_service_DeleteAUserResponse(arg) {
  if (!(arg instanceof internal_api_service_pb.DeleteAUserResponse)) {
    throw new Error('Expected argument of type internal_api_service.DeleteAUserResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_internal_api_service_DeleteAUserResponse(buffer_arg) {
  return internal_api_service_pb.DeleteAUserResponse.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_internal_api_service_GetUserRequest(arg) {
  if (!(arg instanceof internal_api_service_pb.GetUserRequest)) {
    throw new Error('Expected argument of type internal_api_service.GetUserRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_internal_api_service_GetUserRequest(buffer_arg) {
  return internal_api_service_pb.GetUserRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_internal_api_service_GetUserResponse(arg) {
  if (!(arg instanceof internal_api_service_pb.GetUserResponse)) {
    throw new Error('Expected argument of type internal_api_service.GetUserResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_internal_api_service_GetUserResponse(buffer_arg) {
  return internal_api_service_pb.GetUserResponse.deserializeBinary(new Uint8Array(buffer_arg));
}


var InternalApiServiceService = exports.InternalApiServiceService = {
  createAUser: {
    path: '/internal_api_service.InternalApiService/CreateAUser',
    requestStream: false,
    responseStream: false,
    requestType: internal_api_service_pb.CreateAUserRequest,
    responseType: internal_api_service_pb.CreateAUserResponse,
    requestSerialize: serialize_internal_api_service_CreateAUserRequest,
    requestDeserialize: deserialize_internal_api_service_CreateAUserRequest,
    responseSerialize: serialize_internal_api_service_CreateAUserResponse,
    responseDeserialize: deserialize_internal_api_service_CreateAUserResponse,
  },
  deleteAUser: {
    path: '/internal_api_service.InternalApiService/DeleteAUser',
    requestStream: false,
    responseStream: false,
    requestType: internal_api_service_pb.DeleteAUserRequest,
    responseType: internal_api_service_pb.DeleteAUserResponse,
    requestSerialize: serialize_internal_api_service_DeleteAUserRequest,
    requestDeserialize: deserialize_internal_api_service_DeleteAUserRequest,
    responseSerialize: serialize_internal_api_service_DeleteAUserResponse,
    responseDeserialize: deserialize_internal_api_service_DeleteAUserResponse,
  },
  checkIfUserExists: {
    path: '/internal_api_service.InternalApiService/CheckIfUserExists',
    requestStream: false,
    responseStream: false,
    requestType: internal_api_service_pb.CheckIfUserExistsRequest,
    responseType: internal_api_service_pb.CheckIfUserExistsResponse,
    requestSerialize: serialize_internal_api_service_CheckIfUserExistsRequest,
    requestDeserialize: deserialize_internal_api_service_CheckIfUserExistsRequest,
    responseSerialize: serialize_internal_api_service_CheckIfUserExistsResponse,
    responseDeserialize: deserialize_internal_api_service_CheckIfUserExistsResponse,
  },
  getUser: {
    path: '/internal_api_service.InternalApiService/GetUser',
    requestStream: false,
    responseStream: false,
    requestType: internal_api_service_pb.GetUserRequest,
    responseType: internal_api_service_pb.GetUserResponse,
    requestSerialize: serialize_internal_api_service_GetUserRequest,
    requestDeserialize: deserialize_internal_api_service_GetUserRequest,
    responseSerialize: serialize_internal_api_service_GetUserResponse,
    responseDeserialize: deserialize_internal_api_service_GetUserResponse,
  },
};

exports.InternalApiServiceClient = grpc.makeGenericClientConstructor(InternalApiServiceService);
