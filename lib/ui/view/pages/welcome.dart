import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/components/welcome/background.dart';
import 'package:zinjanow_app/ui/view/pages/auth/login.dart';
import 'package:zinjanow_app/ui/view/pages/auth/register.dart';

class Welcome extends ConsumerWidget {
  final authProvider = "name";

  const Welcome({super.key});

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
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const Login())
              )
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
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const Register())
              )
            },  
            isActive: true,
            isLoading: "idel",
          )
        ]
      )
    );
  }
}
