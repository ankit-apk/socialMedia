import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socialmedia/utils/bottomBar.dart';

class LoginScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> _recoverPassword(String name) async {
    try {
      await _auth.sendPasswordResetEmail(email: name);
      return null;
    } on FirebaseAuthException catch (e) {
      return '${e.message}';
    }
  }

  Future<String?> authUser(LoginData data) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: data.name, password: data.password);

      await _auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      return null;
    } on FirebaseAuthException catch (e) {
      return '${e.message}';
    }
  }

  Future<String?> logUser(LoginData data) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      return null;
    } on FirebaseAuthException catch (e) {
      return '${e.message}';
    }
  }

  Future<void> logout() async {
    await GetStorage().write('uid', '');
    await _auth.signOut();

    Get.offAll(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'DU Events',
      theme: LoginTheme(
          primaryColor: Color(0xffa6a0c9), switchAuthTextColor: Colors.black),
      // logo: 'assets/images/ecorp-lightblue.png',
      onLogin: logUser,
      onSignup: authUser,
      onSubmitAnimationCompleted: () {
        var user = _auth.currentUser!.uid;
        GetStorage().write('uid', user.toString());
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomNavBarPage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
