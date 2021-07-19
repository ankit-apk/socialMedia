import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:socialmedia/views/home.dart';
import 'package:socialmedia/views/profile.dart';
import 'package:socialmedia/views/search.dart';

import 'colorsUi.dart';

class BottomNavBarPage extends StatelessWidget {
  final RxInt index = 0.obs;
  final List pages = [HomePage(), SearchPage(), ProfilePage()].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors().kBgColor,
      appBar: AppBar(
        title: Text('DU Events'),
        backgroundColor: UIColors().kAppBarColor,
      ),
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          currentIndex: index.value,
          onTap: (i) => index.value = i,
          selectedItemColor: UIColors().kAppBarColor,
          items: [
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.home),
              title: Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.search),
              title: Text('Search'),
            ),
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.user),
              title: Text('Profile'),
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
