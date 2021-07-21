import 'package:flutter/material.dart';
import 'package:socialmedia/controllers/postsController.dart';
import 'package:socialmedia/models/eventDetail.dart';
import 'package:socialmedia/models/feedCard.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final PostsController _controller =
      Get.put(PostsController()); //GetX Controller initializer
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => ListView.builder(
          itemCount: _controller.postList.length,
          itemBuilder: (context, index) {
            var data = _controller.postList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => EventDetailPage(
                      college: data['clg'],
                      imglink: data['img'],
                      likes: data['likes'],
                      society: data['soc'],
                      content: data['con'],
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: NewWidget(
                    mediaQuery: mediaQuery,
                    college: data['clg'],
                    imglink: data['img'],
                    likes: data['likes'],
                    society: data['soc'],
                    content: data['con'],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
