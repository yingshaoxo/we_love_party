/* eslint-disable */
import type { CallContext, CallOptions } from "nice-grpc-common";
import * as _m0 from "protobufjs/minimal";

export const protobufPackage = "room_control_service";

export interface CreateRoomRequest {
  roomName: string;
}

export interface CreateRoomResponse {
  error?: string | undefined;
  success: boolean;
}

export interface AllowJoinRequest {
  roomName: string;
  identity: string;
}

export interface AllowJoinResponse {
  error?: string | undefined;
  accessToken: string;
}

export interface ListRoomsRequest {
}

export interface RoomInfo {
  roomName: string;
  numberOfParticipants: number;
}

export interface ListRoomsResponse {
  error?: string | undefined;
  rooms: RoomInfo[];
}

export interface DeleteRoomRequest {
  roomName: string;
}

export interface DeleteRoomResponse {
  error?: string | undefined;
  success: boolean;
}

function createBaseCreateRoomRequest(): CreateRoomRequest {
  return { roomName: "" };
}

export const CreateRoomRequest = {
  encode(message: CreateRoomRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.roomName !== "") {
      writer.uint32(10).string(message.roomName);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): CreateRoomRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseCreateRoomRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.roomName = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): CreateRoomRequest {
    return { roomName: isSet(object.roomName) ? String(object.roomName) : "" };
  },

  toJSON(message: CreateRoomRequest): unknown {
    const obj: any = {};
    message.roomName !== undefined && (obj.roomName = message.roomName);
    return obj;
  },

  create(base?: DeepPartial<CreateRoomRequest>): CreateRoomRequest {
    return CreateRoomRequest.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<CreateRoomRequest>): CreateRoomRequest {
    const message = createBaseCreateRoomRequest();
    message.roomName = object.roomName ?? "";
    return message;
  },
};

function createBaseCreateRoomResponse(): CreateRoomResponse {
  return { error: undefined, success: false };
}

export const CreateRoomResponse = {
  encode(message: CreateRoomResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.error !== undefined) {
      writer.uint32(10).string(message.error);
    }
    if (message.success === true) {
      writer.uint32(16).bool(message.success);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): CreateRoomResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseCreateRoomResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.error = reader.string();
          break;
        case 2:
          message.success = reader.bool();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): CreateRoomResponse {
    return {
      error: isSet(object.error) ? String(object.error) : undefined,
      success: isSet(object.success) ? Boolean(object.success) : false,
    };
  },

  toJSON(message: CreateRoomResponse): unknown {
    const obj: any = {};
    message.error !== undefined && (obj.error = message.error);
    message.success !== undefined && (obj.success = message.success);
    return obj;
  },

  create(base?: DeepPartial<CreateRoomResponse>): CreateRoomResponse {
    return CreateRoomResponse.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<CreateRoomResponse>): CreateRoomResponse {
    const message = createBaseCreateRoomResponse();
    message.error = object.error ?? undefined;
    message.success = object.success ?? false;
    return message;
  },
};

function createBaseAllowJoinRequest(): AllowJoinRequest {
  return { roomName: "", identity: "" };
}

export const AllowJoinRequest = {
  encode(message: AllowJoinRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.roomName !== "") {
      writer.uint32(10).string(message.roomName);
    }
    if (message.identity !== "") {
      writer.uint32(18).string(message.identity);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): AllowJoinRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseAllowJoinRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.roomName = reader.string();
          break;
        case 2:
          message.identity = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): AllowJoinRequest {
    return {
      roomName: isSet(object.roomName) ? String(object.roomName) : "",
      identity: isSet(object.identity) ? String(object.identity) : "",
    };
  },

  toJSON(message: AllowJoinRequest): unknown {
    const obj: any = {};
    message.roomName !== undefined && (obj.roomName = message.roomName);
    message.identity !== undefined && (obj.identity = message.identity);
    return obj;
  },

  create(base?: DeepPartial<AllowJoinRequest>): AllowJoinRequest {
    return AllowJoinRequest.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<AllowJoinRequest>): AllowJoinRequest {
    const message = createBaseAllowJoinRequest();
    message.roomName = object.roomName ?? "";
    message.identity = object.identity ?? "";
    return message;
  },
};

function createBaseAllowJoinResponse(): AllowJoinResponse {
  return { error: undefined, accessToken: "" };
}

export const AllowJoinResponse = {
  encode(message: AllowJoinResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.error !== undefined) {
      writer.uint32(10).string(message.error);
    }
    if (message.accessToken !== "") {
      writer.uint32(18).string(message.accessToken);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): AllowJoinResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseAllowJoinResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.error = reader.string();
          break;
        case 2:
          message.accessToken = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): AllowJoinResponse {
    return {
      error: isSet(object.error) ? String(object.error) : undefined,
      accessToken: isSet(object.accessToken) ? String(object.accessToken) : "",
    };
  },

  toJSON(message: AllowJoinResponse): unknown {
    const obj: any = {};
    message.error !== undefined && (obj.error = message.error);
    message.accessToken !== undefined && (obj.accessToken = message.accessToken);
    return obj;
  },

  create(base?: DeepPartial<AllowJoinResponse>): AllowJoinResponse {
    return AllowJoinResponse.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<AllowJoinResponse>): AllowJoinResponse {
    const message = createBaseAllowJoinResponse();
    message.error = object.error ?? undefined;
    message.accessToken = object.accessToken ?? "";
    return message;
  },
};

function createBaseListRoomsRequest(): ListRoomsRequest {
  return {};
}

export const ListRoomsRequest = {
  encode(_: ListRoomsRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): ListRoomsRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseListRoomsRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(_: any): ListRoomsRequest {
    return {};
  },

  toJSON(_: ListRoomsRequest): unknown {
    const obj: any = {};
    return obj;
  },

  create(base?: DeepPartial<ListRoomsRequest>): ListRoomsRequest {
    return ListRoomsRequest.fromPartial(base ?? {});
  },

  fromPartial(_: DeepPartial<ListRoomsRequest>): ListRoomsRequest {
    const message = createBaseListRoomsRequest();
    return message;
  },
};

function createBaseRoomInfo(): RoomInfo {
  return { roomName: "", numberOfParticipants: 0 };
}

export const RoomInfo = {
  encode(message: RoomInfo, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.roomName !== "") {
      writer.uint32(10).string(message.roomName);
    }
    if (message.numberOfParticipants !== 0) {
      writer.uint32(16).int32(message.numberOfParticipants);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): RoomInfo {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseRoomInfo();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.roomName = reader.string();
          break;
        case 2:
          message.numberOfParticipants = reader.int32();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): RoomInfo {
    return {
      roomName: isSet(object.roomName) ? String(object.roomName) : "",
      numberOfParticipants: isSet(object.numberOfParticipants) ? Number(object.numberOfParticipants) : 0,
    };
  },

  toJSON(message: RoomInfo): unknown {
    const obj: any = {};
    message.roomName !== undefined && (obj.roomName = message.roomName);
    message.numberOfParticipants !== undefined && (obj.numberOfParticipants = Math.round(message.numberOfParticipants));
    return obj;
  },

  create(base?: DeepPartial<RoomInfo>): RoomInfo {
    return RoomInfo.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<RoomInfo>): RoomInfo {
    const message = createBaseRoomInfo();
    message.roomName = object.roomName ?? "";
    message.numberOfParticipants = object.numberOfParticipants ?? 0;
    return message;
  },
};

function createBaseListRoomsResponse(): ListRoomsResponse {
  return { error: undefined, rooms: [] };
}

export const ListRoomsResponse = {
  encode(message: ListRoomsResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.error !== undefined) {
      writer.uint32(10).string(message.error);
    }
    for (const v of message.rooms) {
      RoomInfo.encode(v!, writer.uint32(18).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): ListRoomsResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseListRoomsResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.error = reader.string();
          break;
        case 2:
          message.rooms.push(RoomInfo.decode(reader, reader.uint32()));
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): ListRoomsResponse {
    return {
      error: isSet(object.error) ? String(object.error) : undefined,
      rooms: Array.isArray(object?.rooms) ? object.rooms.map((e: any) => RoomInfo.fromJSON(e)) : [],
    };
  },

  toJSON(message: ListRoomsResponse): unknown {
    const obj: any = {};
    message.error !== undefined && (obj.error = message.error);
    if (message.rooms) {
      obj.rooms = message.rooms.map((e) => e ? RoomInfo.toJSON(e) : undefined);
    } else {
      obj.rooms = [];
    }
    return obj;
  },

  create(base?: DeepPartial<ListRoomsResponse>): ListRoomsResponse {
    return ListRoomsResponse.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<ListRoomsResponse>): ListRoomsResponse {
    const message = createBaseListRoomsResponse();
    message.error = object.error ?? undefined;
    message.rooms = object.rooms?.map((e) => RoomInfo.fromPartial(e)) || [];
    return message;
  },
};

function createBaseDeleteRoomRequest(): DeleteRoomRequest {
  return { roomName: "" };
}

export const DeleteRoomRequest = {
  encode(message: DeleteRoomRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.roomName !== "") {
      writer.uint32(10).string(message.roomName);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): DeleteRoomRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseDeleteRoomRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.roomName = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): DeleteRoomRequest {
    return { roomName: isSet(object.roomName) ? String(object.roomName) : "" };
  },

  toJSON(message: DeleteRoomRequest): unknown {
    const obj: any = {};
    message.roomName !== undefined && (obj.roomName = message.roomName);
    return obj;
  },

  create(base?: DeepPartial<DeleteRoomRequest>): DeleteRoomRequest {
    return DeleteRoomRequest.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<DeleteRoomRequest>): DeleteRoomRequest {
    const message = createBaseDeleteRoomRequest();
    message.roomName = object.roomName ?? "";
    return message;
  },
};

function createBaseDeleteRoomResponse(): DeleteRoomResponse {
  return { error: undefined, success: false };
}

export const DeleteRoomResponse = {
  encode(message: DeleteRoomResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.error !== undefined) {
      writer.uint32(10).string(message.error);
    }
    if (message.success === true) {
      writer.uint32(16).bool(message.success);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): DeleteRoomResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseDeleteRoomResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.error = reader.string();
          break;
        case 2:
          message.success = reader.bool();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): DeleteRoomResponse {
    return {
      error: isSet(object.error) ? String(object.error) : undefined,
      success: isSet(object.success) ? Boolean(object.success) : false,
    };
  },

  toJSON(message: DeleteRoomResponse): unknown {
    const obj: any = {};
    message.error !== undefined && (obj.error = message.error);
    message.success !== undefined && (obj.success = message.success);
    return obj;
  },

  create(base?: DeepPartial<DeleteRoomResponse>): DeleteRoomResponse {
    return DeleteRoomResponse.fromPartial(base ?? {});
  },

  fromPartial(object: DeepPartial<DeleteRoomResponse>): DeleteRoomResponse {
    const message = createBaseDeleteRoomResponse();
    message.error = object.error ?? undefined;
    message.success = object.success ?? false;
    return message;
  },
};

export type RoomControlServiceDefinition = typeof RoomControlServiceDefinition;
export const RoomControlServiceDefinition = {
  name: "RoomControlService",
  fullName: "room_control_service.RoomControlService",
  methods: {
    createRoom: {
      name: "CreateRoom",
      requestType: CreateRoomRequest,
      requestStream: false,
      responseType: CreateRoomResponse,
      responseStream: false,
      options: {},
    },
    allowJoin: {
      name: "AllowJoin",
      requestType: AllowJoinRequest,
      requestStream: false,
      responseType: AllowJoinResponse,
      responseStream: false,
      options: {},
    },
    listRooms: {
      name: "ListRooms",
      requestType: ListRoomsRequest,
      requestStream: false,
      responseType: ListRoomsResponse,
      responseStream: false,
      options: {},
    },
    deleteRoom: {
      name: "DeleteRoom",
      requestType: DeleteRoomRequest,
      requestStream: false,
      responseType: DeleteRoomResponse,
      responseStream: false,
      options: {},
    },
  },
} as const;

export interface RoomControlServiceImplementation<CallContextExt = {}> {
  createRoom(
    request: CreateRoomRequest,
    context: CallContext & CallContextExt,
  ): Promise<DeepPartial<CreateRoomResponse>>;
  allowJoin(request: AllowJoinRequest, context: CallContext & CallContextExt): Promise<DeepPartial<AllowJoinResponse>>;
  listRooms(request: ListRoomsRequest, context: CallContext & CallContextExt): Promise<DeepPartial<ListRoomsResponse>>;
  deleteRoom(
    request: DeleteRoomRequest,
    context: CallContext & CallContextExt,
  ): Promise<DeepPartial<DeleteRoomResponse>>;
}

export interface RoomControlServiceClient<CallOptionsExt = {}> {
  createRoom(
    request: DeepPartial<CreateRoomRequest>,
    options?: CallOptions & CallOptionsExt,
  ): Promise<CreateRoomResponse>;
  allowJoin(request: DeepPartial<AllowJoinRequest>, options?: CallOptions & CallOptionsExt): Promise<AllowJoinResponse>;
  listRooms(request: DeepPartial<ListRoomsRequest>, options?: CallOptions & CallOptionsExt): Promise<ListRoomsResponse>;
  deleteRoom(
    request: DeepPartial<DeleteRoomRequest>,
    options?: CallOptions & CallOptionsExt,
  ): Promise<DeleteRoomResponse>;
}

type Builtin = Date | Function | Uint8Array | string | number | boolean | undefined;

export type DeepPartial<T> = T extends Builtin ? T
  : T extends Array<infer U> ? Array<DeepPartial<U>> : T extends ReadonlyArray<infer U> ? ReadonlyArray<DeepPartial<U>>
  : T extends {} ? { [K in keyof T]?: DeepPartial<T[K]> }
  : Partial<T>;

function isSet(value: any): boolean {
  return value !== null && value !== undefined;
}
