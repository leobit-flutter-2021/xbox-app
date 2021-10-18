import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _signOutButton(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
    decoration: const BoxDecoration(
      color: CupertinoColors.secondaryLabel,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFf2f2f2))),
      ],
    ),
  );
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _signOutButton("SIGN OUT");
  }
}
