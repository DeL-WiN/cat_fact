import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninController with ChangeNotifier {

  var _googleSingIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  login() async{
    this.googleSignInAccount = await _googleSingIn.signIn();

    notifyListeners();
  }

  logout() async {
    this.googleSignInAccount = await _googleSingIn.signOut();

    notifyListeners();
  }
}