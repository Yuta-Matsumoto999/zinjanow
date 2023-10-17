import 'package:flutter/material.dart';

class MypageMenuItem extends StatelessWidget {
  final String title;
  final String icon;
  final int? iconColor;
  final int? iconBackgroundColor;
  const MypageMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor,
    this.iconBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(iconBackgroundColor!),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset(
                  icon,
                  color: Color(iconColor!),
                )
              ),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),
                ),
              )
            ],
          ),
          const Icon(Icons.navigate_next)
        ]
      ),
    );
  }
}