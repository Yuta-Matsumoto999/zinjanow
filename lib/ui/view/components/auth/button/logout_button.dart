import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/auth/logout_notifier.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/pages/welcome.dart';

class LogoutButton extends ConsumerStatefulWidget {
  const LogoutButton({super.key});

  @override
  LogoutButtonState createState() => LogoutButtonState();
}

class LogoutButtonState extends ConsumerState<LogoutButton> {
  String isLoading = "idel";

  void _setIsLoading(String value) {
    setState(() {
      isLoading = value;
    });
  }

  void _logout() async {
    _setIsLoading("loading");

    await ref.read(logoutNotifierProvider.notifier).logout();
    final logoutProvider = ref.watch(logoutNotifierProvider);

    logoutProvider.when(
      data: (authState) {
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
    return RoundedButton(
      title: "Logout", 
      backGroundColor: CustomColor.buttonBlack, 
      textColor: CustomColor.buttonWhite, 
      marginTop: 30,
      marginBottom: 30, 
      isActive: true, 
      isLoading: isLoading,
      onPressedCallBack: _logout
    );
  }
}