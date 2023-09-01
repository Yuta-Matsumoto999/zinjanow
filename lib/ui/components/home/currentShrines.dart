import 'package:flutter/material.dart';

class CurrentShrines extends StatefulWidget {
  const CurrentShrines({super.key});

  @override
  State<CurrentShrines> createState() => _CurrentShrinesState();
}

class _CurrentShrinesState extends State<CurrentShrines> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Row(
            children: [
              // ここに検索用のform設置
            ],
          )
        ],
      )
    );
  }
}