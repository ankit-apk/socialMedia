import 'package:flutter_share/flutter_share.dart';

class ShareController {
  Future<void> share(String college, String society) async {
    await FlutterShare.share(title: college, text: society);
  }
}
