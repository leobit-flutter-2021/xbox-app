import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_2_try/account_profile/element/game_achieve_list.dart';
import 'package:lab_2_try/object/games_obj.dart';

enum Operation { clean, asc, desc }

class FilterSection extends StatefulWidget {
  const FilterSection({Key? key}) : super(key: key);

  @override
  _FilterSectionState createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  List<GameContent> copyObj = [...games];

  Widget _appearButton(BuildContext context, String text, Size phoneSize,
      double fontSize, Operation sortType) {
    return InkWell(
      child: Container(
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
              color: Colors.white),
        ),
      ),
      onTap: () {
        _sortItem(sortType);
      },
    );
  }

  Widget _filterIcon(String link, double orientationWidth, Operation sortType) {
    return InkWell(
      child: Container(
        width: orientationWidth / 8,
        height: orientationWidth / 8,
        margin: const EdgeInsets.only(top: 15.0, left: 5, right: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            image: DecorationImage(image: AssetImage(link), fit: BoxFit.cover)),
      ),
      onTap: () {
        _sortItem(sortType);
      },
    );
  }

  Widget _filterSection(
      BuildContext context, phoneSize, fontSize, orientationWidth) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _appearButton(
                context, "Clear", phoneSize, fontSize, Operation.clean),
            Row(
              children: [
                _filterIcon("assets/images/img_filter_btn.png",
                    orientationWidth, Operation.asc),
                _filterIcon("assets/images/img_sort_btn.png", orientationWidth,
                    Operation.desc),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    var orientationWidth =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? phoneSize.height
            : phoneSize.width;
    double fontSize =
        (MediaQuery.of(context).orientation == Orientation.landscape) ? 15 : 17;
    return Column(
      children: [
        _filterSection(context, phoneSize, fontSize, orientationWidth),
        GameAchieveSection(obj: copyObj)
      ],
    );
  }

  void _sortItem(sortType) {
    setState(() {
      if (sortType == Operation.clean) {
        copyObj = [...games];
      } else if (sortType == Operation.asc) {
        copyObj = copyObj..sort((a, b) => a.title.compareTo(b.title));
      } else if (sortType == Operation.desc) {
        copyObj = copyObj..sort((a, b) => b.title.compareTo(a.title));
      }
    });
  }
}
