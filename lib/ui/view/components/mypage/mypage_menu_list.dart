import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/mypage/mypage_menu_item.dart';

class MypageMenuList extends StatelessWidget {
  final List items;
  const MypageMenuList({
    Key? key,
    required this.items
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.37),
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
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => items[index]["navigator"])
                      );
                    },
                    child: MypageMenuItem(
                      title: items[index]["title"].toString(),
                      icon: items[index]["icon"].toString(),
                      iconColor: toInt(items[index]["iconColor"]),
                      iconBackgroundColor: toInt(items[index]["iconBackgroundColor"]),
                    )
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