import 'package:flutter/material.dart';

class HeaderBachground extends StatelessWidget {
  final Widget child;
  const HeaderBachground({
    Key? key,
    required this.child
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/2e0edfb869c8a41e3287465d5685a3c8_3.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: child,
    );
  }
}