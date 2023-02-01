package kotlin_free_map_backend_system

import generated_grpc.free_map_service_grpc.FreeMapServiceGrpc
import generated_grpc.free_map_service_grpc.free_map_service_grpc_types.*
import io.grpc.stub.ServerCalls
import io.grpc.stub.StreamObserver

class FreeMapService: FreeMapServiceGrpc.FreeMapServiceImplBase()  {
    override fun searchPlaces(
        request: SearchPlacesRequest?,
        responseObserver: StreamObserver<SearchPlacesResponse?>?
    ) {
        if (responseObserver != null) {
            responseObserver.onNext(null);
            responseObserver.onCompleted();
        }
//        ServerCalls.asyncUnimplementedUnaryCall(FreeMapServiceGrpc.getSearchPlacesMethod(), responseObserver)
    }

    override fun addPlace(
        request: AddPlaceRequest?,
        responseObserver: StreamObserver<AddPlaceResponse?>?
    ) {
        ServerCalls.asyncUnimplementedUnaryCall(FreeMapServiceGrpc.getAddPlaceMethod(), responseObserver)
    }

    override fun deletePlace(
        request: DeleteRequest?,
        responseObserver: StreamObserver<DeleteResponse?>?
    ) {
        responseObserver?.onNext(DeleteResponse.newBuilder()
            .setError("").setSuccess(true)
            .build())
        responseObserver?.onCompleted()
//        ServerCalls.asyncUnimplementedUnaryCall(FreeMapServiceGrpc.getDeletePlaceMethod(), responseObserver)
    }
}