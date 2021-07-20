import 'package:flutter/material.dart';
import 'package:socialmedia/utils/loginPage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            LoginScreen().logout();
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
