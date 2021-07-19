

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialmedia/utils/colorsUi.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);

  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQuery.height * 0.48,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: UIColors().kCardColor,
              ),
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            top: 7,
            start: 10,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: UIColors().kAppBarColor,
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  width: mediaQuery.width * 0.04,
                ),
                Text(
                  'Society Name \nCollege Name',
                  style: TextStyle(
                    color: UIColors().kFontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned.directional(
            top: 60,
            width: mediaQuery.width,
            textDirection: TextDirection.ltr,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://i.ytimg.com/vi/K2K7uXQtRtE/maxresdefault.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned.directional(
            bottom: 20,
            start: mediaQuery.width / 2.9,
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(FontAwesomeIcons.heart),
                SizedBox(
                  width: 45,
                ),
                Icon(FontAwesomeIcons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
