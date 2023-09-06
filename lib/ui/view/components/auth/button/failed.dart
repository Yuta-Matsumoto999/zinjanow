import 'package:flutter/material.dart';

class Failed extends StatelessWidget {
  final String title;
  final int textColor;
  const Failed({
    Key? key,
    required this.title,
    required this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(
        color: Color(textColor),
        fontSize: 16,
        fontWeight: FontWeight.w600
      ),
    );
  }
}