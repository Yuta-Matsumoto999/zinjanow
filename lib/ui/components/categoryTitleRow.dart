import 'package:flutter/material.dart';

class CategoryTitleRow extends StatelessWidget {
  final String titleText;
  final String rowText;  
  const CategoryTitleRow({
    Key? key,
    required this.titleText,
    required this.rowText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleText, style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18
            ),
          ),
          Row(
            children: [
              Container(
                child: Icon(Icons.plus_one_rounded)
              )
            ],
          )
        ],
      )
    );
  }
}