import 'package:flutter/material.dart';

class HeaderBackground extends StatelessWidget {
  final Widget child;
  const HeaderBackground({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/20180716101741.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: child,
    );
  }
}
