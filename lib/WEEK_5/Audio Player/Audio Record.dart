import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

class Recording_sound extends StatefulWidget {
  @override
  _Recording_soundState createState() => _Recording_soundState();
}

class _Recording_soundState extends State<Recording_sound> {
  String statusText = "";
  bool isComplete = false;
  bool status = true;
  int timeCount = 0;
  Timer? timer;

  Duration duration = Duration();
  bool countDown = true;

  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    stopRecord();
    super.dispose();
  }

  /// start record timer
  startTime() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeCount++;
      });
    });
  }

  /// second duration
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

  /// check mic permission
  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  /// start record
  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      // isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }

  /// pause record
  void pauseRecord() {
    timer?.cancel();
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {
          startTime();

          // timeCount++;
        });
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause";
        setState(() {});
      }
    }
  }

  /// stop record
  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Recording complete";
      // isComplete = true;
      setState(() {
        timer?.cancel();
        timeCount = 0;
      });
    }
  }

  /// resume record
  void resumeRecord() {
    timer?.cancel();
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      setState(() {});
    }
  }

  late String recordFilePath;

  int i = 0;

  /// record save file path
  Future<String> getFilePath() async {
    Directory? storageDirectory = await getExternalStorageDirectory();
    String sdPath = storageDirectory!.path + "/record";
    print(sdPath);
    var d = Directory("storage/emulated/0/Music");
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }

    return "storage/emulated/0/Music" +
        "/Record${DateTime.now().millisecondsSinceEpoch}.mp3";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Recording'),
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 50),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)],
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("Images/recordaudio.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
                child: Text(
              _printDuration(Duration(seconds: timeCount)),
              style: TextStyle(fontSize: 50, color: Colors.white),
            )),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: status
                      ? IconButton(
                          onPressed: () async {
                            startRecord();
                            startTime();
                            setState(() {
                              status = false;
                              print(status);
                            });
                          },
                          icon: Icon(Icons.mic),
                          color: Colors.white,
                          iconSize: 40,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () async {
                                pauseRecord();
                              },
                              icon: Icon(
                                RecordMp3.instance.status == RecordStatus.PAUSE
                                    ? Icons.play_circle_filled
                                    : Icons.pause_circle_filled,
                              ),
                              iconSize: 50,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            IconButton(
                              onPressed: () async {
                                stopRecord();
                                setState(() {
                                  status = true;
                                });
                                Navigator.pop(context, true);
                              },
                              icon: Icon(Icons.check_circle),
                              color: Colors.white,
                              iconSize: 50,
                            ),
                          ],
                        ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0),
            //   child: Text(
            //     statusText,
            //     style: TextStyle(color: Colors.red, fontSize: 20),
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
// void play() {
//   if (recordFilePath != null && File(recordFilePath).existsSync()) {
//     AudioPlayer audioPlayer = AudioPlayer();
//     audioPlayer.play(recordFilePath, isLocal: true);
//   }
// }
}
