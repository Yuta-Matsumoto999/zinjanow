import 'package:flutter/material.dart';

class Laoding extends StatelessWidget {
  final int textColor;
  final int backGroundColor;
  const Laoding({
    Key? key,
    required this.textColor,
    required this.backGroundColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: CircularProgressIndicator(
        color: Color(textColor),
        backgroundColor: Color(backGroundColor)
      ),
    );
  }
}