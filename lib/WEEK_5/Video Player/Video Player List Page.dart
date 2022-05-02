import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_manager/photo_manager.dart';

import 'Video Player Play Screen.dart';


// class VideoDetail {
//   static List<AssetEntity> assets = [];
// }

class videoPlayerDemo_ extends StatefulWidget {
  const videoPlayerDemo_({Key? key}) : super(key: key);

  @override
  State<videoPlayerDemo_> createState() => _videoPlayerDemo_State();
}

class _videoPlayerDemo_State extends State<videoPlayerDemo_> {
  List<AssetEntity> assets = [];

  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  _fetchVideos() async {
    final video = await PhotoManager.getAssetPathList(type: RequestType.video);
    final allvideos = video.first;
    final videoAssets =
        await allvideos.getAssetListRange(start: 0, end: allvideos.assetCount);
    assets = videoAssets;
    updateui();
  }

  @override
  void initState() {
    _fetchVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
        backgroundColor: Colors.black45,
        centerTitle: true,
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
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              mainAxisExtent: 150,
            ),
            itemCount: assets.length,
            itemBuilder: (context, index) {
              return FutureBuilder<Uint8List?>(
                future: assets[index].thumbData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return InkWell(
                        onTap: () {
                          print(assets[index].relativePath.toString());
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => play_Screen(
                                allvideo: assets,
                                currentIndex: index,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 5, top: 10, bottom: 5, right: 5),
                          alignment: Alignment.center,
                          height: size.height * 0.10,
                          width: size.width * 0.06,
                          // color: Colors.black45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 2),
                                height: size.height * 0.130,
                                width: size.width * 0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: DecorationImage(
                                    image: MemoryImage(snapshot.data!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(1),
                                      margin: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          size.width * 0.012,
                                          size.width * 0.012),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                            size: size.width * 0.035,
                                          ),
                                          Text(
                                            assets[index]
                                                        .videoDuration
                                                        .inHours ==
                                                    0
                                                ? "${assets[index].videoDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${assets[index].videoDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}"
                                                : '${assets[index].videoDuration.inHours.toString().padLeft(2, '0')}:${assets[index].videoDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${assets[index].videoDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: size.width * 0.025),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  alignment: Alignment.bottomRight,
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(top: 8, left: 4, right: 5),
                                width: size.width * 0.45,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // assets[index].relativePath.toString(),
                                      assets[index].title!.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text(
                            "No Data",
                            style:
                                TextStyle(fontSize: 50, color: Colors.black87),
                          ),
                        ),
                      );
                    }
                  } else {
                    return const SizedBox(
                      width: 60,
                      height: 60,
                      child: Center(
                          child:
                              CircularProgressIndicator(color: Colors.white)),
                    );
                  }
                },
              );
            }),
      ),
    );
  }
}
