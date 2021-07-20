import 'dart:async';

import 'package:get/get.dart';
import 'package:socialmedia/utils/bottomBar.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, home);
  }

  home() {
    Get.offAll(()=>BottomNavBarPage());
  }
}
