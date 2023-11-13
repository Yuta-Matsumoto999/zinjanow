import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/view/components/common/user_icon.dart';
import 'package:zinjanow_app/ui/view/pages/profile.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
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