import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/auth/user_notifier.dart';

class UserName extends ConsumerWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    return userState.when(
      data: (state) {
        return Row(
          children: [
            Text("${state.name}👋", style: const TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.w900
              ),
            ),
          ]
        );
      }, 
      error: (error, _) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}