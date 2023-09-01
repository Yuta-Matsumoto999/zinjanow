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
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          Text(titleText, style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
          ),
        ]
      )
    );
  }
}