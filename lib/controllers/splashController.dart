import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socialmedia/utils/bottomBar.dart';
import 'package:socialmedia/utils/loginPage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTime();
  }

  var uid = GetStorage().read('uid');
  startTime() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, home);
  }

  home() {
    Get.offAll(() => uid != '' ? BottomNavBarPage() : LoginScreen());
  }
}
