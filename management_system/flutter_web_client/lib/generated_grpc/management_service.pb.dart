///
//  Generated code. Do not modify.
//  source: management_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GetUsersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUsersRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetUsersRequest._() : super();
  factory GetUsersRequest({
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final _result = create();
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    if (pageNumber != null) {
      _result.pageNumber = pageNumber;
    }
    return _result;
  }
  factory GetUsersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUsersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUsersRequest clone() => GetUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUsersRequest copyWith(void Function(GetUsersRequest) updates) => super.copyWith((message) => updates(message as GetUsersRequest)) as GetUsersRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUsersRequest create() => GetUsersRequest._();
  GetUsersRequest createEmptyInstance() => create();
  static $pb.PbList<GetUsersRequest> createRepeated() => $pb.PbList<GetUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUsersRequest>(create);
  static GetUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageNumber($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageNumber() => clearField(2);
}

class GetUsersResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUsersResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..pc<UserModel>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', $pb.PbFieldType.PM, subBuilder: UserModel.create)
    ..hasRequiredFields = false
  ;

  GetUsersResponse._() : super();
  factory GetUsersResponse({
    $core.String? error,
    $core.Iterable<UserModel>? user,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (user != null) {
      _result.user.addAll(user);
    }
    return _result;
  }
  factory GetUsersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUsersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUsersResponse clone() => GetUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUsersResponse copyWith(void Function(GetUsersResponse) updates) => super.copyWith((message) => updates(message as GetUsersResponse)) as GetUsersResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUsersResponse create() => GetUsersResponse._();
  GetUsersResponse createEmptyInstance() => create();
  static $pb.PbList<GetUsersResponse> createRepeated() => $pb.PbList<GetUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUsersResponse>(create);
  static GetUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<UserModel> get user => $_getList(1);
}

class AddPlaceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddPlaceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..aOM<LocationOfFreeMap>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'locationOfFreeMap', subBuilder: LocationOfFreeMap.create)
    ..hasRequiredFields = false
  ;

  AddPlaceRequest._() : super();
  factory AddPlaceRequest({
    LocationOfFreeMap? locationOfFreeMap,
  }) {
    final _result = create();
    if (locationOfFreeMap != null) {
      _result.locationOfFreeMap = locationOfFreeMap;
    }
    return _result;
  }
  factory AddPlaceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPlaceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPlaceRequest clone() => AddPlaceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPlaceRequest copyWith(void Function(AddPlaceRequest) updates) => super.copyWith((message) => updates(message as AddPlaceRequest)) as AddPlaceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddPlaceRequest create() => AddPlaceRequest._();
  AddPlaceRequest createEmptyInstance() => create();
  static $pb.PbList<AddPlaceRequest> createRepeated() => $pb.PbList<AddPlaceRequest>();
  @$core.pragma('dart2js:noInline')
  static AddPlaceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPlaceRequest>(create);
  static AddPlaceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  LocationOfFreeMap get locationOfFreeMap => $_getN(0);
  @$pb.TagNumber(1)
  set locationOfFreeMap(LocationOfFreeMap v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationOfFreeMap() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationOfFreeMap() => clearField(1);
  @$pb.TagNumber(1)
  LocationOfFreeMap ensureLocationOfFreeMap() => $_ensure(0);
}

class AddPlaceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddPlaceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  AddPlaceResponse._() : super();
  factory AddPlaceResponse({
    $core.String? error,
    $core.bool? success,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory AddPlaceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPlaceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPlaceResponse clone() => AddPlaceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPlaceResponse copyWith(void Function(AddPlaceResponse) updates) => super.copyWith((message) => updates(message as AddPlaceResponse)) as AddPlaceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddPlaceResponse create() => AddPlaceResponse._();
  AddPlaceResponse createEmptyInstance() => create();
  static $pb.PbList<AddPlaceResponse> createRepeated() => $pb.PbList<AddPlaceResponse>();
  @$core.pragma('dart2js:noInline')
  static AddPlaceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPlaceResponse>(create);
  static AddPlaceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class UpdatePlaceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlaceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..aOM<LocationOfFreeMap>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'locationOfFreeMap', subBuilder: LocationOfFreeMap.create)
    ..hasRequiredFields = false
  ;

  UpdatePlaceRequest._() : super();
  factory UpdatePlaceRequest({
    LocationOfFreeMap? locationOfFreeMap,
  }) {
    final _result = create();
    if (locationOfFreeMap != null) {
      _result.locationOfFreeMap = locationOfFreeMap;
    }
    return _result;
  }
  factory UpdatePlaceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlaceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlaceRequest clone() => UpdatePlaceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlaceRequest copyWith(void Function(UpdatePlaceRequest) updates) => super.copyWith((message) => updates(message as UpdatePlaceRequest)) as UpdatePlaceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlaceRequest create() => UpdatePlaceRequest._();
  UpdatePlaceRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePlaceRequest> createRepeated() => $pb.PbList<UpdatePlaceRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlaceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlaceRequest>(create);
  static UpdatePlaceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  LocationOfFreeMap get locationOfFreeMap => $_getN(0);
  @$pb.TagNumber(1)
  set locationOfFreeMap(LocationOfFreeMap v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationOfFreeMap() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationOfFreeMap() => clearField(1);
  @$pb.TagNumber(1)
  LocationOfFreeMap ensureLocationOfFreeMap() => $_ensure(0);
}

class UpdatePlaceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePlaceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UpdatePlaceResponse._() : super();
  factory UpdatePlaceResponse({
    $core.String? error,
    $core.bool? success,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UpdatePlaceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePlaceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePlaceResponse clone() => UpdatePlaceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePlaceResponse copyWith(void Function(UpdatePlaceResponse) updates) => super.copyWith((message) => updates(message as UpdatePlaceResponse)) as UpdatePlaceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePlaceResponse create() => UpdatePlaceResponse._();
  UpdatePlaceResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePlaceResponse> createRepeated() => $pb.PbList<UpdatePlaceResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePlaceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePlaceResponse>(create);
  static UpdatePlaceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class DeletePlaceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeletePlaceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'locationId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeletePlaceRequest._() : super();
  factory DeletePlaceRequest({
    $core.int? locationId,
  }) {
    final _result = create();
    if (locationId != null) {
      _result.locationId = locationId;
    }
    return _result;
  }
  factory DeletePlaceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePlaceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePlaceRequest clone() => DeletePlaceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePlaceRequest copyWith(void Function(DeletePlaceRequest) updates) => super.copyWith((message) => updates(message as DeletePlaceRequest)) as DeletePlaceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeletePlaceRequest create() => DeletePlaceRequest._();
  DeletePlaceRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePlaceRequest> createRepeated() => $pb.PbList<DeletePlaceRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePlaceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePlaceRequest>(create);
  static DeletePlaceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get locationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set locationId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationId() => clearField(1);
}

class DeletePlaceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeletePlaceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  DeletePlaceResponse._() : super();
  factory DeletePlaceResponse({
    $core.String? error,
    $core.bool? success,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory DeletePlaceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePlaceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePlaceResponse clone() => DeletePlaceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePlaceResponse copyWith(void Function(DeletePlaceResponse) updates) => super.copyWith((message) => updates(message as DeletePlaceResponse)) as DeletePlaceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeletePlaceResponse create() => DeletePlaceResponse._();
  DeletePlaceResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePlaceResponse> createRepeated() => $pb.PbList<DeletePlaceResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePlaceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePlaceResponse>(create);
  static DeletePlaceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class UserModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headImage')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sex', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'age', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  UserModel._() : super();
  factory UserModel({
    $core.String? email,
    $core.String? username,
    $core.String? headImage,
    $core.int? sex,
    $core.int? age,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (username != null) {
      _result.username = username;
    }
    if (headImage != null) {
      _result.headImage = headImage;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (age != null) {
      _result.age = age;
    }
    return _result;
  }
  factory UserModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserModel clone() => UserModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserModel copyWith(void Function(UserModel) updates) => super.copyWith((message) => updates(message as UserModel)) as UserModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserModel create() => UserModel._();
  UserModel createEmptyInstance() => create();
  static $pb.PbList<UserModel> createRepeated() => $pb.PbList<UserModel>();
  @$core.pragma('dart2js:noInline')
  static UserModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserModel>(create);
  static UserModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get headImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set headImage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeadImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeadImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);
}

class LocationOfFreeMap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LocationOfFreeMap', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'management_service'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'locationId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploaderEmail')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yLatitude', $pb.PbFieldType.OD)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'xLongitude', $pb.PbFieldType.OD)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scores', $pb.PbFieldType.OD)
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openAllDay')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasCharger')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasWifi')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasWater')
    ..aOB(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasHotWater')
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasDesk')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasChair')
    ..aOB(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasToilet')
    ..aOB(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasShowering')
    ..aOB(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasPackageReceivingStation')
    ..aOB(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasKfc')
    ..aOB(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasMcdonald')
    ..aOB(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasStore')
    ..hasRequiredFields = false
  ;

  LocationOfFreeMap._() : super();
  factory LocationOfFreeMap({
    $core.int? locationId,
    $core.String? uploaderEmail,
    $core.String? name,
    $core.double? yLatitude,
    $core.double? xLongitude,
    $core.double? scores,
    $core.bool? openAllDay,
    $core.bool? hasCharger,
    $core.bool? hasWifi,
    $core.bool? hasWater,
    $core.bool? hasHotWater,
    $core.bool? hasDesk,
    $core.bool? hasChair,
    $core.bool? hasToilet,
    $core.bool? hasShowering,
    $core.bool? hasPackageReceivingStation,
    $core.bool? hasKfc,
    $core.bool? hasMcdonald,
    $core.bool? hasStore,
  }) {
    final _result = create();
    if (locationId != null) {
      _result.locationId = locationId;
    }
    if (uploaderEmail != null) {
      _result.uploaderEmail = uploaderEmail;
    }
    if (name != null) {
      _result.name = name;
    }
    if (yLatitude != null) {
      _result.yLatitude = yLatitude;
    }
    if (xLongitude != null) {
      _result.xLongitude = xLongitude;
    }
    if (scores != null) {
      _result.scores = scores;
    }
    if (openAllDay != null) {
      _result.openAllDay = openAllDay;
    }
    if (hasCharger != null) {
      _result.hasCharger = hasCharger;
    }
    if (hasWifi != null) {
      _result.hasWifi = hasWifi;
    }
    if (hasWater != null) {
      _result.hasWater = hasWater;
    }
    if (hasHotWater != null) {
      _result.hasHotWater = hasHotWater;
    }
    if (hasDesk != null) {
      _result.hasDesk = hasDesk;
    }
    if (hasChair != null) {
      _result.hasChair = hasChair;
    }
    if (hasToilet != null) {
      _result.hasToilet = hasToilet;
    }
    if (hasShowering != null) {
      _result.hasShowering = hasShowering;
    }
    if (hasPackageReceivingStation != null) {
      _result.hasPackageReceivingStation = hasPackageReceivingStation;
    }
    if (hasKfc != null) {
      _result.hasKfc = hasKfc;
    }
    if (hasMcdonald != null) {
      _result.hasMcdonald = hasMcdonald;
    }
    if (hasStore != null) {
      _result.hasStore = hasStore;
    }
    return _result;
  }
  factory LocationOfFreeMap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocationOfFreeMap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocationOfFreeMap clone() => LocationOfFreeMap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocationOfFreeMap copyWith(void Function(LocationOfFreeMap) updates) => super.copyWith((message) => updates(message as LocationOfFreeMap)) as LocationOfFreeMap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LocationOfFreeMap create() => LocationOfFreeMap._();
  LocationOfFreeMap createEmptyInstance() => create();
  static $pb.PbList<LocationOfFreeMap> createRepeated() => $pb.PbList<LocationOfFreeMap>();
  @$core.pragma('dart2js:noInline')
  static LocationOfFreeMap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocationOfFreeMap>(create);
  static LocationOfFreeMap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get locationId => $_getIZ(0);
  @$pb.TagNumber(1)
  set locationId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uploaderEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set uploaderEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUploaderEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearUploaderEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get yLatitude => $_getN(3);
  @$pb.TagNumber(4)
  set yLatitude($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasYLatitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearYLatitude() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get xLongitude => $_getN(4);
  @$pb.TagNumber(5)
  set xLongitude($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasXLongitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearXLongitude() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get scores => $_getN(5);
  @$pb.TagNumber(6)
  set scores($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasScores() => $_has(5);
  @$pb.TagNumber(6)
  void clearScores() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get openAllDay => $_getBF(6);
  @$pb.TagNumber(7)
  set openAllDay($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOpenAllDay() => $_has(6);
  @$pb.TagNumber(7)
  void clearOpenAllDay() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get hasCharger => $_getBF(7);
  @$pb.TagNumber(8)
  set hasCharger($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHasCharger() => $_has(7);
  @$pb.TagNumber(8)
  void clearHasCharger() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get hasWifi => $_getBF(8);
  @$pb.TagNumber(9)
  set hasWifi($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHasWifi() => $_has(8);
  @$pb.TagNumber(9)
  void clearHasWifi() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get hasWater => $_getBF(9);
  @$pb.TagNumber(10)
  set hasWater($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasHasWater() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasWater() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get hasHotWater => $_getBF(10);
  @$pb.TagNumber(11)
  set hasHotWater($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasHasHotWater() => $_has(10);
  @$pb.TagNumber(11)
  void clearHasHotWater() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get hasDesk => $_getBF(11);
  @$pb.TagNumber(12)
  set hasDesk($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasHasDesk() => $_has(11);
  @$pb.TagNumber(12)
  void clearHasDesk() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get hasChair => $_getBF(12);
  @$pb.TagNumber(13)
  set hasChair($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasHasChair() => $_has(12);
  @$pb.TagNumber(13)
  void clearHasChair() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get hasToilet => $_getBF(13);
  @$pb.TagNumber(14)
  set hasToilet($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasHasToilet() => $_has(13);
  @$pb.TagNumber(14)
  void clearHasToilet() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get hasShowering => $_getBF(14);
  @$pb.TagNumber(15)
  set hasShowering($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasHasShowering() => $_has(14);
  @$pb.TagNumber(15)
  void clearHasShowering() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get hasPackageReceivingStation => $_getBF(15);
  @$pb.TagNumber(16)
  set hasPackageReceivingStation($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasHasPackageReceivingStation() => $_has(15);
  @$pb.TagNumber(16)
  void clearHasPackageReceivingStation() => clearField(16);

  @$pb.TagNumber(17)
  $core.bool get hasKfc => $_getBF(16);
  @$pb.TagNumber(17)
  set hasKfc($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasHasKfc() => $_has(16);
  @$pb.TagNumber(17)
  void clearHasKfc() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get hasMcdonald => $_getBF(17);
  @$pb.TagNumber(18)
  set hasMcdonald($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasHasMcdonald() => $_has(17);
  @$pb.TagNumber(18)
  void clearHasMcdonald() => clearField(18);

  @$pb.TagNumber(19)
  $core.bool get hasStore => $_getBF(18);
  @$pb.TagNumber(19)
  set hasStore($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasHasStore() => $_has(18);
  @$pb.TagNumber(19)
  void clearHasStore() => clearField(19);
}

