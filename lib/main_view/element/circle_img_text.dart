import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_2_try/object/games_obj.dart';


Widget _imageContainerSecond(BuildContext context, String link, String gameName,
    String gameShortDescription) {
  var phoneSize = MediaQuery.of(context).size;
  double orientationWidth =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 0.8 : 1;
  return Container(
    margin:
        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
    child: Column(children: [
      Container(
        width: phoneSize.width * orientationWidth * 0.83 * 1.2 / 5,
        height: phoneSize.width * orientationWidth * 0.83 * 1.2 / 5,
        margin: const EdgeInsets.only(
            left: 28.0, right: 28.0, top: 2.0, bottom: 10.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.indigo,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            image: DecorationImage(image: AssetImage(link), fit: BoxFit.cover)),
      ),
      Row(children: [
        Container(
          width: (MediaQuery.of(context).orientation == Orientation.landscape)
              ? phoneSize.width * 0.12
              : phoneSize.width * 0.2,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                gameName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18, color: Color(0xFFf2f2f2)),
              )),
        ),
        const Icon(
          Icons.verified,
          size: 18,
          color: Color(0xFFf2f2f2),
        )
      ]),
    ]),
  );
}

Widget _horizontalListCircle(BuildContext context) {
  return Row(children: [
    Expanded(
      flex: 1,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: games
                  .map((game) => _imageContainerSecond(
                      context, game.icon, game.title, game.description))
                  .toList())),
    ),
  ]);
}

class CircleImgWithText extends StatelessWidget {
  const CircleImgWithText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _horizontalListCircle(context);
  }
}
