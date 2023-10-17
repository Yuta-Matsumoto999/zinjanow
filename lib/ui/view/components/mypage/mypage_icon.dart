import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/user/user_notifier.dart';

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
          height: size.height * 0.33,
          decoration: const BoxDecoration(
            color: Color(0xFFEEECED)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(bottom: 20),
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: user.value!.avatar != null ? 
                    Image.network(
                      user.value!.avatar.toString(),
                      fit: BoxFit.cover,
                    )
                    : Container(
                      width: size.width,
                      height: size.height,
                      child: const Icon(Icons.account_circle),
                    )
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