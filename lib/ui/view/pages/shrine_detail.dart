import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/header.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/shrine_detail_content.dart';

class ShrineDetail extends StatelessWidget {
  final String? name;
  const ShrineDetail({
    Key? key,
    this.name
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Header(),
          ShrineDetailContent()
        ],
      ),
    );
  }
}