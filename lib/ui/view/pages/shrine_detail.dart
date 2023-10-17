import 'package:flutter/material.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/common/header.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/shrine_detail_content.dart';

class ShrineDetail extends StatelessWidget {
  final String? name;
  const ShrineDetail({
    Key? key,
    this.name
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const Header(
            backgroundImage: "images/2e0edfb869c8a41e3287465d5685a3c8_3.jpg",
            color: CustomColor.detailHeader,
            height: 160,
            visibleText: false,
            visibleIcon: true,
          ),
          Container(
            margin: const EdgeInsets.only(top: 140),
            padding: const EdgeInsets.all(20),
            width: size.width,
            height: size.height * 100,
            decoration: BoxDecoration(
              color: const Color(CustomColor.mainBackground),
              borderRadius: BorderRadius.circular(20)
            ),
            child: const SingleChildScrollView(
              child: ShrineDetailContent()
            )
          )
        ],
      )
    );
  }
}