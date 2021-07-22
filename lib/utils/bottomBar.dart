import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socialmedia/views/home.dart';
import 'package:socialmedia/views/profile.dart';
import 'package:socialmedia/views/search.dart';
import 'colorsUi.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class BottomNavBarPage extends StatelessWidget {
  final RxInt index = 0.obs;
  final List pages = [HomePage(), SearchPage(), ProfilePage()].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff182029),
      extendBody: true,
      appBar: AppBar(
        title: Text('DU Events'),
        backgroundColor: UIColors().kAppBarColor,
      ),
      bottomNavigationBar: Obx(
        () => DotNavigationBar(
          backgroundColor: Color(0xff2f3b49),
          currentIndex: index.value,
          onTap: (i) => index.value = i,
          // selectedItemColor: UIColors().kAppBarColor,
          items: [
            DotNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              selectedColor: Color(0xfffffeff),
              unselectedColor: Color(0xfffffeff).withOpacity(0.8),
            ),
            DotNavigationBarItem(
              icon: Icon(FontAwesomeIcons.search),
              selectedColor: Color(0xfffffeff),
              unselectedColor: Color(0xfffffeff).withOpacity(0.8),
            ),
            DotNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              selectedColor: Color(0xfffffeff),
              unselectedColor: Color(0xfffffeff).withOpacity(0.8),
            ),
          ],
        ),
      ),
      body: Obx(
        () => pages[index.value],
      ),
    );
  }
}
