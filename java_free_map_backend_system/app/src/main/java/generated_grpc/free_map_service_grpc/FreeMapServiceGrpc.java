package generated_grpc.free_map_service_grpc;

import static io.grpc.MethodDescriptor.generateFullMethodName;

/**
 */
@javax.annotation.Generated(
    value = "by gRPC proto compiler (version 1.46.0)",
    comments = "Source: free_map_service.proto")
@io.grpc.stub.annotations.GrpcGenerated
public final class FreeMapServiceGrpc {

  private FreeMapServiceGrpc() {}

  public static final String SERVICE_NAME = "free_map_service.FreeMapService";

  // Static method descriptors that strictly reflect the proto.
  private static volatile io.grpc.MethodDescriptor<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest,
      generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse> getSearchPlacesMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "SearchPlaces",
      requestType = generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest.class,
      responseType = generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest,
      generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse> getSearchPlacesMethod() {
    io.grpc.MethodDescriptor<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest, generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse> getSearchPlacesMethod;
    if ((getSearchPlacesMethod = FreeMapServiceGrpc.getSearchPlacesMethod) == null) {
      synchronized (FreeMapServiceGrpc.class) {
        if ((getSearchPlacesMethod = FreeMapServiceGrpc.getSearchPlacesMethod) == null) {
          FreeMapServiceGrpc.getSearchPlacesMethod = getSearchPlacesMethod =
              io.grpc.MethodDescriptor.<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest, generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(SERVICE_NAME, "SearchPlaces"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse.getDefaultInstance()))
              .setSchemaDescriptor(new FreeMapServiceMethodDescriptorSupplier("SearchPlaces"))
              .build();
        }
      }
    }
    return getSearchPlacesMethod;
  }

  private static volatile io.grpc.MethodDescriptor<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest,
      generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse> getAddPlaceMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "AddPlace",
      requestType = generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest.class,
      responseType = generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest,
      generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse> getAddPlaceMethod() {
    io.grpc.MethodDescriptor<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest, generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse> getAddPlaceMethod;
    if ((getAddPlaceMethod = FreeMapServiceGrpc.getAddPlaceMethod) == null) {
      synchronized (FreeMapServiceGrpc.class) {
        if ((getAddPlaceMethod = FreeMapServiceGrpc.getAddPlaceMethod) == null) {
          FreeMapServiceGrpc.getAddPlaceMethod = getAddPlaceMethod =
              io.grpc.MethodDescriptor.<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest, generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(SERVICE_NAME, "AddPlace"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse.getDefaultInstance()))
              .setSchemaDescriptor(new FreeMapServiceMethodDescriptorSupplier("AddPlace"))
              .build();
        }
      }
    }
    return getAddPlaceMethod;
  }

  private static volatile io.grpc.MethodDescriptor<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest,
      generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse> getDeletePlaceMethod;

  @io.grpc.stub.annotations.RpcMethod(
      fullMethodName = SERVICE_NAME + '/' + "DeletePlace",
      requestType = generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest.class,
      responseType = generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse.class,
      methodType = io.grpc.MethodDescriptor.MethodType.UNARY)
  public static io.grpc.MethodDescriptor<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest,
      generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse> getDeletePlaceMethod() {
    io.grpc.MethodDescriptor<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest, generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse> getDeletePlaceMethod;
    if ((getDeletePlaceMethod = FreeMapServiceGrpc.getDeletePlaceMethod) == null) {
      synchronized (FreeMapServiceGrpc.class) {
        if ((getDeletePlaceMethod = FreeMapServiceGrpc.getDeletePlaceMethod) == null) {
          FreeMapServiceGrpc.getDeletePlaceMethod = getDeletePlaceMethod =
              io.grpc.MethodDescriptor.<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest, generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse>newBuilder()
              .setType(io.grpc.MethodDescriptor.MethodType.UNARY)
              .setFullMethodName(generateFullMethodName(SERVICE_NAME, "DeletePlace"))
              .setSampledToLocalTracing(true)
              .setRequestMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest.getDefaultInstance()))
              .setResponseMarshaller(io.grpc.protobuf.ProtoUtils.marshaller(
                  generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse.getDefaultInstance()))
              .setSchemaDescriptor(new FreeMapServiceMethodDescriptorSupplier("DeletePlace"))
              .build();
        }
      }
    }
    return getDeletePlaceMethod;
  }

  /**
   * Creates a new async stub that supports all call types for the service
   */
  public static FreeMapServiceStub newStub(io.grpc.Channel channel) {
    io.grpc.stub.AbstractStub.StubFactory<FreeMapServiceStub> factory =
      new io.grpc.stub.AbstractStub.StubFactory<FreeMapServiceStub>() {
        @java.lang.Override
        public FreeMapServiceStub newStub(io.grpc.Channel channel, io.grpc.CallOptions callOptions) {
          return new FreeMapServiceStub(channel, callOptions);
        }
      };
    return FreeMapServiceStub.newStub(factory, channel);
  }

  /**
   * Creates a new blocking-style stub that supports unary and streaming output calls on the service
   */
  public static FreeMapServiceBlockingStub newBlockingStub(
      io.grpc.Channel channel) {
    io.grpc.stub.AbstractStub.StubFactory<FreeMapServiceBlockingStub> factory =
      new io.grpc.stub.AbstractStub.StubFactory<FreeMapServiceBlockingStub>() {
        @java.lang.Override
        public FreeMapServiceBlockingStub newStub(io.grpc.Channel channel, io.grpc.CallOptions callOptions) {
          return new FreeMapServiceBlockingStub(channel, callOptions);
        }
      };
    return FreeMapServiceBlockingStub.newStub(factory, channel);
  }

  /**
   * Creates a new ListenableFuture-style stub that supports unary calls on the service
   */
  public static FreeMapServiceFutureStub newFutureStub(
      io.grpc.Channel channel) {
    io.grpc.stub.AbstractStub.StubFactory<FreeMapServiceFutureStub> factory =
      new io.grpc.stub.AbstractStub.StubFactory<FreeMapServiceFutureStub>() {
        @java.lang.Override
        public FreeMapServiceFutureStub newStub(io.grpc.Channel channel, io.grpc.CallOptions callOptions) {
          return new FreeMapServiceFutureStub(channel, callOptions);
        }
      };
    return FreeMapServiceFutureStub.newStub(factory, channel);
  }

  /**
   */
  public static abstract class FreeMapServiceImplBase implements io.grpc.BindableService {

    /**
     */
    public void searchPlaces(generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest request,
        io.grpc.stub.StreamObserver<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse> responseObserver) {
      io.grpc.stub.ServerCalls.asyncUnimplementedUnaryCall(getSearchPlacesMethod(), responseObserver);
    }

    /**
     */
    public void addPlace(generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest request,
        io.grpc.stub.StreamObserver<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse> responseObserver) {
      io.grpc.stub.ServerCalls.asyncUnimplementedUnaryCall(getAddPlaceMethod(), responseObserver);
    }

    /**
     */
    public void deletePlace(generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest request,
        io.grpc.stub.StreamObserver<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse> responseObserver) {
      io.grpc.stub.ServerCalls.asyncUnimplementedUnaryCall(getDeletePlaceMethod(), responseObserver);
    }

    @java.lang.Override public final io.grpc.ServerServiceDefinition bindService() {
      return io.grpc.ServerServiceDefinition.builder(getServiceDescriptor())
          .addMethod(
            getSearchPlacesMethod(),
            io.grpc.stub.ServerCalls.asyncUnaryCall(
              new MethodHandlers<
                generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest,
                generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse>(
                  this, METHODID_SEARCH_PLACES)))
          .addMethod(
            getAddPlaceMethod(),
            io.grpc.stub.ServerCalls.asyncUnaryCall(
              new MethodHandlers<
                generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest,
                generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse>(
                  this, METHODID_ADD_PLACE)))
          .addMethod(
            getDeletePlaceMethod(),
            io.grpc.stub.ServerCalls.asyncUnaryCall(
              new MethodHandlers<
                generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest,
                generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse>(
                  this, METHODID_DELETE_PLACE)))
          .build();
    }
  }

  /**
   */
  public static final class FreeMapServiceStub extends io.grpc.stub.AbstractAsyncStub<FreeMapServiceStub> {
    private FreeMapServiceStub(
        io.grpc.Channel channel, io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected FreeMapServiceStub build(
        io.grpc.Channel channel, io.grpc.CallOptions callOptions) {
      return new FreeMapServiceStub(channel, callOptions);
    }

    /**
     */
    public void searchPlaces(generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest request,
        io.grpc.stub.StreamObserver<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse> responseObserver) {
      io.grpc.stub.ClientCalls.asyncUnaryCall(
          getChannel().newCall(getSearchPlacesMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void addPlace(generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest request,
        io.grpc.stub.StreamObserver<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse> responseObserver) {
      io.grpc.stub.ClientCalls.asyncUnaryCall(
          getChannel().newCall(getAddPlaceMethod(), getCallOptions()), request, responseObserver);
    }

    /**
     */
    public void deletePlace(generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest request,
        io.grpc.stub.StreamObserver<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse> responseObserver) {
      io.grpc.stub.ClientCalls.asyncUnaryCall(
          getChannel().newCall(getDeletePlaceMethod(), getCallOptions()), request, responseObserver);
    }
  }

  /**
   */
  public static final class FreeMapServiceBlockingStub extends io.grpc.stub.AbstractBlockingStub<FreeMapServiceBlockingStub> {
    private FreeMapServiceBlockingStub(
        io.grpc.Channel channel, io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected FreeMapServiceBlockingStub build(
        io.grpc.Channel channel, io.grpc.CallOptions callOptions) {
      return new FreeMapServiceBlockingStub(channel, callOptions);
    }

    /**
     */
    public generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse searchPlaces(generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest request) {
      return io.grpc.stub.ClientCalls.blockingUnaryCall(
          getChannel(), getSearchPlacesMethod(), getCallOptions(), request);
    }

    /**
     */
    public generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse addPlace(generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest request) {
      return io.grpc.stub.ClientCalls.blockingUnaryCall(
          getChannel(), getAddPlaceMethod(), getCallOptions(), request);
    }

    /**
     */
    public generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse deletePlace(generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest request) {
      return io.grpc.stub.ClientCalls.blockingUnaryCall(
          getChannel(), getDeletePlaceMethod(), getCallOptions(), request);
    }
  }

  /**
   */
  public static final class FreeMapServiceFutureStub extends io.grpc.stub.AbstractFutureStub<FreeMapServiceFutureStub> {
    private FreeMapServiceFutureStub(
        io.grpc.Channel channel, io.grpc.CallOptions callOptions) {
      super(channel, callOptions);
    }

    @java.lang.Override
    protected FreeMapServiceFutureStub build(
        io.grpc.Channel channel, io.grpc.CallOptions callOptions) {
      return new FreeMapServiceFutureStub(channel, callOptions);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse> searchPlaces(
        generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest request) {
      return io.grpc.stub.ClientCalls.futureUnaryCall(
          getChannel().newCall(getSearchPlacesMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse> addPlace(
        generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest request) {
      return io.grpc.stub.ClientCalls.futureUnaryCall(
          getChannel().newCall(getAddPlaceMethod(), getCallOptions()), request);
    }

    /**
     */
    public com.google.common.util.concurrent.ListenableFuture<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse> deletePlace(
        generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest request) {
      return io.grpc.stub.ClientCalls.futureUnaryCall(
          getChannel().newCall(getDeletePlaceMethod(), getCallOptions()), request);
    }
  }

  private static final int METHODID_SEARCH_PLACES = 0;
  private static final int METHODID_ADD_PLACE = 1;
  private static final int METHODID_DELETE_PLACE = 2;

  private static final class MethodHandlers<Req, Resp> implements
      io.grpc.stub.ServerCalls.UnaryMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ServerStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.ClientStreamingMethod<Req, Resp>,
      io.grpc.stub.ServerCalls.BidiStreamingMethod<Req, Resp> {
    private final FreeMapServiceImplBase serviceImpl;
    private final int methodId;

    MethodHandlers(FreeMapServiceImplBase serviceImpl, int methodId) {
      this.serviceImpl = serviceImpl;
      this.methodId = methodId;
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public void invoke(Req request, io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        case METHODID_SEARCH_PLACES:
          serviceImpl.searchPlaces((generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesRequest) request,
              (io.grpc.stub.StreamObserver<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.SearchPlacesResponse>) responseObserver);
          break;
        case METHODID_ADD_PLACE:
          serviceImpl.addPlace((generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceRequest) request,
              (io.grpc.stub.StreamObserver<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.AddPlaceResponse>) responseObserver);
          break;
        case METHODID_DELETE_PLACE:
          serviceImpl.deletePlace((generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteRequest) request,
              (io.grpc.stub.StreamObserver<generated_grpc.free_map_service_grpc.free_map_service_grpc_types.DeleteResponse>) responseObserver);
          break;
        default:
          throw new AssertionError();
      }
    }

    @java.lang.Override
    @java.lang.SuppressWarnings("unchecked")
    public io.grpc.stub.StreamObserver<Req> invoke(
        io.grpc.stub.StreamObserver<Resp> responseObserver) {
      switch (methodId) {
        default:
          throw new AssertionError();
      }
    }
  }

  private static abstract class FreeMapServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoFileDescriptorSupplier, io.grpc.protobuf.ProtoServiceDescriptorSupplier {
    FreeMapServiceBaseDescriptorSupplier() {}

    @java.lang.Override
    public com.google.protobuf.Descriptors.FileDescriptor getFileDescriptor() {
      return generated_grpc.free_map_service_grpc.free_map_service_grpc_types.getDescriptor();
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.ServiceDescriptor getServiceDescriptor() {
      return getFileDescriptor().findServiceByName("FreeMapService");
    }
  }

  private static final class FreeMapServiceFileDescriptorSupplier
      extends FreeMapServiceBaseDescriptorSupplier {
    FreeMapServiceFileDescriptorSupplier() {}
  }

  private static final class FreeMapServiceMethodDescriptorSupplier
      extends FreeMapServiceBaseDescriptorSupplier
      implements io.grpc.protobuf.ProtoMethodDescriptorSupplier {
    private final String methodName;

    FreeMapServiceMethodDescriptorSupplier(String methodName) {
      this.methodName = methodName;
    }

    @java.lang.Override
    public com.google.protobuf.Descriptors.MethodDescriptor getMethodDescriptor() {
      return getServiceDescriptor().findMethodByName(methodName);
    }
  }

  private static volatile io.grpc.ServiceDescriptor serviceDescriptor;

  public static io.grpc.ServiceDescriptor getServiceDescriptor() {
    io.grpc.ServiceDescriptor result = serviceDescriptor;
    if (result == null) {
      synchronized (FreeMapServiceGrpc.class) {
        result = serviceDescriptor;
        if (result == null) {
          serviceDescriptor = result = io.grpc.ServiceDescriptor.newBuilder(SERVICE_NAME)
              .setSchemaDescriptor(new FreeMapServiceFileDescriptorSupplier())
              .addMethod(getSearchPlacesMethod())
              .addMethod(getAddPlaceMethod())
              .addMethod(getDeletePlaceMethod())
              .build();
        }
      }
    }
    return result;
  }
}
