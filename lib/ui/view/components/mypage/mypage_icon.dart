import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/user/user_notifier.dart';
import 'package:zinjanow_app/ui/view/components/common/user_icon.dart';

class MypageIcon extends ConsumerWidget {
  const MypageIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final user = ref.watch(userNotifierProvider);

    return user.when(
      data: (userState) {
        return Container(
          width: size.width,
          height: size.height * 0.4,
          decoration: const BoxDecoration(
            color: Color(0xFFEEECED)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: UserIcon(
                    iconUrl: user.value!.avatar,
                    height: 110, 
                    width: 110, 
                    circular: 50,
                  ),
                ),
                Text(
                  user.value!.name.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800
                  ),
                ),
                const Text("@yuta1222")
              ],
            ),
          )
        );
      }, 
      error: (_, error) {
        return Text("error!!");
      }, 
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}