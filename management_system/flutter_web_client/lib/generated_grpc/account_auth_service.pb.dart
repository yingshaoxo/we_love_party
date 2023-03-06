///
//  Generated code. Do not modify.
//  source: account_auth_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class HelloRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelloRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  HelloRequest._() : super();
  factory HelloRequest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory HelloRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloRequest clone() => HelloRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloRequest copyWith(void Function(HelloRequest) updates) => super.copyWith((message) => updates(message as HelloRequest)) as HelloRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloRequest create() => HelloRequest._();
  HelloRequest createEmptyInstance() => create();
  static $pb.PbList<HelloRequest> createRepeated() => $pb.PbList<HelloRequest>();
  @$core.pragma('dart2js:noInline')
  static HelloRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloRequest>(create);
  static HelloRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class HelloReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HelloReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  HelloReply._() : super();
  factory HelloReply({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory HelloReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HelloReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HelloReply clone() => HelloReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HelloReply copyWith(void Function(HelloReply) updates) => super.copyWith((message) => updates(message as HelloReply)) as HelloReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HelloReply create() => HelloReply._();
  HelloReply createEmptyInstance() => create();
  static $pb.PbList<HelloReply> createRepeated() => $pb.PbList<HelloReply>();
  @$core.pragma('dart2js:noInline')
  static HelloReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HelloReply>(create);
  static HelloReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class RegisterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  RegisterRequest._() : super();
  factory RegisterRequest({
    $core.String? email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory RegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterRequest clone() => RegisterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterRequest copyWith(void Function(RegisterRequest) updates) => super.copyWith((message) => updates(message as RegisterRequest)) as RegisterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterRequest create() => RegisterRequest._();
  RegisterRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterRequest> createRepeated() => $pb.PbList<RegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterRequest>(create);
  static RegisterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class RegisterReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  RegisterReply._() : super();
  factory RegisterReply({
    $core.String? result,
    $core.String? error,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory RegisterReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterReply clone() => RegisterReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterReply copyWith(void Function(RegisterReply) updates) => super.copyWith((message) => updates(message as RegisterReply)) as RegisterReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterReply create() => RegisterReply._();
  RegisterReply createEmptyInstance() => create();
  static $pb.PbList<RegisterReply> createRepeated() => $pb.PbList<RegisterReply>();
  @$core.pragma('dart2js:noInline')
  static RegisterReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterReply>(create);
  static RegisterReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class RegisterConfirmRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterConfirmRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'randomString')
    ..hasRequiredFields = false
  ;

  RegisterConfirmRequest._() : super();
  factory RegisterConfirmRequest({
    $core.String? email,
    $core.String? randomString,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (randomString != null) {
      _result.randomString = randomString;
    }
    return _result;
  }
  factory RegisterConfirmRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterConfirmRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterConfirmRequest clone() => RegisterConfirmRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterConfirmRequest copyWith(void Function(RegisterConfirmRequest) updates) => super.copyWith((message) => updates(message as RegisterConfirmRequest)) as RegisterConfirmRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterConfirmRequest create() => RegisterConfirmRequest._();
  RegisterConfirmRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterConfirmRequest> createRepeated() => $pb.PbList<RegisterConfirmRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterConfirmRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterConfirmRequest>(create);
  static RegisterConfirmRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get randomString => $_getSZ(1);
  @$pb.TagNumber(2)
  set randomString($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRandomString() => $_has(1);
  @$pb.TagNumber(2)
  void clearRandomString() => clearField(2);
}

class RegisterConfirmReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterConfirmReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jwt')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  RegisterConfirmReply._() : super();
  factory RegisterConfirmReply({
    $core.String? jwt,
    $core.String? error,
  }) {
    final _result = create();
    if (jwt != null) {
      _result.jwt = jwt;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory RegisterConfirmReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterConfirmReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterConfirmReply clone() => RegisterConfirmReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterConfirmReply copyWith(void Function(RegisterConfirmReply) updates) => super.copyWith((message) => updates(message as RegisterConfirmReply)) as RegisterConfirmReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterConfirmReply create() => RegisterConfirmReply._();
  RegisterConfirmReply createEmptyInstance() => create();
  static $pb.PbList<RegisterConfirmReply> createRepeated() => $pb.PbList<RegisterConfirmReply>();
  @$core.pragma('dart2js:noInline')
  static RegisterConfirmReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterConfirmReply>(create);
  static RegisterConfirmReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jwt => $_getSZ(0);
  @$pb.TagNumber(1)
  set jwt($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJwt() => $_has(0);
  @$pb.TagNumber(1)
  void clearJwt() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class IsJwtOkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IsJwtOkRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jwt')
    ..hasRequiredFields = false
  ;

  IsJwtOkRequest._() : super();
  factory IsJwtOkRequest({
    $core.String? jwt,
  }) {
    final _result = create();
    if (jwt != null) {
      _result.jwt = jwt;
    }
    return _result;
  }
  factory IsJwtOkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsJwtOkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsJwtOkRequest clone() => IsJwtOkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsJwtOkRequest copyWith(void Function(IsJwtOkRequest) updates) => super.copyWith((message) => updates(message as IsJwtOkRequest)) as IsJwtOkRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IsJwtOkRequest create() => IsJwtOkRequest._();
  IsJwtOkRequest createEmptyInstance() => create();
  static $pb.PbList<IsJwtOkRequest> createRepeated() => $pb.PbList<IsJwtOkRequest>();
  @$core.pragma('dart2js:noInline')
  static IsJwtOkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsJwtOkRequest>(create);
  static IsJwtOkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jwt => $_getSZ(0);
  @$pb.TagNumber(1)
  set jwt($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJwt() => $_has(0);
  @$pb.TagNumber(1)
  void clearJwt() => clearField(1);
}

class IsJwtOkReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IsJwtOkReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  IsJwtOkReply._() : super();
  factory IsJwtOkReply({
    $core.String? email,
    $core.String? error,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory IsJwtOkReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsJwtOkReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsJwtOkReply clone() => IsJwtOkReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsJwtOkReply copyWith(void Function(IsJwtOkReply) updates) => super.copyWith((message) => updates(message as IsJwtOkReply)) as IsJwtOkReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IsJwtOkReply create() => IsJwtOkReply._();
  IsJwtOkReply createEmptyInstance() => create();
  static $pb.PbList<IsJwtOkReply> createRepeated() => $pb.PbList<IsJwtOkReply>();
  @$core.pragma('dart2js:noInline')
  static IsJwtOkReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsJwtOkReply>(create);
  static IsJwtOkReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class IsAdminRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IsAdminRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jwt')
    ..hasRequiredFields = false
  ;

  IsAdminRequest._() : super();
  factory IsAdminRequest({
    $core.String? jwt,
  }) {
    final _result = create();
    if (jwt != null) {
      _result.jwt = jwt;
    }
    return _result;
  }
  factory IsAdminRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsAdminRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsAdminRequest clone() => IsAdminRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsAdminRequest copyWith(void Function(IsAdminRequest) updates) => super.copyWith((message) => updates(message as IsAdminRequest)) as IsAdminRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IsAdminRequest create() => IsAdminRequest._();
  IsAdminRequest createEmptyInstance() => create();
  static $pb.PbList<IsAdminRequest> createRepeated() => $pb.PbList<IsAdminRequest>();
  @$core.pragma('dart2js:noInline')
  static IsAdminRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsAdminRequest>(create);
  static IsAdminRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jwt => $_getSZ(0);
  @$pb.TagNumber(1)
  set jwt($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasJwt() => $_has(0);
  @$pb.TagNumber(1)
  void clearJwt() => clearField(1);
}

class IsAdminResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IsAdminResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yes')
    ..hasRequiredFields = false
  ;

  IsAdminResponse._() : super();
  factory IsAdminResponse({
    $core.String? error,
    $core.bool? yes,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (yes != null) {
      _result.yes = yes;
    }
    return _result;
  }
  factory IsAdminResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsAdminResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsAdminResponse clone() => IsAdminResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsAdminResponse copyWith(void Function(IsAdminResponse) updates) => super.copyWith((message) => updates(message as IsAdminResponse)) as IsAdminResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IsAdminResponse create() => IsAdminResponse._();
  IsAdminResponse createEmptyInstance() => create();
  static $pb.PbList<IsAdminResponse> createRepeated() => $pb.PbList<IsAdminResponse>();
  @$core.pragma('dart2js:noInline')
  static IsAdminResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsAdminResponse>(create);
  static IsAdminResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get yes => $_getBF(1);
  @$pb.TagNumber(2)
  set yes($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasYes() => $_has(1);
  @$pb.TagNumber(2)
  void clearYes() => clearField(2);
}

class IsOnlineRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IsOnlineRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  IsOnlineRequest._() : super();
  factory IsOnlineRequest({
    $core.String? email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory IsOnlineRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsOnlineRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsOnlineRequest clone() => IsOnlineRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsOnlineRequest copyWith(void Function(IsOnlineRequest) updates) => super.copyWith((message) => updates(message as IsOnlineRequest)) as IsOnlineRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IsOnlineRequest create() => IsOnlineRequest._();
  IsOnlineRequest createEmptyInstance() => create();
  static $pb.PbList<IsOnlineRequest> createRepeated() => $pb.PbList<IsOnlineRequest>();
  @$core.pragma('dart2js:noInline')
  static IsOnlineRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsOnlineRequest>(create);
  static IsOnlineRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class IsOnlineResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IsOnlineResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'online')
    ..hasRequiredFields = false
  ;

  IsOnlineResponse._() : super();
  factory IsOnlineResponse({
    $core.String? error,
    $core.bool? online,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (online != null) {
      _result.online = online;
    }
    return _result;
  }
  factory IsOnlineResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IsOnlineResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IsOnlineResponse clone() => IsOnlineResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IsOnlineResponse copyWith(void Function(IsOnlineResponse) updates) => super.copyWith((message) => updates(message as IsOnlineResponse)) as IsOnlineResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IsOnlineResponse create() => IsOnlineResponse._();
  IsOnlineResponse createEmptyInstance() => create();
  static $pb.PbList<IsOnlineResponse> createRepeated() => $pb.PbList<IsOnlineResponse>();
  @$core.pragma('dart2js:noInline')
  static IsOnlineResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IsOnlineResponse>(create);
  static IsOnlineResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get online => $_getBF(1);
  @$pb.TagNumber(2)
  set online($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOnline() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnline() => clearField(2);
}

class UserModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LocationOfFreeMap', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'account_auth_service'), createEmptyInstance: create)
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

