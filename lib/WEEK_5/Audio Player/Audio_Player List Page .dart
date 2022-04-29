import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:taskproject/WEEK_5/Audio%20Player/Audio Record.dart';

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
//audio plugin
  final OnAudioQuery _audioQuery = OnAudioQuery();
  bool isplaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
    gonext();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player"),
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.mic),
        backgroundColor: Colors.black87,
        onPressed: () async {
          var record = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => Recording_sound()));
          if (record == true) {
            setState(() {
              gonext();
            });
          }
        },
      ),
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
        child: FutureBuilder<List<SongModel>>(
          future: gonext(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 10, right: 10),
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
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                          // trailing: IconButton(
                          //   onPressed: () {},
                          //   color: Colors.red,
                          //   icon: const Icon(Icons.delete),
                          // ),
                          leading: const Icon(
                            Icons.music_note_outlined,
                            color: Colors.deepOrange,
                            size: 30,
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(fontSize: 50, color: Colors.black87),
                    ),
                  ),
                );
              }
            } else {
              return const SizedBox(
                width: 60,
                height: 60,
                child: Center(
                    child: CircularProgressIndicator(color: Colors.indigo)),
              );
            }
          },
        ),
      ),
    );
  }

  void changeplaymusic() {
    setState(() {
      isplaying = !isplaying;
    });
  }
}
