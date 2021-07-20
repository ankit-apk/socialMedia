import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socialmedia/controllers/postsController.dart';
import 'package:socialmedia/models/eventDetail.dart';
import 'package:socialmedia/models/feedCard.dart';
import 'package:socialmedia/utils/colorsUi.dart';

class SearchPage extends StatelessWidget {
  final PostsController _controller = Get.put(PostsController());
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 18, right: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: UIColors().kCardColor,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(FontAwesomeIcons.search),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (query) {
                        _controller.searchPosts(query);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Society or College',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controller.searchedPosts.length,
                itemBuilder: (context, index) {
                  var data = _controller.searchedPosts[index];
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
                      child: NewWidget(
                        mediaQuery: mediaQuery,
                        college: data['clg'],
                        imglink: data['img'],
                        likes: data['likes'],
                        society: data['soc'],
                        content: data['con'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
