import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _textBlock(phoneSize) {
  return Container(
      width: phoneSize.width * 0.9,
      height: phoneSize.height * 0.07,
      decoration: const BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 35),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Your ranking this month",
              style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ));
}

Decoration _customBoxDecoration(begin, end) {
  return BoxDecoration(
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5)),
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: const [
          Color(0xFF057F0B),
          Color(0xFF3A4BE5),
          Color(-143702572),
        ],
      ));
}

Widget _gradientBlock(phoneSize) {
  return Row(
    children: [
      Container(
        width: phoneSize.width * 0.449,
        height: phoneSize.height * 0.1,
        decoration:
            _customBoxDecoration(Alignment.topLeft, Alignment.bottomRight),
        child: Align(
          alignment: Alignment.center,
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(text: "#2 / 2", style: TextStyle(fontSize: 28)),
              ],
            ),
          ),
        ),
      ),
      Container(
        height: phoneSize.height * 0.1,
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 0.5,
              color: Color(0xFFf2f2f2),
            ),
          ),
        ),
      ),
      Container(
        width: phoneSize.width * 0.449,
        height: phoneSize.height * 0.1,
        decoration:
            _customBoxDecoration(Alignment.bottomRight, Alignment.topLeft),
        child: Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: "+", style: TextStyle(fontSize: 28)),
                WidgetSpan(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: const Icon(
                      Icons.score_outlined,
                      size: 28,
                      color: Color(0xFFf2f2f2),
                    ),
                  ),
                ),
                const TextSpan(text: "0", style: TextStyle(fontSize: 28)),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

class RankSection extends StatelessWidget {
  const RankSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: phoneSize.width * 0.905,
      child: Column(
        children: [_textBlock(phoneSize), _gradientBlock(phoneSize)],
      ),
    );
  }
}
