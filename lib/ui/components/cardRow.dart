import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  final Widget child;
  const CardRow({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          child
        ]
      ),
    );
  }
}