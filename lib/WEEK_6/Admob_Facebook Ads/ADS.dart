import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:taskproject/WEEK_6/Admob_Facebook%20Ads/bannerad.dart';
import 'package:taskproject/Widget/commonWidget.dart';

class Ads extends StatefulWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  bool isLoaded = false;
  RewardedAd? rewardedAd;
  InterstitialAd? interstitialAd;
  RewardedInterstitialAd? rewardedInterstitialAd;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Admob InterstitialAd
    InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            setState(() {
              isLoaded = true;
              this.interstitialAd = ad;
            });
            print("its workingffff");
          },
          onAdFailedToLoad: (error) {
            print("its not working");
          },
        ));

    /// Admob RewardedAd
    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          print("Rewarded ads load");
          setState(() {
            isLoaded = true;
            this.rewardedAd = ad;
          });
        },
        onAdFailedToLoad: (error) {
          print("Rewarded adsnot load");
        },
      ),
    );

    ///
    RewardedInterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (RewardedInterstitialAd ad) {
          print('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          this.rewardedInterstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedInterstitialAd failed to load: $error');
        },
      ),
    );

    ///
    FacebookAudienceNetwork.init(
      testingId: "a77955ee-3304-4635-be65-81029b0f5201",
      iOSAdvertiserTrackingEnabled: true,
    );
  }

  fbBannerAd() {
    Container(
      alignment: Alignment(0.5, 1),
      child: FacebookBannerAd(
        placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047",
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          switch (result) {
            case BannerAdResult.ERROR:
              print("Error: $value");
              break;
            case BannerAdResult.LOADED:
              print("Loaded: $value");
              break;
            case BannerAdResult.CLICKED:
              print("Clicked: $value");
              break;
            case BannerAdResult.LOGGING_IMPRESSION:
              print("Logging Impression: $value");
              break;
          }
        },
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admob/Facebook Ads",
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
          padding: EdgeInsets.only(top: 20, bottom: 20),
          children: [
            const Center(
                child: Text(
              "Admob Ads..",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return TestBannerAd();
                      },
                    ));
                  },
                  child: commonButton(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    title: "BannerAd",
                    width: size.width * 0.40,
                    height: size.height * 0.07,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (isLoaded) {
                      interstitialAd!.show();
                    }
                    setState(() {});
                  },
                  child: commonButton(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    title: "InterstitialAd",
                    width: size.width * 0.40,
                    height: size.height * 0.07,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    rewardedAd!.show(onUserEarnedReward: (ad, reward) {
                      print("rewardedAd show");
                    });
                  },
                  child: commonButton(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    title: "RewardedAd",
                    width: size.width * 0.40,
                    height: size.height * 0.07,
                  ),
                ),
                commonButton(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  title: "Native Advanced",
                  width: size.width * 0.40,
                  height: size.height * 0.07,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: commonButton(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    title: "Interstitial Video",
                    width: size.width * 0.40,
                    height: size.height * 0.08,
                  ),
                ),
                InkWell(
                  onTap: () {
                    rewardedInterstitialAd!.show(onUserEarnedReward: (ad, reward) {
                      print("rewardedInterstitialAd show");
                    },);
                  },
                  child: commonButton(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    title: "Rewarded InterstitialAd",
                    width: size.width * 0.40,
                    height: size.height * 0.08,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              "Facebook Ads..",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    fbBannerAd();
                  },
                  child: commonButton(
                    title: "fbBannerAd",
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    width: size.width * 0.40,
                    height: size.height * 0.07,
                  ),
                ),
                commonButton(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  title: "InterstitialAd",
                  width: size.width * 0.40,
                  height: size.height * 0.07,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonButton(
                  title: "Medium rectangleAd",
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  width: size.width * 0.40,
                  height: size.height * 0.08,
                ),
                commonButton(
                  title: "NativeAd",
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  width: size.width * 0.40,
                  height: size.height * 0.08,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonButton(
                  title: "Native BannerAd",
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  width: size.width * 0.40,
                  height: size.height * 0.08,
                ),
                commonButton(
                  title: "RewardedAd",
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  width: size.width * 0.40,
                  height: size.height * 0.08,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
