import 'package:flutter/material.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/header_background.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderBachground(
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(CustomColor.detailHeader)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(102, 239, 239, 239),
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Icon(Icons.notifications, color: Colors.white,size: 21,),
            )
          ],
        ),
      )
    );
  }
}