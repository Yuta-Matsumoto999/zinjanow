import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserName extends ConsumerWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text("hoge", style: TextStyle(
        color: Color(0xFAFDFDFE),
        fontSize: 22,
        fontWeight: FontWeight.w900
      )
    );
  }
}