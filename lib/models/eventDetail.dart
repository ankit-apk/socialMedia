import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({
    Key? key,
    required this.college,
    required this.imglink,
    required this.likes,
    required this.society,
    required this.content,
  }) : super(key: key);

  final String college;
  final String imglink;
  final int likes;
  final String society;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.2,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(),
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(26),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: CachedNetworkImage(
                                imageUrl: imglink,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        top: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$society,',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              college,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
