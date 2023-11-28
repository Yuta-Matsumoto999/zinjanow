import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/components/welcome/background.dart';
import 'package:zinjanow_app/ui/view/root/app_router.dart';

@RoutePage()
class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: const Center(
              child: Text("Zinjanow", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            )
          ),
          SizedBox(
            height: size.height * 0.53,
          ),
          RoundedButton(
            title: "Login", 
            backGroundColor: CustomColor.buttonWhite, 
            textColor: CustomColor.buttonBlack, 
            marginTop: 0, 
            marginBottom: 38, 
            onPressedCallBack: () => {
              context.router.push(const LoginRoute())
            }, 
            isActive: true,
            isLoading: "idel",
          ),
          RoundedButton(
            title: "Sign up",  
            backGroundColor: CustomColor.buttonWhite, 
            textColor: CustomColor.buttonBlack, 
            marginTop: 0, 
            marginBottom: 0, 
            onPressedCallBack: () => {
              context.router.push(const RegisterRoute())
            },  
            isActive: true,
            isLoading: "idel",
          )
        ]
      )
    );
  }
}
