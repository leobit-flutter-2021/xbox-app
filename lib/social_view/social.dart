import 'package:flutter/material.dart';
import 'package:lab_2_try/navigation/bottom_navigation.dart';

import 'element/friends_list.dart';
import 'element/social_header.dart';
import 'element/utils.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  SocialState createState() => SocialState();
}

class SocialState extends State<Social> {
  bool showOfflineFriends = true;

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
          children: [
            myStatus(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const StyledText("Offline friends visibility ", 20.0, Color(0xFF9E9E9E), FontWeight.w300),
                IconButton(
                  icon: showOfflineFriends
                    ? const Icon(Icons.check_box)
                    :const Icon(Icons.check_box_outline_blank),
                  onPressed: changeOfflineFriendsVisibility,
                  color: Colors.white
                  ,
                )
              ],
            ),
            const OnlineFriends(),
            OfflineFriends(showOfflineFriends)
          ],
        ),
      )),
      bottomNavigationBar: const BottomAppBarNavigation(),
    );
  }

  void changeOfflineFriendsVisibility () {
    setState(() {
      if (showOfflineFriends) {
        showOfflineFriends = false;
      } else {
        showOfflineFriends = true;
      }
    });
  }
}





