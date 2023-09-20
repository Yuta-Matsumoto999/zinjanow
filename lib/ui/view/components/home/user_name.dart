import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/user/user_notifier.dart';

class UserName extends ConsumerWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);
    return userState.when(
      data: (state) {
        return Text(state.name.toString(), style: const TextStyle(
            color: Color(0xFAFDFDFE),
            fontSize: 22,
            fontWeight: FontWeight.w900
          )
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