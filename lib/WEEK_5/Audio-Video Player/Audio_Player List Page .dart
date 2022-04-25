import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

import 'Audio_Player_PlayPage.dart';

class SongDetail {
  static List<SongModel> allsongs = [];
}

class Audio_Player extends StatefulWidget {
  const Audio_Player({Key? key}) : super(key: key);

  @override
  State<Audio_Player> createState() => _Audio_PlayerState();
}

class _Audio_PlayerState extends State<Audio_Player> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isplaying = false;

  /// permission
  requestPermission() async {
    if (!kIsWeb) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
    stopRecord();
    gonext();
  }

  /// future modal /
  Future<List<SongModel>> gonext() async {
    SongDetail.allsongs = await _audioQuery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    // setState(() {});
    return SongDetail.allsongs;
  }

  /// Record /
  String statusText = "";
  bool isComplete = false;
  bool status = true;
  int i = 0;
  Timer? _timer;
  int timeCount = 0;
  String? recordFilePath;

  startTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (time) {
      setState(() {
        timeCount++;
      });
    });
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    if (twoDigits(duration.inHours) != "00") {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else if (twoDigits(duration.inHours) == "00") {
      if (twoDigitMinutes != "00") {
        return "$twoDigitMinutes:$twoDigitSeconds";
      } else {
        return twoDigitSeconds;
      }
    } else {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    }
  }

  void changeplaymusic() {
    setState(() {
      isplaying = !isplaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _timer?.cancel();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Audio Player",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.black45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _printDuration(Duration(seconds: timeCount)),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: status
                        ? IconButton(
                            onPressed: () {
                              startRecord();
                              startTime();

                              setState(() {
                                status = false;
                                print(status);
                              });
                            },
                            icon: Icon(
                              Icons.mic,
                              size: 35,
                              color: Colors.white,
                            ))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  pauseRecord();
                                },
                                child: Icon(
                                  RecordMp3.instance.status ==
                                          RecordStatus.PAUSE
                                      ? Icons.play_circle_filled
                                      : Icons.pause_circle_filled,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  stopRecord();
                                  setState(() {
                                    status = true;
                                    print(status);
                                  });
                                },
                                child: Container(
                                  //   color: Colors.black26,
                                  child: Icon(
                                    Icons.check_circle,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  //  color: Colors.black,
                                  height: 50,
                                  width: 60,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: FutureBuilder<List<SongModel>>(
                // Default values:
                future: gonext(),
                builder: (context, snapshot) {
                  // Loading content
                  if (snapshot.data == null) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.data!.isEmpty)
                    return Center(child: const Text("Nothing found!"));

                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    child: ListView.builder(
                      itemCount: SongDetail.allsongs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black87.withOpacity(0.3),
                                    blurRadius: 1,
                                    offset: const Offset(0, 1),
                                    spreadRadius: 1)
                              ],
                              border: Border.all(color: Colors.blue)),
                          child: ListTile(
                            onTap: () {
                              changeplaymusic();
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return AudioPage(
                                    isplaying: true,
                                    allSongs: SongDetail.allsongs,
                                    currentIndex: index,
                                  );
                                },
                              ));
                            },
                            title: Text(
                              SongDetail.allsongs[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            subtitle: Text(
                              SongDetail.allsongs[index].artist ?? "No Artist",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            trailing: IconButton(
                              onPressed: () {

                              },
                              color: Colors.red,
                              icon: const Icon(Icons.delete),
                            ),
                            leading: QueryArtworkWidget(
                              id: SongDetail.allsongs[index].id,
                              type: ArtworkType.AUDIO,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      // isComplete = false;
      RecordMp3.instance.start(recordFilePath!, (type) {
        statusText = "record error--->$type";
        // setState(() {});
      });
    } else {
      statusText = "not microphone permission ";
    }
    // setState(() {});
  }

  void pauseRecord() {
    _timer?.cancel();
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        startTime();
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      // isComplete = true;
      _timer?.cancel();
      timeCount = 0;
      setState(() {});
    }
  }

  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      setState(() {});
    }
  }

  void play() {
    if (recordFilePath != null && File(recordFilePath!).existsSync()) {
      _audioPlayer.play();

      // _audioPlayer.play(recordFilePath, isLocal: true);
    }
  }

  Future<String> getFilePath() async {
    final directory = await getExternalStorageDirectory();
    String sdPath = directory!.path + "/recordfile";
    print("Path : - ${sdPath}");
    var d = Directory("storage/emulated/0/Recording");
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }

    return "storage/emulated/0/Recording" +
        "/Recorde_${i++}${DateTime.now().millisecondsSinceEpoch}.mp3";
  }


  ///

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      print(e);
      // Error in getting access to the file.
    }
  }
}
