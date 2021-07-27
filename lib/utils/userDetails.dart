import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socialmedia/controllers/profileController.dart';

// ignore: must_be_immutable
class UserDetailsPage extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());
  String name = '';
  String college = '';
  String gender = '';
  String age = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff182029),
      body: Obx(
        () => SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height / 5,
                      child: GestureDetector(
                        onTap: () {
                          _profileController.getImage();
                        },
                        child: _profileController.picFromGoogle.isEmpty
                            ? CircleAvatar(
                                child: Icon(FontAwesomeIcons.user),
                                radius: 50,
                              )
                            : ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: _profileController.picFromGoogle[0]
                                      ['img'],
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white.withOpacity(0.9),
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: TextField(
                            onChanged: (input) {
                              name = input;
                            },
                            decoration: InputDecoration(
                                hintText: _profileController
                                            .detailsFromGoogle.isEmpty ||
                                        _profileController.detailsFromGoogle[0]
                                                ['name'] ==
                                            '' ||
                                        _profileController.detailsFromGoogle[0]
                                                ['name'] ==
                                            null
                                    ? 'Name'
                                    : _profileController.detailsFromGoogle[0]
                                        ['name'],
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.white.withOpacity(0.9),
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (input) {
                                  age = input;
                                },
                                decoration: InputDecoration(
                                    hintText: _profileController
                                                .detailsFromGoogle.isEmpty ||
                                            _profileController
                                                        .detailsFromGoogle[0]
                                                    ['age'] ==
                                                '' ||
                                            _profileController
                                                        .detailsFromGoogle[0]
                                                    ['age'] ==
                                                null
                                        ? 'Your Age'
                                        : _profileController
                                            .detailsFromGoogle[0]['age'],
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: Colors.white.withOpacity(0.9),
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2.4,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: TextField(
                                onChanged: (input) {
                                  gender = input;
                                },
                                decoration: InputDecoration(
                                    hintText: _profileController
                                                .detailsFromGoogle.isEmpty ||
                                            _profileController
                                                        .detailsFromGoogle[0]
                                                    ['gender'] ==
                                                '' ||
                                            _profileController
                                                        .detailsFromGoogle[0]
                                                    ['gender'] ==
                                                null
                                        ? 'Gender'
                                        : _profileController
                                            .detailsFromGoogle[0]['gender'],
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white.withOpacity(0.9),
                        height: 50,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: TextField(
                            onChanged: (input) {
                              college = input;
                            },
                            decoration: InputDecoration(
                                hintText: _profileController
                                            .detailsFromGoogle.isEmpty ||
                                        _profileController.detailsFromGoogle[0]
                                                ['college'] ==
                                            '' ||
                                        _profileController.detailsFromGoogle[0]
                                                ['college'] ==
                                            null
                                    ? 'Your College'
                                    : _profileController.detailsFromGoogle[0]
                                        ['college'],
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                        onTap: () {
                          _profileController.updateData(
                              name, age, gender, college);
                        },
                        child: Container(
                          color: Colors.white,
                          height: 50,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(FontAwesomeIcons.save),
                              Text(
                                'Save',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
