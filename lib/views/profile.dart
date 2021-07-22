import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:socialmedia/models/profileCards.dart';
import 'package:socialmedia/utils/loginPage.dart';

class ProfilePage extends StatelessWidget {
  final String url =
      'https://lh3.googleusercontent.com/bYxtECnHzo9SVt5CMdIkfuBm7kteSWXlcIMbQvDQoYS_y-BEiZxSwUXUeNqt3v2hTeV410cAemPkSrOz5CXXv0-VJn03ZSRhOcu0eizU0TDpt8zHH0MNMKFxCOvjBdi8FahIhk5fh72kKX_IZRHCUzfEHeJMnLfMTcHFA7ziAq7yvwg2DnlCYJiY6ozT6zbwnJOSFsmB_sseE9i2VpTe9CDHkFY6VxuA9VhwgAqMiwx4vXwHJwgxUYaLCgU2PEPEpjvtoqRmWS1OFmJ8d8BAda3wzDNo6-QmcDWodJMlm2jW8iGPEUPkZfmYiNx6OKnPZN8y6ZaGD__hExU87Pd-PjTZdaEx_1JpPwgcXhPlEL9n6uqX2zAfUcDBk_0LpUpyKb19f6RBIpmqHte6cBs14osfvwveR9W4wgmvgdK-DMa0fy83VGJe2niqGDDp3cxPXThVHAa97jDHJpkc6kuzrkDmdAw3Se1kkg5lsgrml08OvWxivK38t9TCpH5u2cPAsxu_ztr1psJIY2mJ1emNERJFpR8-TAS0nRu9sa1UC4JwgMbilD7UbrwFzX16--VLx8Fz6O6xawgQE8-2WMo7BQvWtBpn6UHthNl2XbUNDhrSUrT9CblAjLYbu7IuBpr5RUAHWsUJnUxXHqN_dGon_NR2d6wCSolk7a7fvi3Kfyx4T7Iu1S5J2KQx5ZBQlxsnD_qNsCrHH8Ehx21OxDvAXZ9W=s902-no?authuser=0';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                    imageUrl: url,
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
                      'Ankit Srivastava',
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
                        ProfileContainers(
                          name: 'Edit Profile',
                          iconData: FontAwesomeIcons.edit,
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
    );
  }
}
