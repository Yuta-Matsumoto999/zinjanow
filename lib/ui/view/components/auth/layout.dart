import 'package:flutter/material.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height * 100,
        decoration: const BoxDecoration(
          color: Color(CustomColor.mainBackground)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 50),
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      ),
    );
  }
}