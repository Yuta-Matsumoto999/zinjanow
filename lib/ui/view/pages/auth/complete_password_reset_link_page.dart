import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/pages/auth/forget_password_page.dart';
import 'package:zinjanow_app/ui/view/root/app_router.dart';

@RoutePage()
class CompletePasswordResetLinkPage extends StatefulWidget {
  const CompletePasswordResetLinkPage({super.key});

  @override
  State<CompletePasswordResetLinkPage> createState() => _CompletePasswordResetLinkPageState();
}

class _CompletePasswordResetLinkPageState extends State<CompletePasswordResetLinkPage> {
  bool isButtonActive = true;
  String buttonLoading = "idel";

  void _navigateLoginPage() {
    context.router.push(const LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Center(
                  child: Text("Send Reset Link", style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text("A password reset link has been sent to the email address you entered." + "\n" + "If you do not receive the email, please check your email address and request the link again.", style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ))
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: TextButton(
                    onPressed: () => {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const ForgetPassWordPage())
                      )
                    },
                    child: const Text("Request Reset Link Again", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 16
                      ),
                    ),
                  ),
                )
              ),
              Container(
                // margin: const EdgeInsets.only(top: 50),
                child: RoundedButton(
                  title: "Back to Login", 
                  backGroundColor: CustomColor.buttonBlack, 
                  textColor: CustomColor.textWhite, 
                  marginTop: 0, 
                  marginBottom: 15, 
                  onPressedCallBack: _navigateLoginPage, 
                  isActive: isButtonActive,
                  isLoading: buttonLoading,
                ),
              ),          
            ],
          ),
        )
      )
    );
  }
}