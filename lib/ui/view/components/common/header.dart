import 'package:flutter/material.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/common/header_background.dart';
import 'package:zinjanow_app/ui/view/components/home/user_name.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderBackground(
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(CustomColor.mainTheme)
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 45),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello", style: TextStyle(
                                color: Color(0xCCFDFDFE),
                                fontSize: 18,
                                fontWeight: FontWeight.w800
                              )
                            ),
                            UserName()
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0x59efefef),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Icon(Icons.notifications, color: Colors.white,size: 21,),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}