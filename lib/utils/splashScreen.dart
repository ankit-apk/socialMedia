import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmedia/controllers/splashController.dart';
import 'package:socialmedia/utils/colorsUi.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatelessWidget {
  // ignore: unused_field
  final SplashController _controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Color(0xff182029),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Lottie.asset(
                  'assets/lottie.json',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Positioned.directional(
            bottom: 70,
            start: MediaQuery.of(context).size.width / 3,
            textDirection: TextDirection.ltr,
            child: Text(
              'DU Events',
              style: TextStyle(
                  fontSize: 30,
                  color: UIColors().kCardColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
