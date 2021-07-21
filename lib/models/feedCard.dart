import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:socialmedia/controllers/shareController.dart';
import 'package:socialmedia/utils/colorsUi.dart';
import 'package:glass_kit/glass_kit.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.mediaQuery,
    required this.college,
    required this.imglink,
    required this.likes,
    required this.society,
    required this.content,
  }) : super(key: key);

  final Size mediaQuery;
  final String college;
  final String imglink;
  final int likes;
  final String society;
  final String content;

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      height: mediaQuery.height * 0.48,
      // color: Colors.black12,
      borderWidth: 0,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  // color: UIColors().kCardColor,
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
                  '$society \n$college',
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
                  imageUrl: imglink,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned.directional(
            start: 1 / 2,
            end: 1 / 2,
            bottom: 20,
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LikeButton(
                  likeCount: likes,
                ),
                SizedBox(
                  width: 45,
                ),
                GestureDetector(
                    onTap: () {
                      ShareController().share(college,
                          'Hey I found this event on Du Events.\n$content');
                    },
                    child: Icon(
                      FontAwesomeIcons.share,
                      color: Colors.green,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
