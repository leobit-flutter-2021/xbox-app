import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_2_try/navigation/app_bar_navigation.dart';
import 'package:lab_2_try/navigation/bottom_navigation.dart';

import 'element/circle_img_text.dart';
import 'element/picture_with_description.dart';
import 'element/row_with_status.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _lowerGraphics = false;
  bool _effects = false;

  Widget _settingsContainer(bool graphics, bool) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text("Effects",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              IconButton(
                  icon: (_effects
                      ? const Icon(Icons.check_box)
                      : const Icon(Icons.check_box_outline_blank)),
                  onPressed: _toggleEffects,
                  color: Colors.white),
            ],
          ),
          Row(
            children: [
              const Text("Disable distance rendering",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              IconButton(
                  icon: (_lowerGraphics
                      ? const Icon(Icons.check_box)
                      : const Icon(Icons.check_box_outline_blank)),
                  onPressed: _toggleGraphics,
                  color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleEffects() {
    setState(() {
      if (_effects) {
        _effects = false;
      } else {
        _effects = true;
      }
    });
  }

  void _toggleGraphics() {
    setState(() {
      if (_lowerGraphics) {
        _lowerGraphics = false;
      } else {
        _lowerGraphics = true;
      }
    });
  }

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
              rowWithDescription(),
              _textContainer(context, "Official posts from games", ""),
              const CircleImgWithText(),
              _textContainer(context, "Game settings", ""),
              _settingsContainer(_lowerGraphics, "text"),
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

typedef OnStatusChanged = Function(bool status);
