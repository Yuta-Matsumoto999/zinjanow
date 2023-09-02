import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/components/googleLoginButton.dart';
import 'package:zinjanow_app/ui/components/outlineTextForm.dart';
import 'package:zinjanow_app/ui/components/roundedButton.dart';
import 'package:zinjanow_app/ui/pages/auth/forgetPassword.dart';
import 'package:zinjanow_app/ui/pages/auth/regoister.dart';
import 'package:zinjanow_app/ui/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  child: Text("Log In", style: TextStyle(
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
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const OutlineTextForm(label: "Email", hintText: "Email Address"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const OutlineTextForm(label: "Password", hintText: "password"),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ForgetPassWord())
                                )
                              }, 
                              child: const Text("Forgot Password",style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16
                                )
                              )
                            ),
                          ],
                        )
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: RoundedButton(title: "Log In", color: 0xFFFFFFFF, marginTop: 0, marginBottom: 15, onPressedCallBack: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home())
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
                      const Divider(
                        height: 20,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text("Log In With Google", style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600
                          ),
                        ),
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