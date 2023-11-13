import 'package:flutter/material.dart';

class Follow extends StatelessWidget {
  const Follow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Follow",
          style: TextStyle(
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}