import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/store/controllers.dart';
import 'package:flutter_client/tools/image_tools.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../common_user_interface/exit.dart';
import '../../common_user_interface/loading.dart';
import '../../common_user_interface/pop_up_window.dart';
import '../../generated_grpc/account_storage_service.pb.dart';
import '../../store/config.dart';

class FaceScanPage extends StatefulWidget {
  const FaceScanPage({Key? key}) : super(key: key);

  @override
  _FaceScanPageState createState() => _FaceScanPageState();
}

class _FaceScanPageState extends State<FaceScanPage> {
  TextEditingController controller = TextEditingController();

  List<CameraDescription>? cameras;
  late CameraController _cameraController;
  bool flash = false;
  bool isControllerInitialized = false;
  late FaceDetector _faceDetector;

  CameraImage? temp_image;
  String? gender;
  bool detection_process_for_one_frame_is_done = true;

  Future initializeCamera() async {
    await _cameraController.initialize();
    isControllerInitialized = true;
    _cameraController.setFlashMode(FlashMode.off);

    setState(() {});
  }

  InputImageRotation rotationIntToImageRotation(int rotation) {
    switch (rotation) {
      case 90:
        return InputImageRotation.rotation90deg;
      case 180:
        return InputImageRotation.rotation180deg;
      case 270:
        return InputImageRotation.rotation270deg;
      default:
        return InputImageRotation.rotation0deg;
    }
  }

  Future<List<Face>> detect_faces_from_image(CameraImage cameraImage) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in cameraImage.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

    final InputImageRotation imageRotation = rotationIntToImageRotation(
        _cameraController.description.sensorOrientation);

    final InputImageFormat inputImageFormat =
        InputImageFormatValue.fromRawValue(cameraImage.format.raw) ??
            InputImageFormat.nv21;

    final planeData = cameraImage.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    var result = await _faceDetector.processImage(inputImage);
    return result;
  }

  Future<CameraImage> take_a_picture_from_camera_stream() async {
    bool took_a_picture = false;
    await _cameraController.startImageStream((CameraImage image) async {
      if (took_a_picture == false) {
        temp_image = image;
        took_a_picture = true;
      }
      return null;
    });
    while (took_a_picture == false) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    await _cameraController.stopImageStream();
    return temp_image!;
  }

  Future<void> start_face_scan_process() async {
    await _cameraController.startImageStream((CameraImage image) async {
      if (this.detection_process_for_one_frame_is_done == true) {
        this.detection_process_for_one_frame_is_done = false;

        var faces = await detect_faces_from_image(image);
        if (faces.isNotEmpty) {
          var face = faces.first;

          this.gender = await face_scan_controller.mlServiceForFace
              .get_gender_by_giving_face(cameraImage: image, face: face);

          setState(() {
            this.gender = this.gender;
          });
        }

        this.detection_process_for_one_frame_is_done = true;
      }
      return null;
    });
  }

  @override
  void initState() {
    super.initState();
    () async {
      cameras = await availableCameras();
      await face_scan_controller.mlServiceForFace.initialize();

      if (cameras == null) {
        return;
      }

      _cameraController = CameraController(cameras![1], ResolutionPreset.high);
      await initializeCamera();

      _faceDetector = GoogleMlKit.vision.faceDetector(
        FaceDetectorOptions(
          performanceMode: FaceDetectorMode.accurate,
          enableLandmarks: false,
          enableContours: false,
          enableTracking: false,
          enableClassification: true,
        ),
      );

      // await start_face_scan_process();
    }();
  }

  @override
  void dispose() {
    super.dispose();
    // _cameraController.stopImageStream();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: isControllerInitialized
                    ? CameraPreview(_cameraController)
                    : null),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child:
                            //  Lottie.asset("assets/loading.json", width: MediaQuery.of(context).size.width * 0.7),
                            // Center(child: Text("Loading...")),
                            Container()),
                  ),
                  // TextField(
                  //   controller: controller,
                  //   decoration: const InputDecoration(
                  //       fillColor: Colors.white, filled: true),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Text(this.gender ?? ""),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 0.3.sw,
                        child: TextButton(
                          child: Text("Capture"),
                          onPressed: () async {
                            var image =
                                await take_a_picture_from_camera_stream();

                            var image2 = ImageTools
                                .convert_YUV420_CameraImage_to_Image_with_color(
                                    image);
                            if (image2 == null) {
                              await show_exit_confirm_pop_window(
                                  msg:
                                      "Unknown error, see you in the next version!");
                              return;
                            }
                            String base64_image_string =
                                ImageTools.image_to_base64(image2);
                            face_scan_controller.createUserRequest.headImage =
                                base64_image_string;

                            var faces = await detect_faces_from_image(image);
                            if (faces.isEmpty) {
                              await show_error(
                                  msg:
                                      "Please try to take another picture, because I didn't get your face");
                              return;
                            } else {
                              var face = faces.first;

                              String? gender = await face_scan_controller
                                  .mlServiceForFace
                                  .get_gender_by_giving_face(
                                      cameraImage: image, face: face);
                              print(gender);

                              int? age = await face_scan_controller
                                  .mlServiceForFace
                                  .get_age_by_giving_face(
                                      cameraImage: image, face: face);
                              print(age);

                              if (gender == null || age == null) {
                                await show_error(
                                    msg:
                                        "Please try to take another picture, because I didn't get your age or gender");
                                return;
                              } else {
                                // if ((face_scan_controller
                                //             .createUserRequest.headImage ==
                                //         null) ||
                                //     (face_scan_controller
                                //             .createUserRequest.sex ==
                                //         null) ||
                                //     (face_scan_controller
                                //             .createUserRequest.age ==
                                //         null) ||
                                //     (face_scan_controller.got_face_info ==
                                //         false)) {
                                //   await show_error(
                                //       msg:
                                //           "Please take a picture of you to continue the journey");
                                //   return;
                                // }

                                face_scan_controller.createUserRequest.sex =
                                    gender == "female" ? 0 : 1;
                                face_scan_controller.createUserRequest.age =
                                    age;

                                loading_start();
                                UpdateUserResponse result =
                                    await grpc_account_storage_controllr
                                        .update_a_user(face_scan_controller
                                            .createUserRequest);
                                loading_end();
                                if (result.error != null &&
                                    result.error.isNotEmpty) {
                                  await show_error(msg: result.error);
                                  return;
                                } else {
                                  await Get.offNamed(RoutesMap.roomList);
                                }

                                return;
                              }
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                        ),
                      ),
                      // IconButton(
                      //     icon: Icon(
                      //       flash ? Icons.flash_on : Icons.flash_off,
                      //       color: Colors.white,
                      //       size: 28,
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         flash = !flash;
                      //       });
                      //       flash
                      //           ? _cameraController
                      //               .setFlashMode(FlashMode.torch)
                      //           : _cameraController.setFlashMode(FlashMode.off);
                      //     }),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
