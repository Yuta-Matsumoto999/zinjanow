import 'package:flutter/material.dart';

class Idel extends StatelessWidget {
  final String title;
  final int textColor;
  final Widget? icon;
  const Idel({
    Key? key,
    required this.title,
    required this.textColor,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon != null ? icon! : SizedBox(),
        Text(title, style: TextStyle(
            color: Color(textColor),
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }
}