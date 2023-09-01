import 'package:flutter/material.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text("Yuta 👋", style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.w900
          ),
        ),
      ]
    );
  }
}