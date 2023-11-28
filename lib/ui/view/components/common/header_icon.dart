import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/view/components/common/user_icon.dart';
import 'package:zinjanow_app/ui/view/root/app_router.dart';

class HeaderIcon extends StatelessWidget {
  final String? iconUrl;
  const HeaderIcon({
    Key? key,
    this.iconUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const ProfileRoute());
      },
      child: UserIcon(
        iconUrl: iconUrl,
        height: 40, 
        width: 40, 
        circular: 50
      )
    );
  }
}