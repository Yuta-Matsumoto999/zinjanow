import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  final String? iconUrl;
  const HeaderIcon({
    Key? key,
    this.iconUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 3, color: Colors.white)
      ),
      width: 40,
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: iconUrl != null ?
        Image.network(
          iconUrl.toString(),
        )
        : Image.asset(
          "images/ifn1058.png"
        )
      ),
    );
  }
}