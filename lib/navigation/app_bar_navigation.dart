import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _iconAppBar(BuildContext context, String icon, double width) {
  double orientationWidth =
      (MediaQuery.of(context).orientation == Orientation.landscape) ? 0.4 : 1;
  return Container(
    margin: const EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    height: width * 0.125 * orientationWidth,
    width: width * 0.125 * orientationWidth,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        image: DecorationImage(image: AssetImage(icon), fit: BoxFit.cover)),
  );
}

class AppBarNavigation extends StatelessWidget {
  const AppBarNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size;
    return SizedBox(
        height: heightDevice.height * 0.075,
        width: heightDevice.width,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _iconAppBar(
                  context, "assets/images/img_2.png", heightDevice.width),
              Row(
                children: [
                  _iconAppBar(
                      context, "assets/images/img_3.png", heightDevice.width),
                  _iconAppBar(
                      context, "assets/images/img_4.png", heightDevice.width)
                ],
              )
            ]));
  }
}
