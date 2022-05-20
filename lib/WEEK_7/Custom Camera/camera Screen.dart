import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskproject/WEEK_7/Custom%20Camera/videoPage.dart';
import 'package:taskproject/main.dart';
import 'package:video_player/video_player.dart';

import 'Image&Video Show Screen.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  VideoPlayerController? videoController;
  File? _imageFile;
  File? _videoFile;
  FlashMode? _currentFlashMode;

  bool _isCameraPermissionGranted = false;
  bool _isCameraInitialized = false;
  bool _isFrontCameraSelected = true;
  bool _isFaceLiteSelected = true;
  bool _isTouchSelected = true;

  ///
  double _currentZoomLevel = 1.0;
  double _currentExposureOffset = 0.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;

  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  List<File> allFileList = [];
  final resolutionPresets = ResolutionPreset.values;

  @override
  void initState() {
    super.initState();
    // getPermissionStatus();
    // onNewCameraSelected(cameras![0]);

    controller = CameraController(cameras![0], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        onNewCameraSelected(cameras![0]);
        refreshAlreadyCapturedImages();
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  // getPermissionStatus() async {
  //   await Permission.camera.request();
  //   var status = await Permission.camera.status;
  //
  //   if (status.isGranted) {
  //     log('Camera Permission: GRANTED');
  //     setState(() {
  //       _isCameraPermissionGranted = true;
  //     });
  //     // Set and initialize the new camera
  //     onNewCameraSelected(cameras![0]);
  //     refreshAlreadyCapturedImages();
  //   } else {
  //     log('Camera Permission: DENIED');
  //   }
  // }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      currentResolutionPreset,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await previousCameraController?.dispose();

    resetCameraValues();

    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await cameraController.initialize();
      await Future.wait([
        cameraController
            .getMinExposureOffset()
            .then((value) => _minAvailableExposureOffset = value),
        cameraController
            .getMaxExposureOffset()
            .then((value) => _maxAvailableExposureOffset = value),
        cameraController
            .getMaxZoomLevel()
            .then((value) => _maxAvailableZoom = value),
        cameraController
            .getMinZoomLevel()
            .then((value) => _minAvailableZoom = value),
      ]);

      _currentFlashMode = controller!.value.flashMode;
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        controller!.value.isInitialized;
      });
    }
  }

  void resetCameraValues() async {
    _currentZoomLevel = 1.0;
    _currentExposureOffset = 0.0;
  }

  ///tack photo
  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;

    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occured while taking picture: $e');
      return null;
    }
  }

  refreshAlreadyCapturedImages() async {
    final directory = await getApplicationDocumentsDirectory();
    // print("image Path : - ${directory}");
    List<FileSystemEntity> fileList = await directory.list().toList();
    allFileList.clear();
    List<Map<int, dynamic>> fileNames = [];

    fileList.forEach((file) {
      if (file.path.contains('.jpg') || file.path.contains('.mp4')) {
        allFileList.add(File(file.path));
        // print("---------------------------------${allFileList}");

        String name = file.path.split('/').last.split('.').first;
        fileNames.add({0: int.parse(name), 1: file.path.split('/').last});
      }
    });

    if (fileNames.isNotEmpty) {
      final recentFile =
          fileNames.reduce((curr, next) => curr[0] > next[0] ? curr : next);
      String recentFileName = recentFile[1];
      if (recentFileName.contains('.mp4')) {
        _videoFile = File('${directory.path}/$recentFileName');
        print("video Path : - ${_videoFile}");

        _imageFile = null;
        // _startVideoPlayer();
      } else {
        _imageFile = File('${directory.path}/$recentFileName');
        print("_imageFile Path : - ${_imageFile}");

        _videoFile = null;
      }

      setState(() {});
    }
  }

  /// video

  bool _isRecordingInProgress = false;

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = controller;

    if (controller!.value.isRecordingVideo) {
      // A recording has already started, do nothing.
      return;
    }

    try {
      await cameraController!.startVideoRecording();
      setState(() {
        _isRecordingInProgress = true;
        print(_isRecordingInProgress);
      });
    } on CameraException catch (e) {
      print('Error starting to record video: $e');
    }
  }

  Future<XFile?> stopVideoRecording() async {
    if (!controller!.value.isRecordingVideo) {
      // Recording is already is stopped state
      return null;
    }

    try {
      XFile file = await controller!.stopVideoRecording();
      setState(() {
        _isRecordingInProgress = false;
      });
      return file;
    } on CameraException catch (e) {
      print('Error stopping video recording: $e');
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    if (!controller!.value.isRecordingVideo) {
      // Video recording is not in progress
      return;
    }

    try {
      await controller!.pauseVideoRecording();
    } on CameraException catch (e) {
      print('Error pausing video recording: $e');
    }
  }

  Future<void> resumeVideoRecording() async {
    if (!controller!.value.isRecordingVideo) {
      // No video recording was in progress
      return;
    }

    try {
      await controller!.resumeVideoRecording();
    } on CameraException catch (e) {
      print('Error resuming video recording: $e');
    }
  }

  Future<void> _startVideoPlayer() async {
    if (_videoFile != null) {
      videoController = VideoPlayerController.file(_videoFile!);
      await videoController!.initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized,
        // even before the play button has been pressed.
        setState(() {});
      });
      await videoController!.setLooping(true);
      await videoController!.pause();
    }
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    controller!.setExposurePoint(offset);
    controller!.setFocusPoint(offset);
  }

  @override
  void dispose() {
    controller?.dispose();
    videoController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child:
              // _isCameraPermissionGranted
              //     ?
              controller!.value.isInitialized
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: 1 / controller!.value.aspectRatio,
                          child: Stack(
                            children: [
                              CameraPreview(
                                controller!,
                                child: LayoutBuilder(builder:
                                    (BuildContext context,
                                        BoxConstraints constraints) {
                                  final scale = 1 /
                                      (controller!.value.aspectRatio *
                                          MediaQuery.of(context)
                                              .size
                                              .aspectRatio);
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTapDown: (details) =>
                                        onViewFinderTap(details, constraints),
                                    child: Transform.scale(
                                        alignment: Alignment.center,
                                        scale: scale,
                                        child: CameraPreview(controller!)),
                                  );
                                }),
                              ),

                              ///
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _isFaceLiteSelected
                                        ? InkWell(
                                            onTap: () async {
                                              setState(() {
                                                _currentFlashMode =
                                                    FlashMode.always;
                                              });
                                              await controller!.setFlashMode(
                                                FlashMode.always,
                                              );
                                              _isFaceLiteSelected = false;
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.flash_on,
                                              color: Colors.white,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () async {
                                              setState(() {
                                                _currentFlashMode =
                                                    FlashMode.off;
                                              });
                                              await controller!.setFlashMode(
                                                FlashMode.off,
                                              );
                                              _isFaceLiteSelected = true;
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.flash_off,
                                              color: Colors.amber,
                                            ),
                                          ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isCameraInitialized = false;
                                        });
                                        onNewCameraSelected(cameras![
                                            _isFrontCameraSelected ? 1 : 0]);
                                        setState(() {
                                          _isFrontCameraSelected =
                                              !_isFrontCameraSelected;
                                        });
                                      },
                                      child: _isRecordingInProgress
                                          ? Container()
                                          : Icon(
                                              _isFrontCameraSelected
                                                  ? Icons.photo_camera_outlined
                                                  : Icons.photo_camera_sharp,
                                              color: Colors.white38,
                                              size: 35,
                                            ),
                                    ),
                                    _isTouchSelected
                                        ? InkWell(
                                            onTap: () async {
                                              setState(() {
                                                _currentFlashMode =
                                                    FlashMode.torch;
                                              });
                                              await controller!.setFlashMode(
                                                FlashMode.torch,
                                              );
                                              _isTouchSelected = false;
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.highlight,
                                              color: Colors.white,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () async {
                                              setState(() {
                                                _currentFlashMode =
                                                    FlashMode.torch;
                                              });
                                              await controller!.setFlashMode(
                                                FlashMode.off,
                                              );
                                              _isTouchSelected = true;
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.highlight,
                                              color: Colors.amber,
                                            ),
                                          ),
                                  ],
                                ),
                              ),

                              ///

                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  16.0,
                                  8.0,
                                  16.0,
                                  8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Slider(
                                            value: _currentZoomLevel,
                                            min: _minAvailableZoom,
                                            max: _maxAvailableZoom,
                                            activeColor: Colors.white,
                                            inactiveColor: Colors.white30,
                                            onChanged: (value) async {
                                              setState(() {
                                                _currentZoomLevel = value;
                                              });
                                              await controller!
                                                  .setZoomLevel(value);
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black87,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                _currentZoomLevel
                                                        .toStringAsFixed(1) +
                                                    'x',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        /// Start video record & pause - Resume video

                                        InkWell(
                                          onTap: () async {
                                            _isRecordingInProgress
                                                ? controller!
                                                        .value.isRecordingPaused
                                                    ? await resumeVideoRecording()
                                                    : await pauseVideoRecording()
                                                : await startVideoRecording();
                                          },
                                          child: _isRecordingInProgress
                                              ? controller!
                                                      .value.isRecordingPaused
                                                  ? Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.circle,
                                                          color: Colors.white,
                                                          size: 80,
                                                        ),
                                                        Icon(
                                                          Icons.play_arrow,
                                                          color:
                                                              Colors.redAccent,
                                                          size: 35,
                                                        ),
                                                      ],
                                                    )
                                                  : Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.circle,
                                                          color: Colors.white,
                                                          size: 80,
                                                        ),
                                                        Icon(
                                                          Icons.pause,
                                                          color:
                                                              Colors.redAccent,
                                                          size: 35,
                                                        ),
                                                      ],
                                                    )
                                              : Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.white,
                                                      size: 80,
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.redAccent,
                                                      size: 35,
                                                    ),
                                                  ],
                                                ),
                                        ),

                                        ///  CapturedImages & stop record video
                                        InkWell(
                                          onTap: _isRecordingInProgress
                                              ? () async {
                                                  XFile? rawVideo =
                                                      await stopVideoRecording();
                                                  File videoFile =
                                                      File(rawVideo!.path);

                                                  int currentUnix = DateTime
                                                          .now()
                                                      .millisecondsSinceEpoch;

                                                  final directory =
                                                      await getApplicationDocumentsDirectory();

                                                  String fileFormat = videoFile
                                                      .path
                                                      .split('.')
                                                      .last;

                                                  _videoFile =
                                                      await videoFile.copy(
                                                    '${directory.path}/$currentUnix.$fileFormat',
                                                  );

                                                  GallerySaver.saveVideo(
                                                      videoFile.path);
                                                  refreshAlreadyCapturedImages();
                                                  _startVideoPlayer();
                                                  // setState(() {});
                                                }
                                              : () async {
                                                  XFile? rawImage =
                                                      await takePicture();
                                                  File imageFile =
                                                      File(rawImage!.path);

                                                  int currentUnix = DateTime
                                                          .now()
                                                      .millisecondsSinceEpoch;

                                                  final directory =
                                                      await getApplicationDocumentsDirectory();

                                                  String fileFormat = imageFile
                                                      .path
                                                      .split('.')
                                                      .last;

                                                  print(fileFormat);

                                                  GallerySaver.saveImage(
                                                      imageFile.path);
                                                  await imageFile.copy(
                                                    '${directory.path}/$currentUnix.$fileFormat',
                                                  );

                                                  refreshAlreadyCapturedImages();
                                                  setState(() {});
                                                },
                                          child: _isRecordingInProgress
                                              ? Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.white38,
                                                      size: 80,
                                                    ),
                                                    Icon(
                                                      Icons.stop_rounded,
                                                      color: Colors.white,
                                                      size: 35,
                                                    ),
                                                  ],
                                                )
                                              : Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.white38,
                                                      size: 80,
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.white,
                                                      size: 60,
                                                    ),
                                                  ],
                                                ),
                                        ),

                                        /// show image and video container

                                        InkWell(
                                          onTap: () {
                                            if (_imageFile != null) {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      imageVideo_Show_Screen(
                                                    imageFile: _imageFile!,
                                                    fileList: allFileList,
                                                  ),
                                                ),
                                              );
                                            } else if (videoController !=
                                                    null &&
                                                videoController!
                                                    .value.isInitialized &&
                                                _videoFile != null) {
                                              final route = MaterialPageRoute(
                                                fullscreenDialog: true,
                                                builder: (_) => VideoPage(
                                                    videoPath:
                                                        _videoFile!.path),
                                              );
                                              Navigator.push(context, route);
                                            } else {
                                              return null;
                                            }
                                          },
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                              image: _imageFile != null
                                                  ? DecorationImage(
                                                      image: FileImage(
                                                          _imageFile!),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : null,
                                            ),
                                            child: videoController != null &&
                                                    videoController!
                                                        .value.isInitialized &&
                                                    _videoFile != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: AspectRatio(
                                                      aspectRatio:
                                                          videoController!.value
                                                              .aspectRatio,
                                                      child: VideoPlayer(
                                                          videoController!),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container()

          // Center(
          //             child: Text(
          //               'LOADING',
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           )
          // : Center(
          //     child: ElevatedButton(
          //       onPressed: () {
          //         getPermissionStatus();
          //       },
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           'Give permission',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 24,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          ),
    );
  }
}
