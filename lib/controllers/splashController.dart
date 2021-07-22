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
    uid = GetStorage().read('login');
    print(uid);
  }

  var uid;
  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, home);
  }

  home() {
    Get.offAll(
        () => uid == true && uid != null ? BottomNavBarPage() : LoginScreen());
  }
}
