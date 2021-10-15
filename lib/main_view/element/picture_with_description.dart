import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_2_try/object/games_obj.dart';

Widget _imageContainerStart(BuildContext context, String link, String gameName,
    String gameShortDescription) {
  var phoneSize = MediaQuery.of(context).size;
  double orientationWidth =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 0.9 : 1;
  double orientationHeight =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 1.24 : 1;
  double marginDivider =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 2 : 1;

  return Container(
      width: phoneSize.width * 0.83 * orientationWidth,
      height: phoneSize.height * 0.45 * orientationHeight,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.5)),
          image: DecorationImage(image: AssetImage(link), fit: BoxFit.cover)),
      child: Container(
        margin: EdgeInsets.only(
            left: 12.0, right: 17.0, top: 140.0 / marginDivider),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  gameName,
                  style:
                      const TextStyle(fontSize: 42, color: Color(0xFFf2f2f2)),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  gameShortDescription,
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xFFf2f2f2)),
                )),
          ],
        ),
      ));
}

Widget _horizontalListMain(BuildContext context) {
  return Row(children: [
    Expanded(
      flex: 1,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: games
                  .map((game) => _imageContainerStart(
                      context, game.icon, game.title, game.description))
                  .toList())),
    )
  ]);
}

class PictureWithDescription extends StatelessWidget {
  const PictureWithDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _horizontalListMain(context);
  }
}
