import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../blocs/provider/user_provider.dart';
import '../../../models/details/details.dart';

class LoginController with ChangeNotifier {
  UserP userP = UserP();
  var _googleSignin = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetalils? userDetalils;


  googleLogin() async {
    this.googleSignInAccount = await _googleSignin.signIn();

  final goog = this.userDetalils = new UserDetalils(
      displaiyName: this.googleSignInAccount!.displayName,
      email: this.googleSignInAccount!.email,
      photoUrl: this.googleSignInAccount!.photoUrl,
    );
    userP.user?.saveCash(goog);

    notifyListeners();
  }

  facebooklogin() async {
    var result = await FacebookAuth.i.login(
      permissions: ['public_profile', 'email'],
    );

    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: 'email, name, picture',
      );

    final fb = this.userDetalils = new UserDetalils(
        displaiyName: requestData['name'],
        email: requestData['email'],
        photoUrl: requestData['picture']['data']['url'] ?? '',
      );
      userP.user?.saveCash(fb);
      notifyListeners();
    }
  }


  logout() async {
    this.googleSignInAccount = await _googleSignin.signOut();
    await FacebookAuth.i.logOut();
    userDetalils = null;
    notifyListeners();
  }
}
