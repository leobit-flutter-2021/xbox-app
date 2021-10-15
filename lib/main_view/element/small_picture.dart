import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_2_try/object/games_obj.dart';

Widget _imageContainerThird(BuildContext context, String link) {
  var phoneSize = MediaQuery.of(context).size;

  double orientationWidth =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 0.7 : 1;
  double orientationHeight =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 2.1 : 1;
  return Container(
    width: phoneSize.width * 0.42 * orientationWidth,
    height: phoneSize.height * 0.23 * orientationHeight,
    margin: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.5)),
        image: DecorationImage(image: AssetImage(link), fit: BoxFit.cover)),
  );
}

Widget _horizontalListSmallSquare(BuildContext context) {
  return Row(children: [
    Expanded(
      flex: 1,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: games
                  .map((game) => _imageContainerThird(context, game.icon))
                  .toList())),
    )
  ]);
}

class SmallPicture extends StatelessWidget {
  const SmallPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _horizontalListSmallSquare(context);
  }
}
