import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:socialmedia/controllers/profileController.dart';
import 'package:socialmedia/models/profileCards.dart';
import 'package:socialmedia/utils/loginPage.dart';
import 'package:socialmedia/utils/userDetails.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());
  final String url = 'https://i.imgur.com/gidLEsw.png';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 30,
                end: 30,
                top: MediaQuery.of(context).size.height / 5.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GlassContainer.clearGlass(
                    borderWidth: 0,
                    height: MediaQuery.of(context).size.height / 1.4,
                    width: MediaQuery.of(context).size.width / 1.1,
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                top: MediaQuery.of(context).size.height / 12.8,
                start: 30,
                end: 30,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 55,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: _profileController.picFromGoogle.isEmpty
                          ? url
                          : _profileController.picFromGoogle[0]['img'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                top: MediaQuery.of(context).size.height * 0.04,
                start: 10,
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                top: MediaQuery.of(context).size.height / 3.8,
                width: MediaQuery.of(context).size.width,
                // start: 30,
                // end: 30,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        _profileController.detailsFromGoogle.isEmpty
                            ? 'Unknown'
                            : _profileController.detailsFromGoogle[0]['name'],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        GetStorage().read('email') == null
                            ? 'N/A'
                            : GetStorage().read('email'),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => UserDetailsPage());
                            },
                            child: ProfileContainers(
                              name: 'Edit Profile',
                              iconData: FontAwesomeIcons.edit,
                            ),
                          ),
                          ProfileContainers(
                            name: 'A Feature',
                            iconData: FontAwesomeIcons.link,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileContainers(
                            name: 'About Us',
                            iconData: FontAwesomeIcons.info,
                          ),
                          GestureDetector(
                            onTap: () {
                              LoginScreen().logout();
                            },
                            child: ProfileContainers(
                              name: 'Logout',
                              iconData: FontAwesomeIcons.signOutAlt,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
