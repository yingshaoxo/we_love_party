import 'dart:convert';
import 'dart:typed_data';

import 'package:image/image.dart' as imglib;

class ImageTools {
  static imglib.JpegEncoder jpegEncoder = imglib.JpegEncoder(quality: 90);
  static imglib.JpegDecoder jpegDecoder = imglib.JpegDecoder();

  static String image_to_base64(imglib.Image image) {
    imglib.JpegEncoder jpegEncoder = imglib.JpegEncoder(quality: 90);
    Uint8List image_data = jpegEncoder.encode(image);
    String base64Image = base64Encode(image_data);
    return base64Image;
  }

  static imglib.Image? base64_to_image(String base64_image_string) {
    Uint8List image_data = base64Decode(base64_image_string);
    imglib.Image? img = jpegDecoder.decode(image_data);
    return img;
  }
}
