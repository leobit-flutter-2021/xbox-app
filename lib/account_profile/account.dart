import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:lab_2_try/account_profile/element/filter_section.dart';
import 'package:lab_2_try/account_profile/element/first_img_section.dart';
import 'package:lab_2_try/account_profile/element/game_achieve_list.dart';
import 'package:lab_2_try/account_profile/element/rank_section.dart';
import 'package:lab_2_try/navigation/bottom_navigation.dart';
import 'package:lab_2_try/settings/settings_view.dart';

Widget _iconAppBar(BuildContext context, String icon, double width) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      height: width * 0.125,
      width: width * 0.125,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          image: DecorationImage(image: AssetImage(icon), fit: BoxFit.cover)),
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Settings()),
      );
    },
  );
}

Widget _totalScore() {
  return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
           const Icon(
            Icons.score_outlined,
            size: 28,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: const Text(
              "500",
              style: TextStyle(fontSize: 18, color: Color(0xFFf2f2f2)),
            ),
          ),
        ],
      ));
}

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    var orientationWidth =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? phoneSize.height
            : phoneSize.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight:
            (MediaQuery.of(context).orientation == Orientation.landscape)
                ? phoneSize.width * 0.11
                : phoneSize.height * 0.11,
        backgroundColor: CupertinoColors.quaternaryLabel,
        title: Container(
          alignment: Alignment.centerRight,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: _iconAppBar(
                  context, "assets/images/img_settings_btn.png", orientationWidth)),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const FirstSectionWithUserInfo(),
              SizedBox(
                width: phoneSize.width * 0.9,
                child: Column(
                  children: [
                    _totalScore(),
                    const RankSection(),
                    const FilterSection(),
                    const GameAchieveSection()
                  ],
                ),
              )
            ],
          )),
      backgroundColor: CupertinoColors.darkBackgroundGray,
      bottomNavigationBar: const BottomAppBarNavigation(),
    );
  }
}
