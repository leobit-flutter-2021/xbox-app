import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnderLineText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool addLine;
  final FontWeight fontWeight;

  const UnderLineText(this.text, this.fontSize, this.addLine, this.fontWeight,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: (addLine) ? 5.0 : 0.0,
              color: (addLine)
                  ? const Color(0xFFf2f2f2)
                  : CupertinoColors.separator,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                (addLine) ? const Color(0xFFf2f2f2) : const Color(0xFFBDBDBD),
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ));
  }
}

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  const StyledText(this.text, this.fontSize, this.textColor, this.fontWeight,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, color: textColor, fontWeight: fontWeight),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CircleIcon extends StatelessWidget {
  final String imgLink;

  const CircleIcon(this.imgLink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    double orientationWidth =
        (MediaQuery.of(context).orientation == Orientation.landscape) ? 0.8 : 1;
    double orientationHeight =
        (MediaQuery.of(context).orientation == Orientation.landscape) ? 0.8 : 1;
    return Container(
      width: phoneSize.width * orientationWidth * 0.13,
      height: phoneSize.width * orientationHeight * 0.13,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          image:
              DecorationImage(image: AssetImage(imgLink), fit: BoxFit.cover)),
    );
  }
}
