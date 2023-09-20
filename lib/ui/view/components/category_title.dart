import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String titleText;
  const CategoryTitle({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Text(titleText, style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20
        )
      )
    );
  }
}