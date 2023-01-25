import * as grpc from "@grpc/grpc-js";

// import * as room_control_service_grpc_pb from './generated_grpc/room_control_service_grpc_pb';
// import * as room_control_service_pb from './generated_grpc/room_control_service_pb';

import * as room_control_service_grpc from './generated_grpc/room_control_service';
import {isAbortError} from 'abort-controller-x';

import { AccessToken, RoomServiceClient, Room } from 'livekit-server-sdk';

import { CallContext, createServer, ServerError, ServerMiddlewareCall, Status } from "nice-grpc";


const apiKeyAndValueObject = {
    apiKey: process?.env?.livekit_key??"",
    apiValue: process?.env?.livekit_value??""
}


const theLiveKitControlPort = '7880';
let livekitHost = `http://0.0.0.0:${theLiveKitControlPort}`;
if (process?.env?.livekit_NETWORK_NAME) {
    livekitHost = `http://${process.env.livekit_NETWORK_NAME}:${theLiveKitControlPort}`;
}
const svc = new RoomServiceClient(livekitHost, apiKeyAndValueObject.apiKey, apiKeyAndValueObject.apiValue);


const the_internal_api_port = "40050"
let the_internal_api_host = `http://0.0.0.0:${the_internal_api_port}`;
if (process?.env?.weloveparty_internal_api_service_NETWORK_NAME) {
    the_internal_api_host = `http://${process.env.weloveparty_internal_api_service_NETWORK_NAME}:${the_internal_api_port}`;
}


class MyRoomControlService implements room_control_service_grpc.RoomControlServiceImplementation {
  async createRoom(request: room_control_service_grpc.CreateRoomRequest, context: CallContext): Promise<{ error?: string | undefined; success?: boolean | undefined; }> {
        const response = {} as room_control_service_grpc.CreateRoomResponse;

        console.log(request);

        try {
            let room = await svc.createRoom({
                name: request.roomName,
                emptyTimeout: 60,
                maxParticipants: 5
            })
            console.log(`room created: ${room.name}`);
            response.success = true;
        } catch (e) {
            console.log(`error: ${String(e)}`);
            response.success = false;
            response.error = String(e);
        }

        return response;
  }
  async allowJoin(request: room_control_service_grpc.AllowJoinRequest, context: CallContext): Promise<{
      error?: string | undefined; 
      accessToken?: string | undefined;
  }> {
        const response = {} as room_control_service_grpc.AllowJoinResponse;

        console.log(request);

        try {
            const at = new AccessToken(apiKeyAndValueObject.apiKey, apiKeyAndValueObject.apiValue, {
                identity: request.identity,
                // name: call.request.getIdentity()
            });
            at.addGrant({ roomJoin: true, room: request.roomName, canPublish: true, canSubscribe: true });
            response.accessToken = at.toJwt()
        } catch (err) {
            console.log(err);
            response.error = String(err)
            response.accessToken = ""
        } 

        return response
  }
  async listRooms(request: room_control_service_grpc.ListRoomsRequest, context: CallContext): Promise<{ error?: string | undefined; rooms?: { roomName?: string | undefined; numberOfParticipants?: number | undefined; }[] | undefined; }> {
        const response = {} as room_control_service_grpc.ListRoomsResponse;

        console.log(request);

        try {
            let rooms = await svc.listRooms()
            response.rooms = rooms.map((room: Room) => {
                const roomInfo = {} as room_control_service_grpc.RoomInfo;
                roomInfo.roomName = room.name;
                roomInfo.numberOfParticipants = room.numParticipants
                return roomInfo;
            })
        } catch (e) {
            response.error = String(e)
        }

        return response
  }
  async deleteRoom(request: room_control_service_grpc.DeleteRoomRequest, context: CallContext): Promise<{ error?: string | undefined; success?: boolean | undefined; }> {
    const response = {} as room_control_service_grpc.DeleteRoomResponse;

    console.log(request);

    try {
        await svc.deleteRoom(request.roomName)
        response.success = true
    } catch (e) {
        response.error = String(e)
        response.success = false
    }

    return response
  }
}

async function* account_check_middleware<Request, Response>(
  call: ServerMiddlewareCall<Request, Response>,
  context: CallContext,
) {
  try {
     const result = yield* call.next(call.request, context);
     return  result
  } catch (error: unknown) {
    if (error instanceof ServerError || isAbortError(error)) {
      throw error;
    }

    let details = 'Unknown server error occurred';

    throw new ServerError(Status.UNKNOWN, details);
  }
}

export const run = () => {
    const server = createServer(); //.use(middleware1).use(middleware2);

    server
    .with(account_check_middleware)
    .add(room_control_service_grpc.RoomControlServiceDefinition, new MyRoomControlService())

    server.listen("0.0.0.0:40054").then((port)=>{
        console.log(`\nServer started, listening on port ${port}`);
    })
}

export default run;