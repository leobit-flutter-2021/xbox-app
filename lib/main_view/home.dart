import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_2_try/navigation/app_bar_navigation.dart';
import 'package:lab_2_try/navigation/bottom_navigation.dart';

import 'element/circle_img_text.dart';
import 'element/picture_with_description.dart';
import 'element/small_picture.dart';

Widget _textContainer(
    BuildContext context, String mainText, String secondText) {
  return Container(
    margin: const EdgeInsets.all(12.0),
    child: Row(
      children: [
        Text(
          mainText,
          style: const TextStyle(fontSize: 23, color: Color(0xFFf2f2f2)),
        ),
        Text(
          secondText,
          style: const TextStyle(fontSize: 12, color: Color(0xFFf2f2f2)),
        )
      ],
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black, title: const AppBarNavigation()),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              const PictureWithDescription(),
              _textContainer(context, "Official posts from games", ""),
              const CircleImgWithText(),
              _textContainer(context, "Jump back in", ""),
              const SmallPicture(),
              _textContainer(context, "Recommended from Game Pass", ""),
              const SmallPicture(),
              _textContainer(context, "Popular on Xbox", ""),
              const SmallPicture(),
            ],
          ),
        ),
      ),
      backgroundColor: CupertinoColors.darkBackgroundGray,
      bottomNavigationBar: const BottomAppBarNavigation(),
    );
  }
}
