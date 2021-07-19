import 'package:flutter/material.dart';
import 'package:socialmedia/models/feedCard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: NewWidget(mediaQuery: mediaQuery),
      ),
    );
  }
}

