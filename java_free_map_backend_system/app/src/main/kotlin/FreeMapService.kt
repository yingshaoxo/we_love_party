package kotlin_free_map_backend_system

import generated_grpc.free_map_service_grpc.FreeMapServiceGrpc
import generated_grpc.free_map_service_grpc.free_map_service_grpc_types.*
import grpc_key_string_maps.free_map_service_key_string_maps
import io.grpc.stub.ServerCalls
import io.grpc.stub.StreamObserver

fun check_if_position_is_valid(one_location: LocationOfFreeMap?): Pair<Boolean, Exception?> {
    if (one_location == null) {
        return Pair(false, Exception("the location object you gave me is null"))
    }

    // data pre-check
    if (one_location.scores < 0 || one_location.scores > 5) {
        return Pair(false,Exception(
            "${free_map_service_key_string_maps.Companion.LocationOfFreeMap.scores} should be inside the range of [0, 5]"
        ))
    }

    if (one_location.xLongitude < -90 || one_location.xLongitude > 90) {
        return Pair(false,Exception(
            "${free_map_service_key_string_maps.Companion.LocationOfFreeMap.x_longitude} should be inside the range of [-90, 90]"
        ))
    }

    if (one_location.yLatitude < -90 || one_location.yLatitude > 90) {
        return Pair(false,Exception(
            "${free_map_service_key_string_maps.Companion.LocationOfFreeMap.y_latitude} should be inside the range of [-90, 90]"
        ))
    }

    if (one_location.name.isBlank()) {
        return Pair(false,Exception(
            "${free_map_service_key_string_maps.Companion.LocationOfFreeMap.name} should have a value"
        ))
    }

    if (one_location.uploaderEmail.isBlank()) {
        return Pair(false,Exception(
            "${free_map_service_key_string_maps.Companion.LocationOfFreeMap.uploader_email} should have a value"
        ))
    }

    return Pair(true, null);
}

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

        try {
            var one_location = request?.locationOfFreeMap

            // data pre-check
            var (valid, error) = check_if_position_is_valid(one_location=one_location)
            if (!valid) {
                if (error != null) {
                    throw error
                }
            }

            if (one_location != null) {
                freeMapDatabaseHandler.insert_one_record_to_free_map(one_location)
            }

            responseObserver.onNext(
                AddPlaceResponse.newBuilder()
                    .setError("").setSuccess(true)
                    .build()
            );
        } catch (e: Exception) {
            println(e)

            responseObserver.onNext(
                AddPlaceResponse.newBuilder()
                    .setError(e.toString()).setSuccess(false)
                    .build()
            );
        } finally {
            responseObserver.onCompleted();
        }
    }


    override fun updatePlace(
        request: UpdatePlaceRequest?,
        responseObserver: StreamObserver<UpdatePlaceResponse?>?
    ) {
        if (responseObserver == null) {
            ServerCalls.asyncUnimplementedUnaryCall(FreeMapServiceGrpc.getUpdatePlaceMethod(), responseObserver)
            return
        }

        try {
            var one_location = request?.locationOfFreeMap

            // data pre-check
            var (valid, error) = check_if_position_is_valid(one_location=one_location)
            if (!valid) {
                if (error != null) {
                    throw error
                }
            }

            if (one_location != null) {
                freeMapDatabaseHandler.update_one_record_to_free_map(one_location)
            }

            responseObserver.onNext(
                UpdatePlaceResponse.newBuilder()
                    .setError("").setSuccess(true)
                    .build()
            );
        } catch (e: Exception) {
            println(e)

            responseObserver.onNext(
                UpdatePlaceResponse.newBuilder()
                    .setError(e.toString()).setSuccess(false)
                    .build()
            );
        } finally {
            responseObserver.onCompleted();
        }
    }

    override fun deletePlace(
        request: DeletePlaceRequest?,
        responseObserver: StreamObserver<DeletePlaceResponse?>?
    ) {
        if (responseObserver == null) {
            ServerCalls.asyncUnimplementedUnaryCall(FreeMapServiceGrpc.getDeletePlaceMethod(), responseObserver)
            return
        }

        try {
            if (request != null) {
                var one_location = LocationOfFreeMap.newBuilder().setLocationId(request.locationId).build();
                freeMapDatabaseHandler.delete_one_record_to_free_map(one_location)

                responseObserver.onNext(
                    DeletePlaceResponse.newBuilder()
                        .setError("").
                        setSuccess(true)
                        .build()
                )
            } else {
                throw Exception("the request you gave me is null")
            }
        } catch (e: Exception) {
            responseObserver.onNext(
                DeletePlaceResponse.newBuilder()
                    .setError(e.toString()).
                    setSuccess(false)
                    .build()
            )
        } finally {
            responseObserver.onCompleted();
        }
    }
}