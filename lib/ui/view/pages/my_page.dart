import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/view/components/mypage/mypage_menu_list.dart';
import 'package:zinjanow_app/ui/view/components/mypage/mypage_icon.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  static const menuItems = [
    {
      "title": "Edit profile",
      "icon": "images/1077063.png",
      "iconColor": 0xFFEA4C89,
      "iconBackgroundColor": 0xFFFBDBE7
    },
    {
      "title": "Follows",
      "icon": "images/879156.png",
      "iconColor": 0xFF4BEBAD,
      "iconBackgroundColor": 0xFFD9FAEE
    },
    {
      "title": "Find friends",
      "icon": "images/qrcodescan_120401.png",
      "iconColor": 0xFF6F6CF5,
      "iconBackgroundColor": 0xFFDFDEFD
    },
    {
      "title": "Settings",
      "icon": "images/126472.png",
      "iconColor": 0xFFF87211,
      "iconBackgroundColor": 0xFFFEE3CF
    },
    {
      "title": "Help",
      "icon": "images/545270-200.png",
      "iconColor": 0xFF1C1C1C,
      "iconBackgroundColor": 0xFFD1D1D1
    }
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          MypageIcon(),
          MypageMenuList(
            items: menuItems,
          )
        ]
      )
    );
  }
}