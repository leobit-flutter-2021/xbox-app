import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:lab_2_try/social_view/element/utils.dart';

import '../../object/friends_obj.dart';

class OnlineFriends extends StatelessWidget {
  const OnlineFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Container(
        width: phoneSize.width,
        margin: const EdgeInsets.only(left: 10, top: 5),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                StyledText("Online", 25.0, Color(0xFFFFFFFF), FontWeight.w400),
                StyledText("No friends online", 20.0, Color(0x99FFFFFF),
                    FontWeight.w300),
                SizedBox(height: 30),
                StyledText("Suggested friends", 25.0, Color(0xFFFFFFFF),
                    FontWeight.w400),
                SizedBox(height: 5),
                SuggestionFriends(),
                SizedBox(height: 5),
                StyledText("Offline", 25.0, Color(0xFFFFFFFF), FontWeight.w400),
                SizedBox(height: 30)
              ],
            )));
  }
}

class OfflineFriends extends StatelessWidget {
  const OfflineFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: friends
            .map((friend) => _friendCard(
                context, friend.nickname, friend.imgLink, friend.onlineStatus))
            .toList(),
      ),
    );
  }

  Widget _friendCard(BuildContext context, String nickname, String imgLink,
      bool onlineStatus) {
    EdgeInsets orientationPadding =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? const EdgeInsets.only(left: 50, bottom: 10)
            : const EdgeInsets.only(left: 30, bottom: 10);
    double orientationDistanceForNickName =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? 400
            : 180;
    return Container(
      padding: orientationPadding,
      child: Row(
        children: [
          _friendAvatar(context, imgLink),
          Expanded(
              child: Column(
            children: [
              StyledText(
                  nickname, 20.0, const Color(0xFFFFFFFF), FontWeight.w400),
              StyledText(onlineStatus ? "Online" : "Offline", 20.0,
                  const Color(0xFF9E9E9E), FontWeight.w300)
            ],
          )),
          SizedBox(width: orientationDistanceForNickName)
        ],
      ),
    );
  }

  Widget _friendAvatar(BuildContext context, String imgLink) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: const Color(0xFF311B92),
      child: CircleAvatar(radius: 33, backgroundImage: AssetImage(imgLink)),
    );
  }
}

class SuggestionFriends extends StatelessWidget {
  const SuggestionFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    double orientationWidth =
        (MediaQuery.of(context).orientation == Orientation.landscape) ? 1 : 1;
    double orientationHeight =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? 0.7
            : 0.4;
    EdgeInsets orientationPadding =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? const EdgeInsets.symmetric(horizontal: 35, vertical: 20)
            : const EdgeInsets.symmetric(horizontal: 15, vertical: 20);
    return Container(
        margin: orientationPadding,
        padding: orientationPadding,
        width: phoneSize.width * orientationWidth * 0.95,
        height: phoneSize.height * orientationHeight * 0.3,
        color: const Color(0xFF212121),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            StackedImages(),
            Flexible(
                child: StyledText("Find more friends from your social networks",
                    18.0, Color(0xFFFFFFFF), FontWeight.w500)),
            Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ));
  }
}

class StackedImages extends StatelessWidget {
  const StackedImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://key0.cc/images/preview/1105_088e200f810b43f885cfd4b682eed32a.png",
      "https://mpng.subpng.com/20180802/rjx/kisspng-steam-link-computer-icons-logo-portable-network-gr-alle-mods-oder-assets-deaktivieren-deinstalliere-5b63a445a99d54.0847016515332567736948.jpg"
    ];
    return ImageStack(
      imageList: images,
      totalCount: images.length,
      imageRadius: 45,
      imageCount: 2,
    );
  }
}
