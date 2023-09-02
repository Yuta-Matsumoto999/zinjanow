import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/components/googleLoginButton.dart';
import 'package:zinjanow_app/ui/components/roundedButton.dart';
import 'package:zinjanow_app/ui/components/outlineTextForm.dart';
import 'package:zinjanow_app/ui/pages/auth/login.dart';
import 'package:zinjanow_app/ui/pages/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Center(
                  child: Text("Sign Up", style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
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
                        margin: const EdgeInsets.only(top: 5, bottom: 10),
                        child: const OutlineTextForm(label: "Name", hintText: "Your NickName",),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const OutlineTextForm(label: "Email", hintText: "Email Address"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const OutlineTextForm(label: "Password", hintText: "password"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const OutlineTextForm(label: "Password-comfirm", hintText: "password confirm"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: RoundedButton(title: "SIGN UP", color: 0xFFFFFFFF, marginTop: 0, marginBottom: 15, onPressedCallBack: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home())
                          )
                        }),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () => {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const Login())
                            )
                          },
                          child: const Text("Do you already have an account??", style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                              fontSize: 14
                            ),
                          ),
                        )
                      ),
                      const Divider(
                        height: 20,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text("SignIn With Google", style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                      GoogleLoginButton(onPressedCallBack: _googleAuthenticate)
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

  void _googleAuthenticate() {
    // ここにGoogle login の処理
  }
}
