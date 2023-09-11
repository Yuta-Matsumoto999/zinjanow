import 'package:flutter/material.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();


  @override
  Size get preferredSize => const Size.fromHeight(35);
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Hello", style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 26
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.notifications,
                size: 28,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ImageIcon(
                  AssetImage("images/ifn1058.png"),
                  size: 28,
                ),
              )
            ],
          )
        ],
      ),
      backgroundColor: Color(CustomColor.mainBackground),
    );
  }
}