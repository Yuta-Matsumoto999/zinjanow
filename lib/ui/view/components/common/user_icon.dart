import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  final String? iconUrl;
  final double height;
  final double width;
  final double circular;
  const UserIcon({
    Key? key,
    this.iconUrl,
    required this.height,
    required this.width,
    required this.circular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circular),
        border: Border.all(width: 3, color: Colors.white)
      ),
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: iconUrl != null ?
        Image.network(
          iconUrl.toString(),
          fit: BoxFit.cover,
        )
        : Image.asset(
          "images/ifn1058.png"
        )
      ),
    );
  }
}