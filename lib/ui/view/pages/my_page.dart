import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/view/components/mypage/mypage_menu_list.dart';
import 'package:zinjanow_app/ui/view/components/mypage/mypage_icon.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          MypageIcon(),
          MypageMenuList()
        ]
      )
    );
  }
}