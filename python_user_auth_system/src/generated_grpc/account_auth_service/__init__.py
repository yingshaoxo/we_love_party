# Generated by the protocol buffer compiler.  DO NOT EDIT!
# sources: account_auth_service.proto
# plugin: python-betterproto
from dataclasses import dataclass
from typing import (
    TYPE_CHECKING,
    Dict,
    Optional,
)

import betterproto
import grpclib
from betterproto.grpc.grpclib_server import ServiceBase


if TYPE_CHECKING:
    import grpclib.server
    from betterproto.grpc.grpclib_client import MetadataLike
    from grpclib.metadata import Deadline


@dataclass(eq=False, repr=False)
class HelloRequest(betterproto.Message):
    name: str = betterproto.string_field(1)


@dataclass(eq=False, repr=False)
class HelloReply(betterproto.Message):
    message: str = betterproto.string_field(1)


@dataclass(eq=False, repr=False)
class Empty(betterproto.Message):
    pass


@dataclass(eq=False, repr=False)
class RegisterRequest(betterproto.Message):
    email: str = betterproto.string_field(1)


@dataclass(eq=False, repr=False)
class RegisterReply(betterproto.Message):
    result: str = betterproto.string_field(1)
    error: Optional[str] = betterproto.string_field(2, optional=True, group="_error")


@dataclass(eq=False, repr=False)
class RegisterConfirmRequest(betterproto.Message):
    email: str = betterproto.string_field(1)
    random_string: str = betterproto.string_field(2)


@dataclass(eq=False, repr=False)
class RegisterConfirmReply(betterproto.Message):
    jwt: str = betterproto.string_field(1)
    error: Optional[str] = betterproto.string_field(2, optional=True, group="_error")


@dataclass(eq=False, repr=False)
class IsJwtOkRequest(betterproto.Message):
    jwt: str = betterproto.string_field(1)


@dataclass(eq=False, repr=False)
class IsJwtOkReply(betterproto.Message):
    email: str = betterproto.string_field(1)
    error: Optional[str] = betterproto.string_field(2, optional=True, group="_error")


@dataclass(eq=False, repr=False)
class IsAdminRequest(betterproto.Message):
    jwt: str = betterproto.string_field(1)


@dataclass(eq=False, repr=False)
class IsAdminResponse(betterproto.Message):
    error: Optional[str] = betterproto.string_field(1, optional=True, group="_error")
    yes: bool = betterproto.bool_field(2)


@dataclass(eq=False, repr=False)
class IsOnlineRequest(betterproto.Message):
    email: Optional[str] = betterproto.string_field(1, optional=True, group="_email")


@dataclass(eq=False, repr=False)
class IsOnlineResponse(betterproto.Message):
    error: Optional[str] = betterproto.string_field(1, optional=True, group="_error")
    online: bool = betterproto.bool_field(2)


@dataclass(eq=False, repr=False)
class UserModel(betterproto.Message):
    email: str = betterproto.string_field(1)
    username: Optional[str] = betterproto.string_field(
        2, optional=True, group="_username"
    )
    head_image: Optional[str] = betterproto.string_field(
        3, optional=True, group="_head_image"
    )
    sex: Optional[int] = betterproto.int32_field(4, optional=True, group="_sex")
    age: Optional[int] = betterproto.int32_field(5, optional=True, group="_age")


@dataclass(eq=False, repr=False)
class LocationOfFreeMap(betterproto.Message):
    location_id: Optional[int] = betterproto.int32_field(
        1, optional=True, group="_location_id"
    )
    uploader_email: Optional[str] = betterproto.string_field(
        2, optional=True, group="_uploader_email"
    )
    name: str = betterproto.string_field(3)
    y_latitude: float = betterproto.double_field(4)
    x_longitude: float = betterproto.double_field(5)
    scores: float = betterproto.double_field(6)
    open_all_day: bool = betterproto.bool_field(7)
    has_charger: bool = betterproto.bool_field(8)
    has_wifi: bool = betterproto.bool_field(9)
    has_water: bool = betterproto.bool_field(10)
    has_hot_water: bool = betterproto.bool_field(11)
    has_desk: bool = betterproto.bool_field(12)
    has_chair: bool = betterproto.bool_field(13)
    has_toilet: bool = betterproto.bool_field(14)
    has_showering: bool = betterproto.bool_field(15)
    has_package_receiving_station: bool = betterproto.bool_field(16)
    has_kfc: bool = betterproto.bool_field(17)
    has_mcdonald: bool = betterproto.bool_field(18)
    has_store: bool = betterproto.bool_field(19)


class AccountAuthenticationServiceStub(betterproto.ServiceStub):
    async def say_hello(
        self,
        hello_request: "HelloRequest",
        *,
        timeout: Optional[float] = None,
        deadline: Optional["Deadline"] = None,
        metadata: Optional["MetadataLike"] = None
    ) -> "HelloReply":
        return await self._unary_unary(
            "/account_auth_service.AccountAuthenticationService/SayHello",
            hello_request,
            HelloReply,
            timeout=timeout,
            deadline=deadline,
            metadata=metadata,
        )

    async def user_register_request(
        self,
        register_request: "RegisterRequest",
        *,
        timeout: Optional[float] = None,
        deadline: Optional["Deadline"] = None,
        metadata: Optional["MetadataLike"] = None
    ) -> "RegisterReply":
        return await self._unary_unary(
            "/account_auth_service.AccountAuthenticationService/UserRegisterRequest",
            register_request,
            RegisterReply,
            timeout=timeout,
            deadline=deadline,
            metadata=metadata,
        )

    async def user_register_confirm(
        self,
        register_confirm_request: "RegisterConfirmRequest",
        *,
        timeout: Optional[float] = None,
        deadline: Optional["Deadline"] = None,
        metadata: Optional["MetadataLike"] = None
    ) -> "RegisterConfirmReply":
        return await self._unary_unary(
            "/account_auth_service.AccountAuthenticationService/UserRegisterConfirm",
            register_confirm_request,
            RegisterConfirmReply,
            timeout=timeout,
            deadline=deadline,
            metadata=metadata,
        )

    async def is_jwt_ok(
        self,
        is_jwt_ok_request: "IsJwtOkRequest",
        *,
        timeout: Optional[float] = None,
        deadline: Optional["Deadline"] = None,
        metadata: Optional["MetadataLike"] = None
    ) -> "IsJwtOkReply":
        return await self._unary_unary(
            "/account_auth_service.AccountAuthenticationService/IsJwtOk",
            is_jwt_ok_request,
            IsJwtOkReply,
            timeout=timeout,
            deadline=deadline,
            metadata=metadata,
        )

    async def is_admin(
        self,
        is_admin_request: "IsAdminRequest",
        *,
        timeout: Optional[float] = None,
        deadline: Optional["Deadline"] = None,
        metadata: Optional["MetadataLike"] = None
    ) -> "IsAdminResponse":
        return await self._unary_unary(
            "/account_auth_service.AccountAuthenticationService/IsAdmin",
            is_admin_request,
            IsAdminResponse,
            timeout=timeout,
            deadline=deadline,
            metadata=metadata,
        )

    async def is_online(
        self,
        is_online_request: "IsOnlineRequest",
        *,
        timeout: Optional[float] = None,
        deadline: Optional["Deadline"] = None,
        metadata: Optional["MetadataLike"] = None
    ) -> "IsOnlineResponse":
        return await self._unary_unary(
            "/account_auth_service.AccountAuthenticationService/IsOnline",
            is_online_request,
            IsOnlineResponse,
            timeout=timeout,
            deadline=deadline,
            metadata=metadata,
        )


class AccountAuthenticationServiceBase(ServiceBase):
    async def say_hello(self, hello_request: "HelloRequest") -> "HelloReply":
        raise grpclib.GRPCError(grpclib.const.Status.UNIMPLEMENTED)

    async def user_register_request(
        self, register_request: "RegisterRequest"
    ) -> "RegisterReply":
        raise grpclib.GRPCError(grpclib.const.Status.UNIMPLEMENTED)

    async def user_register_confirm(
        self, register_confirm_request: "RegisterConfirmRequest"
    ) -> "RegisterConfirmReply":
        raise grpclib.GRPCError(grpclib.const.Status.UNIMPLEMENTED)

    async def is_jwt_ok(self, is_jwt_ok_request: "IsJwtOkRequest") -> "IsJwtOkReply":
        raise grpclib.GRPCError(grpclib.const.Status.UNIMPLEMENTED)

    async def is_admin(self, is_admin_request: "IsAdminRequest") -> "IsAdminResponse":
        raise grpclib.GRPCError(grpclib.const.Status.UNIMPLEMENTED)

    async def is_online(
        self, is_online_request: "IsOnlineRequest"
    ) -> "IsOnlineResponse":
        raise grpclib.GRPCError(grpclib.const.Status.UNIMPLEMENTED)

    async def __rpc_say_hello(
        self, stream: "grpclib.server.Stream[HelloRequest, HelloReply]"
    ) -> None:
        request = await stream.recv_message()
        response = await self.say_hello(request)
        await stream.send_message(response)

    async def __rpc_user_register_request(
        self, stream: "grpclib.server.Stream[RegisterRequest, RegisterReply]"
    ) -> None:
        request = await stream.recv_message()
        response = await self.user_register_request(request)
        await stream.send_message(response)

    async def __rpc_user_register_confirm(
        self,
        stream: "grpclib.server.Stream[RegisterConfirmRequest, RegisterConfirmReply]",
    ) -> None:
        request = await stream.recv_message()
        response = await self.user_register_confirm(request)
        await stream.send_message(response)

    async def __rpc_is_jwt_ok(
        self, stream: "grpclib.server.Stream[IsJwtOkRequest, IsJwtOkReply]"
    ) -> None:
        request = await stream.recv_message()
        response = await self.is_jwt_ok(request)
        await stream.send_message(response)

    async def __rpc_is_admin(
        self, stream: "grpclib.server.Stream[IsAdminRequest, IsAdminResponse]"
    ) -> None:
        request = await stream.recv_message()
        response = await self.is_admin(request)
        await stream.send_message(response)

    async def __rpc_is_online(
        self, stream: "grpclib.server.Stream[IsOnlineRequest, IsOnlineResponse]"
    ) -> None:
        request = await stream.recv_message()
        response = await self.is_online(request)
        await stream.send_message(response)

    def __mapping__(self) -> Dict[str, grpclib.const.Handler]:
        return {
            "/account_auth_service.AccountAuthenticationService/SayHello": grpclib.const.Handler(
                self.__rpc_say_hello,
                grpclib.const.Cardinality.UNARY_UNARY,
                HelloRequest,
                HelloReply,
            ),
            "/account_auth_service.AccountAuthenticationService/UserRegisterRequest": grpclib.const.Handler(
                self.__rpc_user_register_request,
                grpclib.const.Cardinality.UNARY_UNARY,
                RegisterRequest,
                RegisterReply,
            ),
            "/account_auth_service.AccountAuthenticationService/UserRegisterConfirm": grpclib.const.Handler(
                self.__rpc_user_register_confirm,
                grpclib.const.Cardinality.UNARY_UNARY,
                RegisterConfirmRequest,
                RegisterConfirmReply,
            ),
            "/account_auth_service.AccountAuthenticationService/IsJwtOk": grpclib.const.Handler(
                self.__rpc_is_jwt_ok,
                grpclib.const.Cardinality.UNARY_UNARY,
                IsJwtOkRequest,
                IsJwtOkReply,
            ),
            "/account_auth_service.AccountAuthenticationService/IsAdmin": grpclib.const.Handler(
                self.__rpc_is_admin,
                grpclib.const.Cardinality.UNARY_UNARY,
                IsAdminRequest,
                IsAdminResponse,
            ),
            "/account_auth_service.AccountAuthenticationService/IsOnline": grpclib.const.Handler(
                self.__rpc_is_online,
                grpclib.const.Cardinality.UNARY_UNARY,
                IsOnlineRequest,
                IsOnlineResponse,
            ),
        }
