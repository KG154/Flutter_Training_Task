import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/rxdart.dart';

import 'Audio_Player List Page .dart';

class AudioPage extends StatefulWidget {
  final allSongs;
  final currentIndex;
  bool isplaying;

  AudioPage(
      {Key? key, this.allSongs, this.currentIndex, required this.isplaying})
      : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  String sName = "";
  String currentSongTitle = '';

  // int currentindex = 0;
  var mIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mIndex = widget.currentIndex;
    _audioPlayer.currentIndexStream.listen((index) {
      if (index != null) {
        updatecurrentposition(index);
      }
    });
    _audioPlayer.setAudioSource(createplaylist(SongDetail.allsongs),
        initialIndex: mIndex);
    _audioPlayer.play();
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
      currentSongTitle = widget.allSongs[mIndex].title;
      mIndex = index;
    });
  }

  @override
  void deactivate() {
    print("Deactivate");
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.deactivate();
  }

  @override
  void dispose() {
    print("Dispose");
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  Stream<DurationState> get _durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
          _audioPlayer.positionStream,
          _audioPlayer.durationStream,
          (position, duration) => DurationState(
              position: position, total: duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
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
                          onTap: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          //hides the player view
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            // decoration: const BoxDecoration(
                            //   gradient: LinearGradient(
                            //     begin: Alignment.topRight,
                            //     end: Alignment.bottomLeft,
                            //     colors: [
                            //       Colors.black54,
                            //       Color.fromRGBO(0, 41, 102, 1)
                            //     ],
                            //   ),
                            // ),
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
                      final progress = durationState?.position ?? Duration.zero;
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
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          onTap: () async {
                            await _audioPlayer.seek(Duration(
                                seconds: _audioPlayer.position.inSeconds - 10));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: const Icon(
                              Icons.keyboard_arrow_left_sharp,
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
                              // padding: const EdgeInsets.all(20.0),
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
                          onTap: () async {
                            await _audioPlayer.seek(Duration(
                                seconds: _audioPlayer.position.inSeconds + 10));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: const Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Colors.white70,
                            ),
                          ),
                        )),
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
}

class DurationState {
  DurationState({this.position = Duration.zero, this.total = Duration.zero});

  Duration position, total;
}
