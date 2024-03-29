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

  Future<String?> authUser(SignupData data) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: data.name ?? "", password: data.password ?? "");

      await _auth.signInWithEmailAndPassword(
          email: data.name ?? "", password: data.password ?? "");
      GetStorage().write('uid', _auth.currentUser!.uid);
      return null;
    } on FirebaseAuthException catch (e) {
      return '${e.message}';
    }
  }

  Future<String?> logUser(LoginData data) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      GetStorage().write('uid', _auth.currentUser!.uid);
      return null;
    } on FirebaseAuthException catch (e) {
      return '${e.message}';
    }
  }

  Future<void> logout() async {
    await GetStorage().write('login', false);
    await _auth.signOut();

    Get.offAll(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'DU Events',
      theme: LoginTheme(
        primaryColor: Color(0xff182029),
        switchAuthTextColor: Colors.black,
        buttonTheme: LoginButtonTheme(
            splashColor: Colors.black,
            highlightColor: Colors.black,
            backgroundColor: Colors.black),
      ),
      onLogin: logUser,
      onSignup: authUser,
      onSubmitAnimationCompleted: () {
        GetStorage().write('login', true);
        GetStorage().write('email', _auth.currentUser!.email);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomNavBarPage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
