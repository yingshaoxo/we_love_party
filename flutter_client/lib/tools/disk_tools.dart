import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as built_in_path_module;
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

String path_join({required String path1, required String path2}) {
  return built_in_path_module.join(path1, path2);
}

String get_base64_string_from_Uint8List(Uint8List data) {
  return base64Encode(data);
}

Uint8List get_Uint8List_from_base64_string(String base64String) {
  return base64Decode(base64String);
}

Future<Uint8List> uint8List_image_compress(Uint8List list) async {
  if (list.lengthInBytes > 300000) {
    // if the image size > 300KB, we compress
    var result = await FlutterImageCompress.compressWithList(list,
        minHeight: 1920, minWidth: 1080, quality: 50);
    return result;
  } else {
    return list;
  }
}

Image get_image_from_base64_string(String base64String) {
  return Image.memory(get_Uint8List_from_base64_string(base64String));
}
