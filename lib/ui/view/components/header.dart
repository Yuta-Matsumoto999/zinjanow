import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/auth/user_notifier.dart';

class Header extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  HeaderState createState() => HeaderState();


  @override
  Size get preferredSize => const Size.fromHeight(35);
}

class HeaderState extends ConsumerState<Header> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    return userState.when(
      data: (state) {
        return AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Hello", style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 26
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.notifications,
                    size: 28,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: state.avatar != null ? 
                      Image.network(state.avatar!, width: 30, height: 30, fit: BoxFit.cover)
                      : 
                      const ImageIcon(
                        AssetImage("images/ifn1058.png"),
                        size: 33,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          backgroundColor: Color(CustomColor.mainBackground),
        );
      }, 
      error: (error, _) {
        throw Exception();
      }, 
      loading: () {
        return SizedBox();
      }
    );
  }
}