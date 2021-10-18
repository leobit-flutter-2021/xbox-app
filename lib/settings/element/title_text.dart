import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _titleText(String text) {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 35, bottom: 20),
    alignment: Alignment.centerLeft,
    child: Text(text,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: Color(0xFFf2f2f2))),
  );
}

class TitleText extends StatelessWidget {
  final String text;

  const TitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _titleText(text);
  }
}
