import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/components/outlineTextForm.dart';
import 'package:zinjanow_app/ui/components/roundedButton.dart';
import 'package:zinjanow_app/ui/pages/auth/completePasswordResetLink.dart';
import 'package:zinjanow_app/ui/pages/auth/regoister.dart';

class ForgetPassWord extends StatefulWidget {
  const ForgetPassWord({super.key});

  @override
  State<ForgetPassWord> createState() => _ForgetPassWordState();
}

class _ForgetPassWordState extends State<ForgetPassWord> {
  final _formKey = GlobalKey<FormState>();

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
                  child: Text("Forget Password", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                )
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text("Please enter your registered email address. " + "\n" + "A password reset link will be sent to your email address.", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87
                        ),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40, bottom: 20),
                        child: const OutlineTextForm(label: "Email", hintText: "Email Address"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top:  40),
                        child: RoundedButton(title: "Send", color: 0xFFFFFFFF, marginTop: 0, marginBottom: 15, onPressedCallBack: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CompletePasswordResetLink())
                          )
                        }),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: TextButton(
                          onPressed: () => {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const Register())
                            )
                          },
                          child: const Text("Would you like to create an account??", style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                              fontSize: 14
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),            
            ],
          ),
        )
      )
    );
  }
}