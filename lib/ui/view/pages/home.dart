import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/view/components/categoryTitle.dart';
import 'package:zinjanow_app/ui/view/components/header.dart';
import 'package:zinjanow_app/ui/view/components/home/userName.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          children: [
            UserName(),
            CategoryTitle(titleText: "current shrines"),
            CategoryTitle(titleText: "checked in"),
            CategoryTitle(titleText: "favorite")
          ]
        ) 
      )
    );
  }
}
