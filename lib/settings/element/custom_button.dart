import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _buttonReference(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: const BoxDecoration(
      color: CupertinoColors.secondaryLabel,
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFFf2f2f2))),
        const Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFFf2f2f2))
      ],
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buttonReference(text);
  }
}
