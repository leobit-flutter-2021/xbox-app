import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_2_try/object/games_obj.dart';

Widget _achieveNumber(String text) {
  return Text(text,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFFf2f2f2)));
}

Widget _achieveBlock(BuildContext context, String score, String winnerCup,
    String percentAchieve) {
  return SizedBox(
    width: (MediaQuery.of(context).orientation == Orientation.landscape)
        ? MediaQuery.of(context).size.width * 0.65
        : MediaQuery.of(context).size.width * 0.55,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.score_outlined, color: Color(0xFFf2f2f2)),
            _achieveNumber(score)
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.local_bar_outlined,
              color: Color(0xFFf2f2f2),
            ),
            _achieveNumber(winnerCup)
          ],
        ),
        _achieveNumber(percentAchieve),
      ],
    ),
  );
}

Widget _gameItemInfo(BuildContext context, String title, String icon,
    String score, String winnerCup, String percentAchieve) {
  var phoneSize = MediaQuery.of(context).size;

  double orientationWidth =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 0.7 : 1;
  double orientationHeight =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 2.1 : 1;

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      children: [
        Container(
          width: phoneSize.width * 0.3 * orientationWidth,
          height: phoneSize.height * 0.16 * orientationHeight,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              image:
                  DecorationImage(image: AssetImage(icon), fit: BoxFit.cover)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.12 * orientationHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? phoneSize.width * 0.65
                    : phoneSize.width * 0.55,
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFf2f2f2)),
                ),
              ),
              _achieveBlock(context, score, winnerCup, percentAchieve),
              Container(
                width: (MediaQuery.of(context).orientation ==
                        Orientation.landscape)
                    ? phoneSize.width * 0.65
                    : MediaQuery.of(context).size.width * 0.55,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 5.0,
                      color: Colors.white24,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

class GameAchieveSection extends StatelessWidget {
  const GameAchieveSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: games
          .map((game) => _gameItemInfo(context, game.title, game.icon,
              game.score, game.winnerCup, game.percentAchieve))
          .toList(),
    );
  }
}
