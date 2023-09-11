import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/auth/logout_notifier.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/components/category_title.dart';
import 'package:zinjanow_app/ui/view/components/header.dart';
import 'package:zinjanow_app/ui/view/components/home/user_name.dart';
import 'package:zinjanow_app/ui/view/pages/welcome.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {

  String isLoading = "idel";

  void _setIsLoading(String value) {
    setState(() {
      isLoading = value;
    });
  }

  void _logout() async {
    _setIsLoading("loading");

    final logoutProvider = ref.watch(logoutNotifierProvider.notifier);
    await ref.read(logoutNotifierProvider.notifier).logout();

    logoutProvider.state.when(data: (authState) {
      if(authState.isAuth == false) {
        _setIsLoading("success");
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (context) => const Welcome()), 
          (route) => false
        );
      } else {
        _setIsLoading("idel");
      }
    },
    error: (error,_) {
      //
    },
    loading: () {
      _setIsLoading("loading");
    }
  );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          children: [
            const UserName(),
            const CategoryTitle(titleText: "current shrines"),
            const CategoryTitle(titleText: "checked in"),
            const CategoryTitle(titleText: "favorite"),
            RoundedButton(
              title: "Logout", 
              backGroundColor: CustomColor.buttonBlack, 
              textColor: CustomColor.buttonWhite, 
              marginTop: 30,
              marginBottom: 30, 
              isActive: true, 
              isLoading: isLoading,
              onPressedCallBack: _logout,
            )
          ]
        ) 
      )
    );
  }
}
