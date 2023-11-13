import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help",
          style: TextStyle(
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}