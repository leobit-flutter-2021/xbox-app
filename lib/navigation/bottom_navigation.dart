import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_2_try/main.dart';

Widget _iconBottom(
    BuildContext context, IconData icon, double height, Widget page) {
  return IconButton(
      icon: Icon(
        icon,
        size: height * 0.055,
        color: const Color(0xFFf2f2f2),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      });
}

class BottomAppBarNavigation extends StatelessWidget {
  const BottomAppBarNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size;
    return BottomAppBar(
      color: CupertinoColors.darkBackgroundGray,
      child: SizedBox(
          height: heightDevice.height * 0.075,
          width: heightDevice.width,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconBottom(context, Icons.home_filled, heightDevice.height,
                    const MyApp()),
                _iconBottom(context, Icons.people_sharp, heightDevice.height,
                    const  MyApp()),
                _iconBottom(context, Icons.search_sharp, heightDevice.height,
                    const  MyApp()),
                _iconBottom(context, Icons.storage_rounded, heightDevice.height,
                    const  MyApp()),
                _iconBottom(context, Icons.supervised_user_circle,
                    heightDevice.height, const  MyApp()),
              ])),
    );
  }
}
