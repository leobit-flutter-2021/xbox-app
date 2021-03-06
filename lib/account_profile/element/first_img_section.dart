import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _userIcon(double orientationWidth) {
  return Container(
    width: orientationWidth / 4,
    height: orientationWidth / 4,
    margin:
        const EdgeInsets.only(left: 50.0, right: 28.0, top: 2.0, bottom: 10.0),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.indigo,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        image: const DecorationImage(
            image: AssetImage("assets/images/img_fallout.png"), fit: BoxFit.cover)),
  );
}

Widget _userText(Size phoneSize) {
  return SizedBox(
    width: phoneSize.width * 0.4,
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "DenMaster26",
                style: TextStyle(fontSize: 21, color: Colors.white),
              )),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Xbox App",
              style: TextStyle(fontSize: 15, color:Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _appearButton(String text, Size phoneSize, double fontSize) {
  return Container(
    width: phoneSize.width * 0.9,
    height: phoneSize.height * 0.07,
    margin: const EdgeInsets.only(top: 20.0),
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      color: Colors.white30,
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color:Colors.white),
    ),
  );
}

Widget _underlineText(String text, double fontSize, bool addLine) {
  return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: (addLine) ? 5.0 : 0.0,
            color:
                (addLine) ? const Color(0xFFf2f2f2) : CupertinoColors.separator,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ));
}

Widget _scrollerWithOpacityPart(BuildContext context) {
  double fontSize =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 15 : 17;
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return LinearGradient(
        colors: [Colors.white, Colors.white.withOpacity(0.05)],
        stops: const [0.7, 1],
        tileMode: TileMode.mirror,
      ).createShader(bounds);
    },
    child: Row(
      children: [
        Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _underlineText("ACHIEVEMENTS", fontSize, true),
                    _underlineText("HIGHLIGHTS", fontSize, false),
                    _underlineText("ABOUT", fontSize, false),
                  ],
                ),
              ),
            ))
      ],
    ),
  );
}

class FirstSectionWithUserInfo extends StatelessWidget {
  const FirstSectionWithUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientationWidth =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.width;
    return Container(
      height: 380,
      decoration: BoxDecoration(
          border: Border.all(),
          image: const DecorationImage(
              image: AssetImage("assets/images/img_fallout.png"), fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 20),
              child: Column(
                children: [
                  Row(children: [
                    _userIcon(orientationWidth),
                    _userText(MediaQuery.of(context).size)
                  ]),
                  _appearButton(
                      "APPEAR ONLINE",
                      MediaQuery.of(context).size,
                      (MediaQuery.of(context).orientation ==
                              Orientation.landscape)
                          ? 15
                          : 17),
                ],
              ),
            ),
            _scrollerWithOpacityPart(context)
          ],
        ),
      ),
    );
  }
}
