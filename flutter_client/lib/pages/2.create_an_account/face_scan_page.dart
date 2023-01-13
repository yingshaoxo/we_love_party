import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

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
  // final MLService _mlService = MLService();
  List<Face> facesDetected = [];

  CameraImage? temp_image;

  @override
  void initState() {
    super.initState();
    () async {
      cameras = await availableCameras();

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
    }();
  }

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

  Future<void> detectFacesFromImage(CameraImage cameraImage) async {
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
    if (result.isNotEmpty) {
      facesDetected = result;
    }
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
                        width: 0.3.sw,
                        child: TextButton(
                          child: Text("Capture"),
                          onPressed: () async {
                            var image =
                                await take_a_picture_from_camera_stream();
                            await detectFacesFromImage(image);
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
