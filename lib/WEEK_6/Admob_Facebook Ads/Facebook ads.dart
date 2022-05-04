import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taskproject/Widget/commonWidget.dart';

class fbAds extends StatefulWidget {
  const fbAds({Key? key}) : super(key: key);

  @override
  State<fbAds> createState() => _fbAdsState();
}

class _fbAdsState extends State<fbAds> {
  bool _isInterstitialAdLoaded = false;
  bool _isRewardedAdLoaded = false;
  var rewardedcoins = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FacebookAudienceNetwork.init(
      testingId: "a77955ee-3304-4635-be65-81029b0f5201",
      iOSAdvertiserTrackingEnabled: true,
    );
    _loadInterstitialAd();
    _RewardedVideoAd();
  }

  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      // "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          print("Interstitial Ad show");
        _isInterstitialAdLoaded = true;

        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  void _RewardedVideoAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId:
          // "VID_HD_9_16_39S_APP_INSTALL#898853027568012_965302514256396",
          "VID_HD_9_16_39S_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        print("Rewarded Ad: $result --> $value");
        if (result == RewardedVideoAdResult.LOADED) {
          print("Rewarded Loaded");
          _isRewardedAdLoaded = true;
        }

        if (result == RewardedVideoAdResult.VIDEO_CLOSED) {
          _isRewardedAdLoaded = false;
          _RewardedVideoAd();
        }
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE &&
            (value == true || value["invalidated"] == true)) {
          print("User Got Rewaed");
          rewardedcoins = rewardedcoins + 10;
          Fluttertoast.showToast(
              msg: "Reward Collected",
              // msg: "${revordpoint} coins",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0);
          print(rewardedcoins);
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Facebook Ads",
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
              alignment: Alignment(0.5, 1),
              child: FacebookBannerAd(
                placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                bannerSize: BannerSize.STANDARD,
                keepAlive: true,
                listener: (result, value) {
                  print("FbBannre Ad: $result --> $value");
                },
              ),
            ),
            Text(
              "Banner Ad",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                if (_isInterstitialAdLoaded) {
                  FacebookInterstitialAd.showInterstitialAd();
                }
              },
              child: commonButton(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                title: "InterstitialAd",
                width: size.width * 0.40,
                height: size.height * 0.07,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment(0.5, 1),
              child: FacebookNativeAd(
                adType: NativeAdType.NATIVE_AD,
                placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                width: double.infinity,
                height: 200,
                backgroundColor: Colors.blue,
                titleColor: Colors.white,
                descriptionColor: Colors.white60,
                labelColor: Colors.white60,
                buttonColor: Colors.purple,
                buttonTitleColor: Colors.white,
                buttonBorderColor: Colors.white,
                listener: (result, value) {
                  print("Native Banner Ad: $result --> $value");
                },
              ),
            ),
            Text("NativeAd Ad",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
              alignment: Alignment(0.5, 1),
              child: FacebookNativeAd(
                adType: NativeAdType.NATIVE_BANNER_AD,
                placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                width: double.infinity,
                height: 50,
                backgroundColor: Colors.blue,
                titleColor: Colors.white,
                descriptionColor: Colors.white60,
                labelColor: Colors.white60,
                buttonColor: Colors.purple,
                buttonTitleColor: Colors.white,
                buttonBorderColor: Colors.white,
                listener: (result, value) {
                  print("Native Banner Ad: $result --> $value");
                },
              ),
            ),
            Text("Native BannerAd Ad",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            InkWell(
              onTap: () {
                if (_isRewardedAdLoaded) {
                  FacebookRewardedVideoAd.showRewardedVideoAd();
                }
              },
              child: commonButton(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                title: "RewardedAd Ad",
                width: size.width * 0.40,
                height: size.height * 0.07,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              // alignment: Alignment(0.5, 1),
              child: FacebookBannerAd(
                placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                bannerSize: BannerSize.MEDIUM_RECTANGLE,
                keepAlive: true,
                listener: (result, value) {
                  print("FbBannre   MEDIUM_RECTANGLE Ad: $result --> $value");
                },
              ),
            ),
            Text("Medium Rectangle Ad",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
