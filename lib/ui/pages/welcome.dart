import 'package:flutter/material.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/components/background.dart';
import 'package:zinjanow_app/ui/components/roundedButton.dart';
import 'package:zinjanow_app/ui/pages/auth/login.dart';
import 'package:zinjanow_app/ui/pages/auth/register.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
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
            isActive: true
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
            isActive: true
          )
        ]
      )
    );
  }
}
