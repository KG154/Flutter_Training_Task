import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:taskproject/Widget/commonWidget.dart';

class Ads extends StatefulWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  BannerAd? bannerAd;
  RewardedAd? rewardedAd;
  InterstitialAd? interstitialAd;
  InterstitialAd? _interstitialVideoAd;
  RewardedInterstitialAd? rewardedInterstitialAd;
  var rewardedPoint = 0;
  var rewardedInterstitalPoint = 0;

  NativeAd? _adSmall;
  bool _isAdLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            // isLoaded = true;
          });
          print("BANNER ADS WORKING");
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );
    bannerAd!.load();
    _createInterstitialAd();
    _createRewardedAd();
    _createRewardedInterstitialAd();
    _createInterstitialvideoAd();

    _adSmall = NativeAd(
      // Here in adUnitId: add your own ad unit ID before release build
      adUnitId: NativeAd.testAdUnitId,
      factoryId: 'listTileSmall',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    _adSmall!.load();
  }

  /// InterstitialAd
  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-3940256099942544/4411468910',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');

            interstitialAd = null;
          },
        ));
  }

  void _showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) =>
            print('ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _createInterstitialAd();
        },
      );
      interstitialAd!.setImmersiveMode(true);

      interstitialAd!.show();
    }
  }

  /// Interstitial Video Ad
  void _createInterstitialvideoAd() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/8691691433",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('_interstitial video ad loaded');
            _interstitialVideoAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('_interstitial video Ad failed to load: $error.');

            _interstitialVideoAd = null;
          },
        ));
  }

  void _showInterstitialvideoAd() {
    if (_interstitialVideoAd != null) {
      _interstitialVideoAd!.fullScreenContentCallback =
          FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) =>
            print('ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          _createInterstitialvideoAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _createInterstitialvideoAd();
        },
      );
      _interstitialVideoAd!.setImmersiveMode(true);

      _interstitialVideoAd!.show();
    }
  }

  /// RewardedAd...
  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          // print('$ad loaded.');
          // // Keep a reference to the ad so you can show it later.
          rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedAd failed to load: $error');
          rewardedAd = null;
        },
      ),
    );
  }

  void _showRewardedAd() {
    if (rewardedAd != null) {
      rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad) {
          print('ad onAdShowedFullScreenContent.');
        },
        onAdDismissedFullScreenContent: (RewardedAd ad) {
          print('ad onAdDismissedFullScreenContent.');
          ad.dispose();
          _createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
          print('onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _createRewardedAd();
        },
      );
      rewardedAd!.setImmersiveMode(true);
      rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          rewardedPoint = rewardedPoint + reward.amount as int;
          Fluttertoast.showToast(
              msg: "Reward Collected",
              // msg: "${rewardedPoint} coins",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0);

          print("--------------${rewardedPoint},${reward.type}-------------");
        },
      );
    }
  }

  /// RewardedInterstitialAd
  void _createRewardedInterstitialAd() {
    RewardedInterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5354046379'
            : 'ca-app-pub-3940256099942544/6978759866',
        request: AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            print('$ad loaded.');
            rewardedInterstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedInterstitialAd failed to load: $error');
            rewardedInterstitialAd = null;
          },
        ));
  }

  void _showRewardedInterstitialAd() {
    if (rewardedInterstitialAd != null) {
      rewardedInterstitialAd!.fullScreenContentCallback =
          FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
            print('$ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          _createRewardedInterstitialAd();
        },
        onAdFailedToShowFullScreenContent:
            (RewardedInterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _createRewardedInterstitialAd();
        },
      );

      rewardedInterstitialAd!.setImmersiveMode(true);
      rewardedInterstitialAd!.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        rewardedInterstitalPoint =
            rewardedInterstitalPoint + reward.amount as int;
        Fluttertoast.showToast(
            msg: "Reward Interstitial Collected",
            // msg: "${rewardedInterstitalPoint} coins",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        print(
            '----------------(${rewardedInterstitalPoint}, ${reward.type})-----------------------');
      });
    }
  }

  // final _controller = NativeAdmobController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bannerAd!.dispose();
    rewardedAd!.dispose();
    interstitialAd!.dispose();
    rewardedInterstitialAd!.dispose();
    _adSmall!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admob Ads",
          // style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: bannerAd!.size.height.toDouble(),
              width: bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: bannerAd!),
            ),
            Text(
              "Admob Banner Ad",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                _showInterstitialAd();
              },
              child: commonButton(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                title: "InterstitialAd",
                // width: size.width * 0.40,
                height: size.height * 0.07,
              ),
            ),
            InkWell(
              onTap: () {
                _showInterstitialvideoAd();
              },
              child: commonButton(
                margin: EdgeInsets.only(bottom: 30),
                title: "Interstitial Video",
                // width: size.width * 0.40,
                height: size.height * 0.08,
              ),
            ),

//             Container(
//                 height: 330,
//                 child: NativeAdmob(
//                   adUnitID: "ca-app-pub-3940256099942544/2247696110",
//                   loading: Center(child: CircularProgressIndicator()),
//                   error: Text("Failed to load the ad"),
//                   controller: _controller,
//                   type: NativeAdmobType.full,
//                   options: NativeAdmobOptions(
//                     ratingColor: Colors.green,
// // Others ...
//                   ),
//                 )
//             ),

            _isAdLoaded
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: AdWidget(ad: _adSmall!),
                      height: 150,
                      width: 400,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              "Native Ad",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                _showRewardedAd();
              },
              child: commonButton(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                title: "RewardedAd",
                // width: size.width * 0.40,
                height: size.height * 0.07,
              ),
            ),
            InkWell(
              onTap: () {
                _showRewardedInterstitialAd();
              },
              child: commonButton(
                margin: EdgeInsets.only(bottom: 30),
                title: "Rewarded InterstitialAd",
                // width: size.width * 0.40,
                height: size.height * 0.08,
              ),
            ),
            // Text(
            //   "Native Video Ad",
            //   style: TextStyle(fontSize: 20, color: Colors.white),
            // ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
