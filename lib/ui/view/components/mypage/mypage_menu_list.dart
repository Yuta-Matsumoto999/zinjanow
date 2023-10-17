import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/mypage/mypage_menu_item.dart';

class MypageMenuList extends StatelessWidget {
  const MypageMenuList({super.key});

  static const items = [
    {
      "title": "Edit Profile",
      "icon": "images/1077063.png",
      "iconColor": 0xFFEA4C89,
      "iconBackgroundColor": 0xFFFBDBE7
    },
    {
      "title": "My Stats",
      "icon": "images/4252963.png",
      "iconColor": 0xFF4BEBAD,
      "iconBackgroundColor": 0xFFD9FAEE
    },
    {
      "title": "Find Friends",
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
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.32),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(CustomColor.mainBackground),
        borderRadius: BorderRadius.circular(20)
      ),
      width: size.width,
      height: size.height * 100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return MypageMenuItem(
                    title: items[index]["title"].toString(),
                    icon: items[index]["icon"].toString(),
                    iconColor: toInt(items[index]["iconColor"]),
                    iconBackgroundColor: toInt(items[index]["iconBackgroundColor"]), 
                  );
                }
              )
            ),
          ],
        ),
      )
    );
  }
}