import 'package:flutter/material.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/google_login_button.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/components/auth/form/outline_text_form.dart';
import 'package:zinjanow_app/ui/view/pages/auth/forget_password.dart';
import 'package:zinjanow_app/ui/view/pages/auth/register.dart';
import 'package:zinjanow_app/ui/view/validation/validator/email_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/max_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/min_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/required_validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool isValidEmail = true;
  bool isValidPassword = true;
  bool isButtonActive = false;
  String buttonLoading = "idel";

  void _setEmail(String value) {
    setState(() {
      email = value;
    });
  }

  void _setPassword(String value) {
    setState(() {
      password = value;
    });
  }

  void _setIsValidEmail(bool isValid) {
    setState(() {
      isValidEmail = isValid;
      _setButtonAvtive();
    });
  }

  void _setIsValidPassword(bool isValid) {
    setState(() {
      isValidPassword = isValid;
      _setButtonAvtive();
    });
  }

  void _setButtonAvtive() {
    bool isValid = isAllValid();

    if(isValid && email != "" && password != "") {
      isButtonActive = true;
    } else {
      isButtonActive = false;
    }
  }

  bool isAllValid() {
    return isValidEmail && isValidPassword;
  }

  void _setButtonLoading(String value) {
    setState(() {
      buttonLoading = value;
    });
  }

  Future<void> _login() async {
    _setButtonLoading("loading");

    // if(res) {
    //   _setButtonLoading("success");

    //   Navigator.push(
    //     context, 
    //     MaterialPageRoute(builder: (context) => const Home())
    //   );
    // } else {
    //   _setButtonLoading("failed");
    // }
  }

  void _googleAuthenticate() {
    // ここにGoogle login の処理

    // 成功したら -> _setButtonLoading("success");
      // Navigator.push(
      //   context, 
      //   MaterialPageRoute(builder: (context) => const Home())
      // );
    // 失敗したら -> _setButtonLoading("failed");
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
                margin: const EdgeInsets.only(top: 20),
                child: const Center(
                  child: Text("Log In", style: TextStyle(
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
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: OutlineTextForm(
                          label: "Email", 
                          hintText: "Email Address",
                          onChangeCallBack: _setEmail,
                          validators: [
                            RequiredValidator(),
                            EmailValidator(),
                            MaxValidator(100),
                          ],
                          setIsValid: _setIsValidEmail,
                          buttonState: buttonLoading,
                          usedPassword: false,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: OutlineTextForm(
                          label: "Password", 
                          hintText: "password",
                          onChangeCallBack: _setPassword,
                          validators: [
                            RequiredValidator(),
                            MinValidator(6),
                            MaxValidator(100)
                          ],
                          setIsValid: _setIsValidPassword,
                          buttonState: buttonLoading,
                          usedPassword: true,
                        ),
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
                        margin: const EdgeInsets.only(top: 10),
                        child: RoundedButton(
                          title: "Log In", 
                          backGroundColor: CustomColor.buttonBlack, 
                          textColor: CustomColor.textWhite, 
                          marginTop: 0, 
                          marginBottom: 15, 
                          onPressedCallBack: _login, 
                          isActive: isButtonActive,
                          isLoading: buttonLoading,
                        ),
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
                      GoogleLoginButton(onPressedCallBack: _googleAuthenticate, buttonState: buttonLoading)
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