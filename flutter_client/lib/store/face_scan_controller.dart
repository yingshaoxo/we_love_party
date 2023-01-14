import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:get/get.dart';

import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;

class FaceScanControllr extends GetxController {
  MLServiceForFace mlServiceForFace = MLServiceForFace();
}

class MLServiceForFace {
  Interpreter? interpreter_for_gender;
  Interpreter? interpreter_for_age;
  Interpreter? interpreter_for_mobilefacenet;

  Future<void> initialize() async {
    await _initialize_gender_interpreter();
    await _initialize_age_interpreter();
    await _initialize_mobilefacenet_interpreter();
  }

  InterpreterOptions? _get_interpreterOptions() {
    Delegate? delegate;
    if (Platform.isAndroid) {
      delegate = GpuDelegateV2(
          options: GpuDelegateOptionsV2(
        isPrecisionLossAllowed: false,
        inferencePreference: TfLiteGpuInferenceUsage.fastSingleAnswer,
        inferencePriority1: TfLiteGpuInferencePriority.minLatency,
        inferencePriority2: TfLiteGpuInferencePriority.auto,
        inferencePriority3: TfLiteGpuInferencePriority.auto,
      ));
    } else if (Platform.isIOS) {
      delegate = GpuDelegate(
        options: GpuDelegateOptions(
            allowPrecisionLoss: true, waitType: TFLGpuDelegateWaitType.active),
      );
    }
    var interpreterOptions = InterpreterOptions()..addDelegate(delegate!);
    return interpreterOptions;
  }

  Future<void> _initialize_gender_interpreter() async {
    try {
      interpreter_for_gender = await Interpreter.fromAsset(
          'ml_models/gender_and_age/model_lite_gender_q.tflite',
          options: _get_interpreterOptions());
    } catch (e) {
      print('Failed to load model.');
      print(e);
    }
  }

  Future<void> _initialize_age_interpreter() async {
    try {
      interpreter_for_age = await Interpreter.fromAsset(
          'ml_models/gender_and_age/model_lite_age_q.tflite',
          options: _get_interpreterOptions());
    } catch (e) {
      print('Failed to load model.');
      print(e);
    }
  }

  Future<void> _initialize_mobilefacenet_interpreter() async {
    Delegate? delegate;
    try {
      interpreter_for_mobilefacenet = await Interpreter.fromAsset(
          'ml_models/mobilefacenet/mobilefacenet.tflite',
          options: _get_interpreterOptions());
    } catch (e) {
      print('Failed to load model.');
      print(e);
    }
  }

  Future<String?> get_gender_by_giving_face(
      {required CameraImage cameraImage, required Face face}) async {
    // https://github.com/shubham0204/Age-Gender_Estimation_TF-Android/blob/master/app/src/main/java/com/ml/projects/age_genderdetection/GenderClassificationModel.kt
    if (interpreter_for_age == null) {
      return null;
    }

    var face_image = get_face_image(cameraImage, face);
    if (face_image == null) {
      return null;
    }
    face_image = resize_image(face_image, 128, 128);
    //face_image = normalize_image_into_range(face_image, 0, 1);
    List input = convert_image_to_float32_data_list(face_image);

    input = input.reshape([1, 128, 128, 3]);
    List output = List.generate(1, (index) => List.filled(2, 0.0));

    interpreter_for_gender?.run(input, output);
    print(output);

    int gender_num = 0; //1 for male, 0 for female
    var a = output[0][0];
    var b = output[0][1];
    if (a > b) {
      gender_num = 1;
    } else if (b > a) {
      gender_num = 0;
    } else {
      if (Random(DateTime.now().second).nextDouble() >= 0.5) {
        gender_num = 0;
      } else {
        gender_num = 1;
      }
    }
    String gender = gender_num == 0 ? 'female' : 'male';

    return gender;
  }

  Future<int?> get_age_by_giving_face(
      {required CameraImage cameraImage, required Face face}) async {
    // https://github.com/shubham0204/Age-Gender_Estimation_TF-Android/blob/master/app/src/main/java/com/ml/projects/age_genderdetection/AgeEstimationModel.kt
    if (interpreter_for_gender == null) {
      return null;
    }

    var face_image = get_face_image(cameraImage, face);
    if (face_image == null) {
      return null;
    }
    int squre_side_length_for_the_ml_model_input = 200;
    face_image = resize_image(
        face_image,
        squre_side_length_for_the_ml_model_input,
        squre_side_length_for_the_ml_model_input);
    //face_image = normalize_image_into_range(face_image, 0, 1);
    List input = convert_image_to_float32_data_list(face_image);

    input = input.reshape([
      1,
      squre_side_length_for_the_ml_model_input,
      squre_side_length_for_the_ml_model_input,
      3
    ]);
    List output = List.generate(1, (index) => List.filled(1, 0.0));

    interpreter_for_age?.run(input, output);
    print(output);

    double age = output[0][0] * 116;
    return age.toInt();
  }

  Future<bool?> login_or_register_by_using_face(
      CameraImage cameraImage, Face face, bool is_login, String email) async {
    if (interpreter_for_mobilefacenet == null) {
      return null;
    }

    var face_image = get_face_image(cameraImage, face);
    if (face_image == null) {
      return null;
    }
    face_image = resize_image(face_image, 112, 112);
    List input = convert_image_to_float32_data_list(face_image);
    // var json_text = jsonEncode(input);

    input = input.reshape([1, 112, 112, 3]);

    List output = List.generate(1, (index) => List.filled(192, 0));

    interpreter_for_mobilefacenet?.run(input, output);
    output = output.reshape([192]);

    List? predictedArray = List.from(output);
    // json_text = jsonEncode(predictedArray);

    if (is_login) {
      return true;
      // List user_face_feature =
      //     get_user_face_feature_by_email_from_database(email);
      List user_face_feature = [0.01, 0.02];

      int minDist = 999;
      double threshold = 1.5;
      var dist = euclideanDistance(predictedArray!, user_face_feature);
      if (dist <= threshold && dist < minDist) {
        return true;
      } else {
        return false;
      }
    } else {
      // save_user_face_feature(email, predictedArray);
      return true;
    }
  }

  euclideanDistance(List l1, List l2) {
    double sum = 0;
    for (int i = 0; i < l1.length; i++) {
      sum += pow((l1[i] - l2[i]), 2);
    }

    return pow(sum, 0.5);
  }

  imglib.Image? get_face_image(CameraImage image, Face faceDetected) {
    imglib.Image? convertedImage =
        convert_YUV420_CameraImage_to_Image_with_color(image);
    if (convertedImage == null) {
      return null;
    }

    double x = faceDetected.boundingBox.left - 10.0;
    double y = faceDetected.boundingBox.top - 10.0;
    double w = faceDetected.boundingBox.width + 10.0;
    double h = faceDetected.boundingBox.height + 10.0;

    var new_img = imglib.copyCrop(convertedImage,
        x: x.round(), y: y.round(), width: w.round(), height: h.round());
    return new_img;
  }

  static const shift = (0xFF << 24);
  imglib.Image? convert_YUV420_CameraImage_to_Image_with_color(
      CameraImage image) {
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
      print(">>>>>>>>>>>> ERROR: $e");
      return null;
    }
  }

  imglib.Image resize_image(imglib.Image image, int height, int width) {
    imglib.Image img = imglib.copyResize(image, height: height, width: width);
    return img;
  }

  imglib.Image normalize_image_into_range(
      imglib.Image image, num min, num max) {
    return imglib.normalize(image, min: min, max: max);
  }

  // imglib.Image? _convertJpeg(CameraImage image) {
  //   return imglib.Image.fromBytes(
  //       width: image.width,
  //       height: image.height,
  //       bytes: image.planes[0].bytes.buffer,
  //       format: imglib.Format.uint8,
  //       numChannels: 3);
  // }

  Float32List convert_image_to_float32_data_list(imglib.Image image) {
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
