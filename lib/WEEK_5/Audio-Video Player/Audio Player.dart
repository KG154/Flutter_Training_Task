import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

class Audio_Player extends StatefulWidget {
  const Audio_Player({Key? key}) : super(key: key);

  @override
  State<Audio_Player> createState() => _Audio_PlayerState();
}

class _Audio_PlayerState extends State<Audio_Player> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<SongModel> songList = [];
  String currentSongTitle = '';
  int currentindex = 0;
  bool isplaying = false;
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

  requestPermission() async {
    // Web platform don't support permissions methods.
    if (!kIsWeb) {
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await _audioQuery.permissionsRequest();
      }
      setState(() {});
    }
  }

  void initState() {
    super.initState();
    requestPermission();
    _audioPlayer.currentIndexStream.listen((index) {
      if (index != null) {
        updatecurrentposition(index);
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void changeplaymusic() {
    setState(() {
      isplaying = !isplaying;
    });
  }

  Stream<DurationState> get _durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
          _audioPlayer.positionStream,
          _audioPlayer.durationStream,
          (position, duration) => DurationState(
              position: position, total: duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    if (isplaying) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)],
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: changeplaymusic, //hides the player view
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.black54,
                                    Color.fromRGBO(0, 41, 102, 1)
                                  ],
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            currentSongTitle,
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis),
                          ),
                          flex: 5,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 50),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.music_note_outlined),
                    ),
                    StreamBuilder<DurationState>(
                      stream: _durationStateStream,
                      builder: (context, snapshot) {
                        final durationState = snapshot.data;
                        final progress =
                            durationState?.position ?? Duration.zero;
                        final total = durationState?.total ?? Duration.zero;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                progress.toString().split(".")[0],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 220,
                              padding: EdgeInsets.zero,
                              margin: const EdgeInsets.only(
                                  bottom: 4.0, left: 2, right: 2, top: 5),

                              //slider bar duration state stream
                              child: StreamBuilder<DurationState>(
                                stream: _durationStateStream,
                                builder: (context, snapshot) {
                                  final durationState = snapshot.data;
                                  final progress =
                                      durationState?.position ?? Duration.zero;
                                  final total =
                                      durationState?.total ?? Duration.zero;

                                  return ProgressBar(
                                    progress: progress,
                                    total: total,
                                    barHeight: 2.0,
                                    baseBarColor: Colors.black45,
                                    thumbRadius: 7,
                                    // baseBarColor: bgColor,
                                    progressBarColor: Colors.red,
                                    thumbColor: Colors.red,

                                    timeLabelTextStyle: const TextStyle(
                                      fontSize: 0,
                                    ),
                                    onSeek: (duration) {
                                      _audioPlayer.seek(duration);
                                    },
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                total.toString().split(".")[0],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                              child: InkWell(
                            onTap: () {
                              if (_audioPlayer.hasPrevious) {
                                _audioPlayer.seekToPrevious();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: const Icon(
                                Icons.skip_previous,
                                color: Colors.white70,
                              ),
                            ),
                          )),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                if (_audioPlayer.playing) {
                                  _audioPlayer.pause();
                                } else {
                                  if (_audioPlayer.currentIndex != null) {
                                    _audioPlayer.play();
                                  }
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                margin: const EdgeInsets.only(
                                    right: 20.0, left: 20.0),
                                child: StreamBuilder<bool>(
                                  stream: _audioPlayer.playingStream,
                                  builder: (context, snapshot) {
                                    bool? playingState = snapshot.data;
                                    if (playingState != null && playingState) {
                                      return const Icon(
                                        Icons.pause,
                                        size: 30,
                                        color: Colors.white70,
                                      );
                                    }
                                    return const Icon(
                                      Icons.play_arrow,
                                      size: 30,
                                      color: Colors.white70,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                if (_audioPlayer.hasNext) {
                                  _audioPlayer.seekToNext();
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: const Icon(
                                  Icons.skip_next,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
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
              height: 200,
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
                    margin: EdgeInsets.only(top: 25),
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
                future: _audioQuery.querySongs(
                  sortType: null,
                  orderType: OrderType.ASC_OR_SMALLER,
                  uriType: UriType.EXTERNAL,
                  ignoreCase: true,
                ),
                builder: (context, indeX) {
                  // Loading content
                  if (indeX.data == null) {
                    return CircularProgressIndicator();
                  }

                  // When you try "query" without asking for [READ] or [Library] permission
                  // the plugin will return a [Empty] list.
                  if (indeX.data!.isEmpty) return const Text("Nothing found!");

                  // You can use [item.data!] direct or you can create a:
                  // List<SongModel> songs = item.data!;
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    child: ListView.builder(
                      itemCount: indeX.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black87.withOpacity(0.3),
                                    blurRadius: 1,
                                    offset: Offset(0, 1),
                                    spreadRadius: 1)
                              ],
                              border: Border.all(color: Colors.blue)),
                          child: ListTile(
                            onTap: () async {
                              changeplaymusic();
                              await _audioPlayer.setAudioSource(
                                  createplaylist(indeX.data!),
                                  initialIndex: index);
                              await _audioPlayer.play();
                            },
                            title: Text(
                              indeX.data![index].title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            subtitle: Text(
                              indeX.data![index].artist ?? "No Artist",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            trailing: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            leading: QueryArtworkWidget(
                              id: indeX.data![index].id,
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

  AudioSource createplaylist(List<SongModel> mySong) {
    List<AudioSource> sources = [];
    for (var song in mySong) {
      sources.add(AudioSource.uri(Uri.parse(song.uri!)));
    }
    return ConcatenatingAudioSource(children: sources);
  }

  void updatecurrentposition(int index) {
    setState(() {
      currentSongTitle = songList[index].title;
      currentindex = index;
    });
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
      isComplete = false;
      RecordMp3.instance.start(recordFilePath!, (type) {
        statusText = "record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "not microphone permission ";
    }
    setState(() {});
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
      isComplete = true;
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
    String sdPath = directory!.path;
    print("${sdPath}");
    var d = Directory("storage/emulated/0/Music");
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }

    return "storage/emulated/0/Music" +
        "/Recorde_${i++}${DateTime.now().millisecondsSinceEpoch}.mp3";
  }
}

class DurationState {
  DurationState({this.position = Duration.zero, this.total = Duration.zero});

  Duration position, total;
}
