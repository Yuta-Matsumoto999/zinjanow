import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/auth/user_notifier.dart';
import 'package:zinjanow_app/ui/view/components/header.dart';

class Layout extends ConsumerStatefulWidget {
  final Widget child;

  const Layout({
    Key? key,
    required this.child
  });

  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends ConsumerState<Layout> {
  @override


  @override
  Widget build(BuildContext context) {
    ref.watch(userNotifierProvider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const Header(),
      body: Container(
        height: size.height * 100,
        decoration: const BoxDecoration(
          color: Color(CustomColor.mainBackground)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: widget.child,
        ),
      )
    );
  }
}