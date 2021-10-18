import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _appearButton(
    BuildContext context, String text, Size phoneSize, double fontSize) {
  return Container(
    width: phoneSize.width * 0.45,
    height: (MediaQuery.of(context).orientation == Orientation.landscape)
        ? phoneSize.height * 0.1
        : phoneSize.height * 0.07,
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
          color: const Color(0xFFf2f2f2)),
    ),
  );
}

Widget _filterIcon(String link, double orientationWidth) {
  return Container(
    width: orientationWidth / 8,
    height: orientationWidth / 8,
    margin: const EdgeInsets.only(top: 15.0, left: 5, right: 5),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        image: DecorationImage(image: AssetImage(link), fit: BoxFit.cover)),
  );
}

Widget _filterSection(
    BuildContext context, phoneSize, fontSize, orientationWidth) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _appearButton(context, "COMPARE", phoneSize, fontSize),
        Row(
          children: [
            _filterIcon("assets/images/img_9.png", orientationWidth),
            _filterIcon("assets/images/img_10.png", orientationWidth),
          ],
        )
      ],
    ),
  );
}

class FilterSection extends StatelessWidget {
  const FilterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    var orientationWidth =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? phoneSize.height
            : phoneSize.width;
    double fontSize =
        (MediaQuery.of(context).orientation == Orientation.landscape) ? 15 : 17;
    return _filterSection(context, phoneSize, fontSize, orientationWidth);
  }
}
