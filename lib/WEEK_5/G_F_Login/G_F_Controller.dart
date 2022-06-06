import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';
import 'loginScrenn.dart';

class FGAuthControler extends GetxController {
  final auth = FirebaseAuth.instance;
  Rx<AuthUserData> userdata = AuthUserData().obs;

  RxString providerId = "".obs;

  googleAuth() async {
    try {
      final _pref = await SharedPreferences.getInstance();
      final googleSignIn = await GoogleSignIn().signIn();

      final authprovider = await googleSignIn!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: authprovider.accessToken, idToken: authprovider.idToken);

      Get.dialog(
          Material(
            // color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          barrierDismissible: false);

      print(googleSignIn.email);
      final user = await auth.signInWithCredential(credential);
      print("====1");
      Get.back();

      if (user.user != null) {
        userdata.value = AuthUserData(
            name: user.user!.displayName,
            email: user.user!.email,
            photoURL: user.user!.photoURL);
        print("====2");
        providerId.value = auth.currentUser!.providerData.first.providerId;
        _pref.setString("providerId", providerId.value);
        _pref.setString("name", user.user!.displayName!);
        _pref.setString("email", user.user!.email!);
        _pref.setString("photoURL", user.user!.photoURL!);

        Get.off(() => Sigin_In_Screnn());
        print("====3");
      }
    } catch (e) {
      print("ee == ${e}");
    }
  }

  facebookAuth() async {
    try {
      print("pre");
      final _pref = await SharedPreferences.getInstance();
      final LoginResult result = await FacebookAuth.instance.login();
      print("1");

      if (result.status == LoginStatus.success) {
        print("2");
        final credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final data = await FacebookAuth.instance
            .getUserData(fields: "name,email,picture.width(200)");

        Get.dialog(
            Material(
              // color: Colors.transparent,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            barrierDismissible: false);

        final user = await auth.signInWithCredential(credential);
        print("3");

        Get.back();

        if (user.user != null) {
          print("4");

          userdata.value = AuthUserData(
              name: data["name"],
              email: data["email"],
              photoURL: data["picture"]["data"]["url"]);
          print("5");

          providerId.value = auth.currentUser!.providerData.first.providerId;
          _pref.setString("providerId", providerId.value);
          _pref.setString("name", data["name"]);
          _pref.setString("email", data["email"]);
          _pref.setString("photoURL", data["picture"]["data"]["url"]);

          Get.off(() => Sigin_In_Screnn());
        }
      }
    } catch (e) {
      print("ee == ${e}");
    }
  }

  signout() async {
    if (providerId.value == "facebook.com") {
      await auth.signOut();
      await FacebookAuth.i.logOut();
    } else {
      await auth.signOut();
      await GoogleSignIn().signOut();
    }

    Get.off(() => G_F_Screen());
  }
}

class AuthUserData {
  final String? name;
  final String? email;
  final String? photoURL;

  AuthUserData({this.name, this.email, this.photoURL});
}

// Get.dialog(
//     Material(
//       color: Colors.transparent,
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     ),
//     barrierDismissible: false);
