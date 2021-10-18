import 'package:flutter/material.dart';
import 'package:lab_2_try/navigation/bottom_navigation.dart';

import 'element/friends_list.dart';
import 'element/social_header.dart';

class Social extends StatelessWidget {
  const Social({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double orientationHeight =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? 0.35
            : 0.2;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const SocialHeader(),
          toolbarHeight:
              MediaQuery.of(context).size.height * orientationHeight),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: const [OnlineFriends(), OfflineFriends()],
        ),
      )),
      bottomNavigationBar: const BottomAppBarNavigation(),
    );
  }
}
