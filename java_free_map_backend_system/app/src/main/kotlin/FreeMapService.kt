package kotlin_free_map_backend_system

import generated_grpc.free_map_service_grpc.FreeMapServiceGrpc
import generated_grpc.free_map_service_grpc.free_map_service_grpc_types.*
import io.grpc.stub.ServerCalls
import io.grpc.stub.StreamObserver

class FreeMapService: FreeMapServiceGrpc.FreeMapServiceImplBase()  {
    var freeMapDatabaseHandler: FreeMapDatabaseHandler = FreeMapDatabaseHandler()

    override fun searchPlaces(
        request: SearchPlacesRequest?,
        responseObserver: StreamObserver<SearchPlacesResponse?>?
    ) {
        if (responseObserver == null) {
            ServerCalls.asyncUnimplementedUnaryCall(FreeMapServiceGrpc.getSearchPlacesMethod(), responseObserver)
            return
        }

        responseObserver.onNext(null);
        responseObserver.onCompleted();
    }

    override fun addPlace(
        request: AddPlaceRequest?,
        responseObserver: StreamObserver<AddPlaceResponse?>?
    ) {
        if (responseObserver == null) {
            ServerCalls.asyncUnimplementedUnaryCall(FreeMapServiceGrpc.getAddPlaceMethod(), responseObserver)
            return
        }

        var one_location = request?.locationOfFreeMap
        if (one_location != null) {
            var error = ""

            try {
                freeMapDatabaseHandler.insert_one_record_to_free_map(one_location)
            } catch (e: Exception) {
                println(e)
                error = e.toString()
            }

            responseObserver.onNext(
                AddPlaceResponse.newBuilder()
                    .setError(error).setSuccess(true)
                    .build()
            );
        }

        responseObserver.onCompleted();
    }

    override fun deletePlace(
        request: DeleteRequest?,
        responseObserver: StreamObserver<DeleteResponse?>?
    ) {
        if (responseObserver == null) {
            ServerCalls.asyncUnimplementedUnaryCall(FreeMapServiceGrpc.getDeletePlaceMethod(), responseObserver)
            return
        }

        responseObserver?.onNext(
            DeleteResponse.newBuilder()
            .setError("").setSuccess(true)
            .build()
        )
        responseObserver?.onCompleted()
    }
}