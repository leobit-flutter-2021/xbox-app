import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab_2_try/navigation/bottom_navigation.dart';
import 'package:lab_2_try/settings/data/data_template.dart';
import 'package:lab_2_try/settings/element/custom_button.dart';
import 'package:lab_2_try/settings/element/sign_out_button.dart';
import 'package:lab_2_try/settings/element/title_text.dart';
import 'package:lab_2_try/settings/element/user_info_section.dart';

Widget _iconAppBar(BuildContext context) {
  return InkWell(
    child: Row(
      children: [
        Container(
            height: 55,
            width: 55,
            child: const Icon(Icons.arrow_back_ios_outlined),
            decoration: const BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.all(Radius.circular(1000)),
            )),
        Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                    margin: const EdgeInsets.only(right: 55),
                    child: const Text("Settings",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFf2f2f2))))))
      ],
    ),
    onTap: () {
      Navigator.pop(context);
    },
  );
}

Widget _sectionBuilder(String titleText, int start, int end) {
  return Column(
    children: [
      TitleText(text: titleText),
      Column(
        children: dataTemplates
            .sublist(start, end)
            .map((dataTemplate) => CustomButton(text: dataTemplate.title))
            .toList(),
      )
    ],
  );
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: CupertinoColors.darkBackgroundGray,
        title: Container(
            alignment: Alignment.centerLeft, child: _iconAppBar(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ShortUserInfo(),
            _sectionBuilder("Account", 0, 1),
            _sectionBuilder("App settings", 1, 4),
            _sectionBuilder("About", 4, 8),
            _sectionBuilder("Support & feedback", 8, 10),
            const SignOutButton()
          ],
        ),
      ),
      backgroundColor: CupertinoColors.darkBackgroundGray,
      bottomNavigationBar: const BottomAppBarNavigation(),
    );
  }
}
