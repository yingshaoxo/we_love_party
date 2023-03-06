///
//  Generated code. Do not modify.
//  source: management_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getUsersRequestDescriptor instead')
const GetUsersRequest$json = const {
  '1': 'GetUsersRequest',
  '2': const [
    const {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    const {'1': 'page_number', '3': 2, '4': 1, '5': 5, '10': 'pageNumber'},
  ],
};

/// Descriptor for `GetUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersRequestDescriptor = $convert.base64Decode('Cg9HZXRVc2Vyc1JlcXVlc3QSGwoJcGFnZV9zaXplGAEgASgFUghwYWdlU2l6ZRIfCgtwYWdlX251bWJlchgCIAEoBVIKcGFnZU51bWJlcg==');
@$core.Deprecated('Use getUsersResponseDescriptor instead')
const GetUsersResponse$json = const {
  '1': 'GetUsersResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'user', '3': 2, '4': 3, '5': 11, '6': '.management_service.UserModel', '10': 'user'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `GetUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersResponseDescriptor = $convert.base64Decode('ChBHZXRVc2Vyc1Jlc3BvbnNlEhkKBWVycm9yGAEgASgJSABSBWVycm9yiAEBEjEKBHVzZXIYAiADKAsyHS5tYW5hZ2VtZW50X3NlcnZpY2UuVXNlck1vZGVsUgR1c2VyQggKBl9lcnJvcg==');
@$core.Deprecated('Use searchPlacesRequestDescriptor instead')
const SearchPlacesRequest$json = const {
  '1': 'SearchPlacesRequest',
  '2': const [
    const {'1': 'key_words', '3': 1, '4': 1, '5': 9, '10': 'keyWords'},
    const {'1': 'y_latitude', '3': 2, '4': 1, '5': 1, '10': 'yLatitude'},
    const {'1': 'x_longitude', '3': 3, '4': 1, '5': 1, '10': 'xLongitude'},
    const {'1': 'page_size', '3': 4, '4': 1, '5': 5, '10': 'pageSize'},
    const {'1': 'page_number', '3': 5, '4': 1, '5': 5, '10': 'pageNumber'},
  ],
};

/// Descriptor for `SearchPlacesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchPlacesRequestDescriptor = $convert.base64Decode('ChNTZWFyY2hQbGFjZXNSZXF1ZXN0EhsKCWtleV93b3JkcxgBIAEoCVIIa2V5V29yZHMSHQoKeV9sYXRpdHVkZRgCIAEoAVIJeUxhdGl0dWRlEh8KC3hfbG9uZ2l0dWRlGAMgASgBUgp4TG9uZ2l0dWRlEhsKCXBhZ2Vfc2l6ZRgEIAEoBVIIcGFnZVNpemUSHwoLcGFnZV9udW1iZXIYBSABKAVSCnBhZ2VOdW1iZXI=');
@$core.Deprecated('Use searchPlacesResponseDescriptor instead')
const SearchPlacesResponse$json = const {
  '1': 'SearchPlacesResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'location_of_free_map', '3': 2, '4': 3, '5': 11, '6': '.management_service.LocationOfFreeMap', '10': 'locationOfFreeMap'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `SearchPlacesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchPlacesResponseDescriptor = $convert.base64Decode('ChRTZWFyY2hQbGFjZXNSZXNwb25zZRIZCgVlcnJvchgBIAEoCUgAUgVlcnJvcogBARJWChRsb2NhdGlvbl9vZl9mcmVlX21hcBgCIAMoCzIlLm1hbmFnZW1lbnRfc2VydmljZS5Mb2NhdGlvbk9mRnJlZU1hcFIRbG9jYXRpb25PZkZyZWVNYXBCCAoGX2Vycm9y');
@$core.Deprecated('Use addPlaceRequestDescriptor instead')
const AddPlaceRequest$json = const {
  '1': 'AddPlaceRequest',
  '2': const [
    const {'1': 'location_of_free_map', '3': 1, '4': 1, '5': 11, '6': '.management_service.LocationOfFreeMap', '10': 'locationOfFreeMap'},
  ],
};

/// Descriptor for `AddPlaceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPlaceRequestDescriptor = $convert.base64Decode('Cg9BZGRQbGFjZVJlcXVlc3QSVgoUbG9jYXRpb25fb2ZfZnJlZV9tYXAYASABKAsyJS5tYW5hZ2VtZW50X3NlcnZpY2UuTG9jYXRpb25PZkZyZWVNYXBSEWxvY2F0aW9uT2ZGcmVlTWFw');
@$core.Deprecated('Use addPlaceResponseDescriptor instead')
const AddPlaceResponse$json = const {
  '1': 'AddPlaceResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `AddPlaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPlaceResponseDescriptor = $convert.base64Decode('ChBBZGRQbGFjZVJlc3BvbnNlEhkKBWVycm9yGAEgASgJSABSBWVycm9yiAEBEhgKB3N1Y2Nlc3MYAiABKAhSB3N1Y2Nlc3NCCAoGX2Vycm9y');
@$core.Deprecated('Use updatePlaceRequestDescriptor instead')
const UpdatePlaceRequest$json = const {
  '1': 'UpdatePlaceRequest',
  '2': const [
    const {'1': 'location_of_free_map', '3': 1, '4': 1, '5': 11, '6': '.management_service.LocationOfFreeMap', '10': 'locationOfFreeMap'},
  ],
};

/// Descriptor for `UpdatePlaceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePlaceRequestDescriptor = $convert.base64Decode('ChJVcGRhdGVQbGFjZVJlcXVlc3QSVgoUbG9jYXRpb25fb2ZfZnJlZV9tYXAYASABKAsyJS5tYW5hZ2VtZW50X3NlcnZpY2UuTG9jYXRpb25PZkZyZWVNYXBSEWxvY2F0aW9uT2ZGcmVlTWFw');
@$core.Deprecated('Use updatePlaceResponseDescriptor instead')
const UpdatePlaceResponse$json = const {
  '1': 'UpdatePlaceResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `UpdatePlaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePlaceResponseDescriptor = $convert.base64Decode('ChNVcGRhdGVQbGFjZVJlc3BvbnNlEhkKBWVycm9yGAEgASgJSABSBWVycm9yiAEBEhgKB3N1Y2Nlc3MYAiABKAhSB3N1Y2Nlc3NCCAoGX2Vycm9y');
@$core.Deprecated('Use deletePlaceRequestDescriptor instead')
const DeletePlaceRequest$json = const {
  '1': 'DeletePlaceRequest',
  '2': const [
    const {'1': 'location_id', '3': 1, '4': 1, '5': 5, '10': 'locationId'},
  ],
};

/// Descriptor for `DeletePlaceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePlaceRequestDescriptor = $convert.base64Decode('ChJEZWxldGVQbGFjZVJlcXVlc3QSHwoLbG9jYXRpb25faWQYASABKAVSCmxvY2F0aW9uSWQ=');
@$core.Deprecated('Use deletePlaceResponseDescriptor instead')
const DeletePlaceResponse$json = const {
  '1': 'DeletePlaceResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `DeletePlaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePlaceResponseDescriptor = $convert.base64Decode('ChNEZWxldGVQbGFjZVJlc3BvbnNlEhkKBWVycm9yGAEgASgJSABSBWVycm9yiAEBEhgKB3N1Y2Nlc3MYAiABKAhSB3N1Y2Nlc3NCCAoGX2Vycm9y');
@$core.Deprecated('Use userModelDescriptor instead')
const UserModel$json = const {
  '1': 'UserModel',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'username', '17': true},
    const {'1': 'head_image', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'headImage', '17': true},
    const {'1': 'sex', '3': 4, '4': 1, '5': 5, '9': 2, '10': 'sex', '17': true},
    const {'1': 'age', '3': 5, '4': 1, '5': 5, '9': 3, '10': 'age', '17': true},
  ],
  '8': const [
    const {'1': '_username'},
    const {'1': '_head_image'},
    const {'1': '_sex'},
    const {'1': '_age'},
  ],
};

/// Descriptor for `UserModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userModelDescriptor = $convert.base64Decode('CglVc2VyTW9kZWwSFAoFZW1haWwYASABKAlSBWVtYWlsEh8KCHVzZXJuYW1lGAIgASgJSABSCHVzZXJuYW1liAEBEiIKCmhlYWRfaW1hZ2UYAyABKAlIAVIJaGVhZEltYWdliAEBEhUKA3NleBgEIAEoBUgCUgNzZXiIAQESFQoDYWdlGAUgASgFSANSA2FnZYgBAUILCglfdXNlcm5hbWVCDQoLX2hlYWRfaW1hZ2VCBgoEX3NleEIGCgRfYWdl');
@$core.Deprecated('Use locationOfFreeMapDescriptor instead')
const LocationOfFreeMap$json = const {
  '1': 'LocationOfFreeMap',
  '2': const [
    const {'1': 'location_id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'locationId', '17': true},
    const {'1': 'uploader_email', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'uploaderEmail', '17': true},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'y_latitude', '3': 4, '4': 1, '5': 1, '10': 'yLatitude'},
    const {'1': 'x_longitude', '3': 5, '4': 1, '5': 1, '10': 'xLongitude'},
    const {'1': 'scores', '3': 6, '4': 1, '5': 1, '10': 'scores'},
    const {'1': 'open_all_day', '3': 7, '4': 1, '5': 8, '10': 'openAllDay'},
    const {'1': 'has_charger', '3': 8, '4': 1, '5': 8, '10': 'hasCharger'},
    const {'1': 'has_wifi', '3': 9, '4': 1, '5': 8, '10': 'hasWifi'},
    const {'1': 'has_water', '3': 10, '4': 1, '5': 8, '10': 'hasWater'},
    const {'1': 'has_hot_water', '3': 11, '4': 1, '5': 8, '10': 'hasHotWater'},
    const {'1': 'has_desk', '3': 12, '4': 1, '5': 8, '10': 'hasDesk'},
    const {'1': 'has_chair', '3': 13, '4': 1, '5': 8, '10': 'hasChair'},
    const {'1': 'has_toilet', '3': 14, '4': 1, '5': 8, '10': 'hasToilet'},
    const {'1': 'has_showering', '3': 15, '4': 1, '5': 8, '10': 'hasShowering'},
    const {'1': 'has_package_receiving_station', '3': 16, '4': 1, '5': 8, '10': 'hasPackageReceivingStation'},
    const {'1': 'has_kfc', '3': 17, '4': 1, '5': 8, '10': 'hasKfc'},
    const {'1': 'has_mcdonald', '3': 18, '4': 1, '5': 8, '10': 'hasMcdonald'},
    const {'1': 'has_store', '3': 19, '4': 1, '5': 8, '10': 'hasStore'},
  ],
  '8': const [
    const {'1': '_location_id'},
    const {'1': '_uploader_email'},
  ],
};

/// Descriptor for `LocationOfFreeMap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationOfFreeMapDescriptor = $convert.base64Decode('ChFMb2NhdGlvbk9mRnJlZU1hcBIkCgtsb2NhdGlvbl9pZBgBIAEoBUgAUgpsb2NhdGlvbklkiAEBEioKDnVwbG9hZGVyX2VtYWlsGAIgASgJSAFSDXVwbG9hZGVyRW1haWyIAQESEgoEbmFtZRgDIAEoCVIEbmFtZRIdCgp5X2xhdGl0dWRlGAQgASgBUgl5TGF0aXR1ZGUSHwoLeF9sb25naXR1ZGUYBSABKAFSCnhMb25naXR1ZGUSFgoGc2NvcmVzGAYgASgBUgZzY29yZXMSIAoMb3Blbl9hbGxfZGF5GAcgASgIUgpvcGVuQWxsRGF5Eh8KC2hhc19jaGFyZ2VyGAggASgIUgpoYXNDaGFyZ2VyEhkKCGhhc193aWZpGAkgASgIUgdoYXNXaWZpEhsKCWhhc193YXRlchgKIAEoCFIIaGFzV2F0ZXISIgoNaGFzX2hvdF93YXRlchgLIAEoCFILaGFzSG90V2F0ZXISGQoIaGFzX2Rlc2sYDCABKAhSB2hhc0Rlc2sSGwoJaGFzX2NoYWlyGA0gASgIUghoYXNDaGFpchIdCgpoYXNfdG9pbGV0GA4gASgIUgloYXNUb2lsZXQSIwoNaGFzX3Nob3dlcmluZxgPIAEoCFIMaGFzU2hvd2VyaW5nEkEKHWhhc19wYWNrYWdlX3JlY2VpdmluZ19zdGF0aW9uGBAgASgIUhpoYXNQYWNrYWdlUmVjZWl2aW5nU3RhdGlvbhIXCgdoYXNfa2ZjGBEgASgIUgZoYXNLZmMSIQoMaGFzX21jZG9uYWxkGBIgASgIUgtoYXNNY2RvbmFsZBIbCgloYXNfc3RvcmUYEyABKAhSCGhhc1N0b3JlQg4KDF9sb2NhdGlvbl9pZEIRCg9fdXBsb2FkZXJfZW1haWw=');
