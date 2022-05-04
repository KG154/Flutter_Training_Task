import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';

class play_Screen extends StatefulWidget {
  List<AssetEntity> allvideo;
  var currentIndex;

  play_Screen({Key? key, required this.allvideo, this.currentIndex})
      : super(key: key);

  @override
  State<play_Screen> createState() => _play_ScreenState();
}

class _play_ScreenState extends State<play_Screen> with WidgetsBindingObserver {
  VideoPlayerController? _controller;
  bool selected = true;
  bool fullscreen = true;
  bool valume = true;
  int nextIndex = 0;

  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _playvideo(0);
    super.initState();
  }

  _playvideo(int index) async {
    final video = await widget.allvideo[widget.currentIndex + index].file;
    _controller = VideoPlayerController.file(video!);
    updateui();
    _controller!.addListener(() {
      updateui();
    });
    _controller!.removeListener(() {
      updateui();
    });
    _controller!.setLooping(true);
    _controller!.initialize().then((value) => updateui());
    _controller!.play();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    _controller!.pause();
  }

  @override
  void dispose() {
    _controller!.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black45, Color.fromRGBO(0, 41, 102, 1)],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
                  : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  )),
            ),
            GestureDetector(
              onTap: () {
                if (selected) {
                  selected = false;
                  updateui();
                } else {
                  selected = true;
                  updateui();
                }
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
            selected
                ? Column(
              children: [
                // Row(
                //   children: [
                //     Container(
                //       // margin: const EdgeInsets.only(right: 10),
                //       child: InkWell(
                //         onTap: () {
                //           Navigator.pop(
                //             context,
                //           );
                //         },
                //         child: Container(
                //           padding: const EdgeInsets.all(10.0),
                //           child: const Icon(
                //             Icons.arrow_back_ios_new,
                //             color: Colors.white70,
                //           ),
                //         ),
                //       ),
                //     ),
                //     Flexible(
                //       child: Text(
                //         widget.allvideo[mIndex].title!,
                //         style: const TextStyle(
                //             color: Colors.white70,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18,
                //             overflow: TextOverflow.ellipsis),
                //       ),
                //     ),
                //   ],
                // ),
                Spacer(),
                Container(
                  width: double.infinity,
                  height: size.height * 0.21,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      ///slider
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10),
                              child: Text(
                                _controller!.value.position
                                    .toString()
                                    .split(".")[0],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: size.width * 0.62,
                            padding: EdgeInsets.zero,
                            margin: const EdgeInsets.only(
                                bottom: 4.0, left: 2, right: 2, top: 5),
                            //slider bar duration state stream
                            child: ProgressBar(
                              progress: _controller!.value.position,
                              total: _controller!.value.duration,
                              barHeight: 2.0,
                              baseBarColor: Colors.white,
                              thumbRadius: 10,
                              // baseBarColor: bgColor,
                              progressBarColor: Colors.blue,
                              thumbColor: Colors.indigo,
                              timeLabelTextStyle: const TextStyle(
                                fontSize: 0,
                              ),
                              onSeek: (duration) {
                                _controller!.seekTo(duration);
                              },
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              // height: 20,
                              padding:
                              EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                _controller!.value.duration
                                    .toString()
                                    .split(".")[0],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      /// play ,stop ,next,
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                if (valume) {
                                  _controller!.setVolume(0);
                                  valume = false;
                                  updateui();
                                } else {
                                  _controller!.setVolume(20);
                                  valume = true;
                                  updateui();
                                }
                                updateui();
                              },
                              child: Icon(
                                valume
                                    ? Icons.volume_down
                                    : Icons.volume_off_outlined,
                                color: Colors.white70,
                                size: 25,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (widget.currentIndex + nextIndex ==
                                    0) {
                                  log("no more previeus videos");
                                  log("${nextIndex}");
                                } else {
                                  await _controller!.dispose();
                                  log("${widget.currentIndex}");
                                  nextIndex--;
                                  log("${nextIndex}");
                                  log("${widget.currentIndex + nextIndex}");
                                  await _playvideo(nextIndex);
                                }
                              },
                              child: Icon(
                                Icons.skip_previous,
                                color: Colors.white70,
                                size: 25,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (_controller!
                                    .value.position.inSeconds >=
                                    10) {
                                  await _controller!.seekTo(Duration(
                                      seconds: _controller!
                                          .value.position.inSeconds -
                                          10));
                                } else {
                                  await _controller!
                                      .seekTo(Duration.zero);
                                }
                              },
                              child: const Icon(
                                Icons.replay_10_outlined,
                                color: Colors.white70,
                                size: 25,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_controller!.value.isPlaying) {
                                  _controller!.pause();
                                } else {
                                  // if (_controller.currentIndex != null) {
                                  _controller!.play();
                                  // }
                                }
                              },
                              child: Icon(
                                _controller!.value.isPlaying
                                    ? Icons.pause_circle_filled_outlined
                                    : Icons.play_circle_fill_outlined,
                                size: 25,
                                color: Colors.white70,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (_controller!
                                    .value.position.inSeconds <=
                                    _controller!
                                        .value.duration.inSeconds -
                                        9) {
                                  await _controller!.seekTo(Duration(
                                      seconds: _controller!
                                          .value.position.inSeconds +
                                          10));
                                } else {
                                  // _controller.seekToNext();
                                }
                              },
                              child: const Icon(
                                Icons.forward_10_outlined,
                                color: Colors.white70,
                                size: 25,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (widget.allvideo.length ==
                                    widget.currentIndex + nextIndex + 1) {
                                  log("no more next videos");
                                  log("${nextIndex}");
                                } else {
                                  await _controller!.dispose();
                                  nextIndex++;
                                  await _playvideo(nextIndex);
                                }
                              },
                              child: const Icon(
                                Icons.skip_next,
                                color: Colors.white70,
                                size: 25,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (fullscreen) {
                                  SystemChrome.setPreferredOrientations(
                                      [DeviceOrientation.landscapeLeft]);
                                  SystemChrome.setEnabledSystemUIMode(
                                      SystemUiMode.leanBack);
                                  fullscreen = false;
                                  updateui();
                                } else {
                                  SystemChrome.setPreferredOrientations(
                                      [DeviceOrientation.portraitUp]);

                                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                                      overlays: [SystemUiOverlay.bottom]);
                                  fullscreen = true;
                                  updateui();
                                }
                                updateui();
                              },
                              child: Icon(
                                fullscreen
                                    ? Icons.fullscreen_sharp
                                    : Icons.fullscreen_exit,
                                color: Colors.white70,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
