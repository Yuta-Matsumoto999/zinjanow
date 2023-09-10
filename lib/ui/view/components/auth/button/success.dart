import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
        ),
        const Text("Success", style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }
}