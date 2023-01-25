/* eslint-disable */
import type { CallContext, CallOptions } from "nice-grpc-common";
import * as _m0 from "protobufjs/minimal";

export const protobufPackage = "internal_api_service";

export interface CreateAUserRequest {
  email: string;
}

export interface CreateAUserResponse {
  result: string;
  error?: string | undefined;
}

export interface DeleteAUserRequest {
  email: string;
}

export interface DeleteAUserResponse {
  result: string;
  error?: string | undefined;
}

export interface GetUserRequest {
  email: string;
}

export interface GetUserResponse {
  error?: string | undefined;
  userExists: boolean;
  email: string;
  username?:
    | string
    | undefined;
  /** base64 string of an image */
  headImage?:
    | string
    | undefined;
  /** AI detect. 0: female, 1: male */
  sex?:
    | number
    | undefined;
  /** AI detect. */
  age?: number | undefined;
}

export interface CheckIfUserExistsRequest {
  email: string;
}

export interface CheckIfUserExistsResponse {
  error?: string | undefined;
  userExists: boolean;
}

function createBaseCreateAUserRequest(): CreateAUserRequest {
  return { email: "" };
}

export const CreateAUserRequest = {
  encode(message: CreateAUserRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.email !== "") {
      writer.uint32(10).string(message.email);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): CreateAUserRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseCreateAUserRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.email = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): CreateAUserRequest {
    return { email: isSet(object.email) ? String(object.email) : "" };
  },

  toJSON(message: CreateAUserRequest): unknown {
    const obj: any = {};
    message.email !== undefined && (obj.email = message.email);
    return obj;
  },

  create(base?: DeepPartial<CreateAUserRequest>): CreateAUserRequest {
    return CreateAUserRequest.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<CreateAUserRequest>): CreateAUserRequest {
    const message = createBaseCreateAUserRequest();
    message.email = object.email ?? "";
    return message;
  },
};

function createBaseCreateAUserResponse(): CreateAUserResponse {
  return { result: "", error: undefined };
}

export const CreateAUserResponse = {
  encode(message: CreateAUserResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.result !== "") {
      writer.uint32(10).string(message.result);
    }
    if (message.error !== undefined) {
      writer.uint32(18).string(message.error);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): CreateAUserResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseCreateAUserResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.result = reader.string();
          break;
        case 2:
          message.error = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): CreateAUserResponse {
    return {
      result: isSet(object.result) ? String(object.result) : "",
      error: isSet(object.error) ? String(object.error) : undefined,
    };
  },

  toJSON(message: CreateAUserResponse): unknown {
    const obj: any = {};
    message.result !== undefined && (obj.result = message.result);
    message.error !== undefined && (obj.error = message.error);
    return obj;
  },

  create(base?: DeepPartial<CreateAUserResponse>): CreateAUserResponse {
    return CreateAUserResponse.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<CreateAUserResponse>): CreateAUserResponse {
    const message = createBaseCreateAUserResponse();
    message.result = object.result ?? "";
    message.error = object.error ?? undefined;
    return message;
  },
};

function createBaseDeleteAUserRequest(): DeleteAUserRequest {
  return { email: "" };
}

export const DeleteAUserRequest = {
  encode(message: DeleteAUserRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.email !== "") {
      writer.uint32(10).string(message.email);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): DeleteAUserRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseDeleteAUserRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.email = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): DeleteAUserRequest {
    return { email: isSet(object.email) ? String(object.email) : "" };
  },

  toJSON(message: DeleteAUserRequest): unknown {
    const obj: any = {};
    message.email !== undefined && (obj.email = message.email);
    return obj;
  },

  create(base?: DeepPartial<DeleteAUserRequest>): DeleteAUserRequest {
    return DeleteAUserRequest.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<DeleteAUserRequest>): DeleteAUserRequest {
    const message = createBaseDeleteAUserRequest();
    message.email = object.email ?? "";
    return message;
  },
};

function createBaseDeleteAUserResponse(): DeleteAUserResponse {
  return { result: "", error: undefined };
}

export const DeleteAUserResponse = {
  encode(message: DeleteAUserResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.result !== "") {
      writer.uint32(10).string(message.result);
    }
    if (message.error !== undefined) {
      writer.uint32(18).string(message.error);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): DeleteAUserResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseDeleteAUserResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.result = reader.string();
          break;
        case 2:
          message.error = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): DeleteAUserResponse {
    return {
      result: isSet(object.result) ? String(object.result) : "",
      error: isSet(object.error) ? String(object.error) : undefined,
    };
  },

  toJSON(message: DeleteAUserResponse): unknown {
    const obj: any = {};
    message.result !== undefined && (obj.result = message.result);
    message.error !== undefined && (obj.error = message.error);
    return obj;
  },

  create(base?: DeepPartial<DeleteAUserResponse>): DeleteAUserResponse {
    return DeleteAUserResponse.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<DeleteAUserResponse>): DeleteAUserResponse {
    const message = createBaseDeleteAUserResponse();
    message.result = object.result ?? "";
    message.error = object.error ?? undefined;
    return message;
  },
};

function createBaseGetUserRequest(): GetUserRequest {
  return { email: "" };
}

export const GetUserRequest = {
  encode(message: GetUserRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.email !== "") {
      writer.uint32(10).string(message.email);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): GetUserRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseGetUserRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.email = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): GetUserRequest {
    return { email: isSet(object.email) ? String(object.email) : "" };
  },

  toJSON(message: GetUserRequest): unknown {
    const obj: any = {};
    message.email !== undefined && (obj.email = message.email);
    return obj;
  },

  create(base?: DeepPartial<GetUserRequest>): GetUserRequest {
    return GetUserRequest.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<GetUserRequest>): GetUserRequest {
    const message = createBaseGetUserRequest();
    message.email = object.email ?? "";
    return message;
  },
};

function createBaseGetUserResponse(): GetUserResponse {
  return {
    error: undefined,
    userExists: false,
    email: "",
    username: undefined,
    headImage: undefined,
    sex: undefined,
    age: undefined,
  };
}

export const GetUserResponse = {
  encode(message: GetUserResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.error !== undefined) {
      writer.uint32(10).string(message.error);
    }
    if (message.userExists === true) {
      writer.uint32(16).bool(message.userExists);
    }
    if (message.email !== "") {
      writer.uint32(26).string(message.email);
    }
    if (message.username !== undefined) {
      writer.uint32(34).string(message.username);
    }
    if (message.headImage !== undefined) {
      writer.uint32(42).string(message.headImage);
    }
    if (message.sex !== undefined) {
      writer.uint32(48).int32(message.sex);
    }
    if (message.age !== undefined) {
      writer.uint32(56).int32(message.age);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): GetUserResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseGetUserResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.error = reader.string();
          break;
        case 2:
          message.userExists = reader.bool();
          break;
        case 3:
          message.email = reader.string();
          break;
        case 4:
          message.username = reader.string();
          break;
        case 5:
          message.headImage = reader.string();
          break;
        case 6:
          message.sex = reader.int32();
          break;
        case 7:
          message.age = reader.int32();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): GetUserResponse {
    return {
      error: isSet(object.error) ? String(object.error) : undefined,
      userExists: isSet(object.userExists) ? Boolean(object.userExists) : false,
      email: isSet(object.email) ? String(object.email) : "",
      username: isSet(object.username) ? String(object.username) : undefined,
      headImage: isSet(object.headImage) ? String(object.headImage) : undefined,
      sex: isSet(object.sex) ? Number(object.sex) : undefined,
      age: isSet(object.age) ? Number(object.age) : undefined,
    };
  },

  toJSON(message: GetUserResponse): unknown {
    const obj: any = {};
    message.error !== undefined && (obj.error = message.error);
    message.userExists !== undefined && (obj.userExists = message.userExists);
    message.email !== undefined && (obj.email = message.email);
    message.username !== undefined && (obj.username = message.username);
    message.headImage !== undefined && (obj.headImage = message.headImage);
    message.sex !== undefined && (obj.sex = Math.round(message.sex));
    message.age !== undefined && (obj.age = Math.round(message.age));
    return obj;
  },

  create(base?: DeepPartial<GetUserResponse>): GetUserResponse {
    return GetUserResponse.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<GetUserResponse>): GetUserResponse {
    const message = createBaseGetUserResponse();
    message.error = object.error ?? undefined;
    message.userExists = object.userExists ?? false;
    message.email = object.email ?? "";
    message.username = object.username ?? undefined;
    message.headImage = object.headImage ?? undefined;
    message.sex = object.sex ?? undefined;
    message.age = object.age ?? undefined;
    return message;
  },
};

function createBaseCheckIfUserExistsRequest(): CheckIfUserExistsRequest {
  return { email: "" };
}

export const CheckIfUserExistsRequest = {
  encode(message: CheckIfUserExistsRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.email !== "") {
      writer.uint32(10).string(message.email);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): CheckIfUserExistsRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseCheckIfUserExistsRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.email = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): CheckIfUserExistsRequest {
    return { email: isSet(object.email) ? String(object.email) : "" };
  },

  toJSON(message: CheckIfUserExistsRequest): unknown {
    const obj: any = {};
    message.email !== undefined && (obj.email = message.email);
    return obj;
  },

  create(base?: DeepPartial<CheckIfUserExistsRequest>): CheckIfUserExistsRequest {
    return CheckIfUserExistsRequest.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<CheckIfUserExistsRequest>): CheckIfUserExistsRequest {
    const message = createBaseCheckIfUserExistsRequest();
    message.email = object.email ?? "";
    return message;
  },
};

function createBaseCheckIfUserExistsResponse(): CheckIfUserExistsResponse {
  return { error: undefined, userExists: false };
}

export const CheckIfUserExistsResponse = {
  encode(message: CheckIfUserExistsResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.error !== undefined) {
      writer.uint32(10).string(message.error);
    }
    if (message.userExists === true) {
      writer.uint32(16).bool(message.userExists);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): CheckIfUserExistsResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseCheckIfUserExistsResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.error = reader.string();
          break;
        case 2:
          message.userExists = reader.bool();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): CheckIfUserExistsResponse {
    return {
      error: isSet(object.error) ? String(object.error) : undefined,
      userExists: isSet(object.userExists) ? Boolean(object.userExists) : false,
    };
  },

  toJSON(message: CheckIfUserExistsResponse): unknown {
    const obj: any = {};
    message.error !== undefined && (obj.error = message.error);
    message.userExists !== undefined && (obj.userExists = message.userExists);
    return obj;
  },

  create(base?: DeepPartial<CheckIfUserExistsResponse>): CheckIfUserExistsResponse {
    return CheckIfUserExistsResponse.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<CheckIfUserExistsResponse>): CheckIfUserExistsResponse {
    const message = createBaseCheckIfUserExistsResponse();
    message.error = object.error ?? undefined;
    message.userExists = object.userExists ?? false;
    return message;
  },
};

export type InternalApiServiceDefinition = typeof InternalApiServiceDefinition;
export const InternalApiServiceDefinition = {
  name: "InternalApiService",
  fullName: "internal_api_service.InternalApiService",
  methods: {
    createAUser: {
      name: "CreateAUser",
      requestType: CreateAUserRequest,
      requestStream: false,
      responseType: CreateAUserResponse,
      responseStream: false,
      options: {},
    },
    deleteAUser: {
      name: "DeleteAUser",
      requestType: DeleteAUserRequest,
      requestStream: false,
      responseType: DeleteAUserResponse,
      responseStream: false,
      options: {},
    },
    checkIfUserExists: {
      name: "CheckIfUserExists",
      requestType: CheckIfUserExistsRequest,
      requestStream: false,
      responseType: CheckIfUserExistsResponse,
      responseStream: false,
      options: {},
    },
    getUser: {
      name: "GetUser",
      requestType: GetUserRequest,
      requestStream: false,
      responseType: GetUserResponse,
      responseStream: false,
      options: {},
    },
  },
} as const;

export interface InternalApiServiceImplementation<CallContextExt = {}> {
  createAUser(
    request: CreateAUserRequest,
    context: CallContext & CallContextExt,
  ): Promise<DeepPartial<CreateAUserResponse>>;
  deleteAUser(
    request: DeleteAUserRequest,
    context: CallContext & CallContextExt,
  ): Promise<DeepPartial<DeleteAUserResponse>>;
  checkIfUserExists(
    request: CheckIfUserExistsRequest,
    context: CallContext & CallContextExt,
  ): Promise<DeepPartial<CheckIfUserExistsResponse>>;
  getUser(request: GetUserRequest, context: CallContext & CallContextExt): Promise<DeepPartial<GetUserResponse>>;
}

export interface InternalApiServiceClient<CallOptionsExt = {}> {
  createAUser(
    request: DeepPartial<CreateAUserRequest>,
    options?: CallOptions & CallOptionsExt,
  ): Promise<CreateAUserResponse>;
  deleteAUser(
    request: DeepPartial<DeleteAUserRequest>,
    options?: CallOptions & CallOptionsExt,
  ): Promise<DeleteAUserResponse>;
  checkIfUserExists(
    request: DeepPartial<CheckIfUserExistsRequest>,
    options?: CallOptions & CallOptionsExt,
  ): Promise<CheckIfUserExistsResponse>;
  getUser(request: DeepPartial<GetUserRequest>, options?: CallOptions & CallOptionsExt): Promise<GetUserResponse>;
}

type Builtin = Date | Function | Uint8Array | string | number | boolean | undefined;

export type DeepPartial<T> = T extends Builtin ? T
  : T extends Array<infer U> ? Array<DeepPartial<U>> : T extends ReadonlyArray<infer U> ? ReadonlyArray<DeepPartial<U>>
  : T extends {} ? { [K in keyof T]?: DeepPartial<T[K]> }
  : Partial<T>;

function isSet(value: any): boolean {
  return value !== null && value !== undefined;
}
