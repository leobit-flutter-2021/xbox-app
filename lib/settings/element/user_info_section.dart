import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _shortUserInfo(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: ((MediaQuery.of(context).orientation == Orientation.landscape)
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.height) *
        0.17,
    color: CupertinoColors.secondaryLabel,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: ((MediaQuery.of(context).orientation == Orientation.landscape)
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.width) *
              0.18,
          height: ((MediaQuery.of(context).orientation == Orientation.landscape)
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.width) *
              0.18,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              image: DecorationImage(
                  image: AssetImage("assets/images/img_5.png"),
                  fit: BoxFit.cover)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: ((MediaQuery.of(context).orientation == Orientation.landscape)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.height) *
              0.07,
          width: ((MediaQuery.of(context).orientation == Orientation.landscape)
                  ? 0.8
                  : 0.6) *
              MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text("Visiti iONKiD",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFf2f2f2)))),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text("visiti.ionkid.dev@gmail.com",
                      style: TextStyle(fontSize: 18, color: Color(0xFFf2f2f2))))
            ],
          ),
        )
      ],
    ),
  );
}

class ShortUserInfo extends StatelessWidget {
  const ShortUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _shortUserInfo(context);
  }
}
