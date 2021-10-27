import 'package:flutter/material.dart';
import 'package:lab_2_try/social_view/element/utils.dart';

class SocialHeader extends StatelessWidget {
  const SocialHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    double orientationHeight =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? 0.40
            : 0.23;
    EdgeInsets orientationPadding =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 40)
            : const EdgeInsets.symmetric(vertical: 20, horizontal: 10);
    double orientationIconSize =
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? 0.25
            : 0.3;
    return Container(
      padding: orientationPadding,
      height: deviceSize.height * orientationHeight,
      width: deviceSize.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const StyledText(
                  "Social", 35.0, Color(0xFFFFFFFF), FontWeight.w500),
              Container(
                  width: deviceSize.width * orientationIconSize,
                  margin: const EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CircleIcon("assets/images/img_voice_chat_btn.png"),
                      CircleIcon("assets/images/img_note_btn.png")
                    ],
                  ))
            ],
          ),
          Container(
            width: deviceSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                UnderLineText("FRIENDS", 17.0, true, FontWeight.w600),
                UnderLineText("CHATS", 17.0, false, FontWeight.w400),
              ],
            ),
          )
        ],
      ),
    );
  }
}
