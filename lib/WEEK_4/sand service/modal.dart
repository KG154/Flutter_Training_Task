import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthApi{
  static final _googlesignin =
  GoogleSignIn(scopes: ['https://mail.google.com/']);

  static Future<GoogleSignInAccount?> signIn() async {
    if (await _googlesignin.isSignedIn()) {
      return _googlesignin.currentUser;
    } else {
      return await _googlesignin.signIn();
    }
  }

  static Future signout() => _googlesignin.signOut();

}