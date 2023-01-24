// package: internal_api_service
// file: internal_api_service.proto

import * as jspb from "google-protobuf";

export class CreateAUserRequest extends jspb.Message {
  getEmail(): string;
  setEmail(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateAUserRequest.AsObject;
  static toObject(includeInstance: boolean, msg: CreateAUserRequest): CreateAUserRequest.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: CreateAUserRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateAUserRequest;
  static deserializeBinaryFromReader(message: CreateAUserRequest, reader: jspb.BinaryReader): CreateAUserRequest;
}

export namespace CreateAUserRequest {
  export type AsObject = {
    email: string,
  }
}

export class CreateAUserResponse extends jspb.Message {
  getResult(): string;
  setResult(value: string): void;

  hasError(): boolean;
  clearError(): void;
  getError(): string;
  setError(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CreateAUserResponse.AsObject;
  static toObject(includeInstance: boolean, msg: CreateAUserResponse): CreateAUserResponse.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: CreateAUserResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CreateAUserResponse;
  static deserializeBinaryFromReader(message: CreateAUserResponse, reader: jspb.BinaryReader): CreateAUserResponse;
}

export namespace CreateAUserResponse {
  export type AsObject = {
    result: string,
    error: string,
  }
}

export class DeleteAUserRequest extends jspb.Message {
  getEmail(): string;
  setEmail(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): DeleteAUserRequest.AsObject;
  static toObject(includeInstance: boolean, msg: DeleteAUserRequest): DeleteAUserRequest.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: DeleteAUserRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): DeleteAUserRequest;
  static deserializeBinaryFromReader(message: DeleteAUserRequest, reader: jspb.BinaryReader): DeleteAUserRequest;
}

export namespace DeleteAUserRequest {
  export type AsObject = {
    email: string,
  }
}

export class DeleteAUserResponse extends jspb.Message {
  getResult(): string;
  setResult(value: string): void;

  hasError(): boolean;
  clearError(): void;
  getError(): string;
  setError(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): DeleteAUserResponse.AsObject;
  static toObject(includeInstance: boolean, msg: DeleteAUserResponse): DeleteAUserResponse.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: DeleteAUserResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): DeleteAUserResponse;
  static deserializeBinaryFromReader(message: DeleteAUserResponse, reader: jspb.BinaryReader): DeleteAUserResponse;
}

export namespace DeleteAUserResponse {
  export type AsObject = {
    result: string,
    error: string,
  }
}

export class GetUserRequest extends jspb.Message {
  getEmail(): string;
  setEmail(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetUserRequest.AsObject;
  static toObject(includeInstance: boolean, msg: GetUserRequest): GetUserRequest.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: GetUserRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetUserRequest;
  static deserializeBinaryFromReader(message: GetUserRequest, reader: jspb.BinaryReader): GetUserRequest;
}

export namespace GetUserRequest {
  export type AsObject = {
    email: string,
  }
}

export class GetUserResponse extends jspb.Message {
  hasError(): boolean;
  clearError(): void;
  getError(): string;
  setError(value: string): void;

  getUserExists(): boolean;
  setUserExists(value: boolean): void;

  getEmail(): string;
  setEmail(value: string): void;

  hasUsername(): boolean;
  clearUsername(): void;
  getUsername(): string;
  setUsername(value: string): void;

  hasHeadImage(): boolean;
  clearHeadImage(): void;
  getHeadImage(): string;
  setHeadImage(value: string): void;

  hasSex(): boolean;
  clearSex(): void;
  getSex(): number;
  setSex(value: number): void;

  hasAge(): boolean;
  clearAge(): void;
  getAge(): number;
  setAge(value: number): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetUserResponse.AsObject;
  static toObject(includeInstance: boolean, msg: GetUserResponse): GetUserResponse.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: GetUserResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetUserResponse;
  static deserializeBinaryFromReader(message: GetUserResponse, reader: jspb.BinaryReader): GetUserResponse;
}

export namespace GetUserResponse {
  export type AsObject = {
    error: string,
    userExists: boolean,
    email: string,
    username: string,
    headImage: string,
    sex: number,
    age: number,
  }
}

export class CheckIfUserExistsRequest extends jspb.Message {
  getEmail(): string;
  setEmail(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CheckIfUserExistsRequest.AsObject;
  static toObject(includeInstance: boolean, msg: CheckIfUserExistsRequest): CheckIfUserExistsRequest.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: CheckIfUserExistsRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CheckIfUserExistsRequest;
  static deserializeBinaryFromReader(message: CheckIfUserExistsRequest, reader: jspb.BinaryReader): CheckIfUserExistsRequest;
}

export namespace CheckIfUserExistsRequest {
  export type AsObject = {
    email: string,
  }
}

export class CheckIfUserExistsResponse extends jspb.Message {
  hasError(): boolean;
  clearError(): void;
  getError(): string;
  setError(value: string): void;

  getUserExists(): boolean;
  setUserExists(value: boolean): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): CheckIfUserExistsResponse.AsObject;
  static toObject(includeInstance: boolean, msg: CheckIfUserExistsResponse): CheckIfUserExistsResponse.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: CheckIfUserExistsResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): CheckIfUserExistsResponse;
  static deserializeBinaryFromReader(message: CheckIfUserExistsResponse, reader: jspb.BinaryReader): CheckIfUserExistsResponse;
}

export namespace CheckIfUserExistsResponse {
  export type AsObject = {
    error: string,
    userExists: boolean,
  }
}

