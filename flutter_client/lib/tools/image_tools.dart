import 'dart:convert';
import 'dart:typed_data';

import 'package:camera/camera.dart';
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

  static imglib.Image? convert_YUV420_CameraImage_to_Image_with_color(
      CameraImage image) {
    const shift = (0xFF << 24);

    try {
      final int width = image.width;
      final int height = image.height;
      final int uvRowStride = image.planes[1].bytesPerRow;
      final int? uvPixelStride = image.planes[1].bytesPerPixel;

      if (uvPixelStride == null) {
        return null;
      }

      var img =
          imglib.Image(height: height, width: width); // Create Image buffer

      if (img.data == null) {
        return null;
      }

      // Fill image buffer with plane[0] from YUV420_888
      for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
          final int uvIndex =
              uvPixelStride * (x / 2).floor() + uvRowStride * (y / 2).floor();
          final int index = y * width + x;

          final yp = image.planes[0].bytes[index];
          final up = image.planes[1].bytes[uvIndex];
          final vp = image.planes[2].bytes[uvIndex];
          // Calculate pixel color
          int r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
          int g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
              .round()
              .clamp(0, 255);
          int b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);
          // color: 0x FF  FF  FF  FF
          //           A   B   G   R
          // img.data[index] = shift | (b << 16) | (g << 8) | r;
          // if (img.isBoundsSafe(height - y, x)) {
          //   img.setPixelRgba(height - y, x, r, g, b, shift);
          // }
          img.setPixelRgba(x, y, r, g, b, shift);
        }
      }

      var img1 = imglib.copyRotate(img, angle: -90);

      return img1;
    } catch (e) {
      print("error: $e");
      return null;
    }
  }

  static imglib.Image resize_image(imglib.Image image, int height, int width) {
    imglib.Image img = imglib.copyResize(image, height: height, width: width);
    return img;
  }

  static imglib.Image normalize_image_into_range(
      imglib.Image image, num min, num max) {
    return imglib.normalize(image, min: min, max: max);
  }

  static Float32List convert_image_to_float32_data_list(imglib.Image image) {
    int height = image.height;
    int width = image.width;

    var convertedBytes = Float32List(1 * height * width * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        var pixel = image.getPixel(x, y);
        buffer[pixelIndex++] = (pixel.r - 128) / 128;
        buffer[pixelIndex++] = (pixel.g - 128) / 128;
        buffer[pixelIndex++] = (pixel.b - 128) / 128;
      }
    }

    var result_list = convertedBytes.buffer.asFloat32List();
    return result_list;
  }
}
