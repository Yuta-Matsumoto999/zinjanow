import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/ui/notify/user/user_notifier.dart';
import 'package:zinjanow_app/ui/view/components/common/haeder_text.dart';
import 'package:zinjanow_app/ui/view/components/common/header_icon.dart';

class Header extends ConsumerWidget {
  final String? backgroundImage;
  final int color;
  final double height;
  final bool visibleText;
  final bool visibleIcon;

  const Header({
    Key? key,
    this.backgroundImage,
    required this.color,
    required this.height,
    required this.visibleText,
    required this.visibleIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userNotifierProvider);

    return user.when(
      data: (userState) {
        return Container(
          height: height,
          decoration: backgroundImage != null ?
          BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage.toString()),
              fit: BoxFit.cover
            )
          ) :
          const BoxDecoration(),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(color),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 45),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            visibleText
                            ? HeaderText(name: userState.name)
                            : const SizedBox()
                          ],
                        ),
                      ),
                      visibleIcon
                      ? HeaderIcon(iconUrl: userState.avatar,)
                      : const SizedBox()
                    ],
                  ),
                ],
              ),
            )
          ),
        );
      }, 
      error: (_, error) {
        return const Text("error!!!");
      }, 
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}