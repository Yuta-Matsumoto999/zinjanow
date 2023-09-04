import 'package:flutter/material.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/components/googleLoginButton.dart';
import 'package:zinjanow_app/ui/components/roundedButton.dart';
import 'package:zinjanow_app/ui/components/outlineTextForm.dart';
import 'package:zinjanow_app/ui/pages/auth/login.dart';
import 'package:zinjanow_app/ui/pages/home.dart';
import 'package:zinjanow_app/ui/validation/validator/confirmValidator.dart';
import 'package:zinjanow_app/ui/validation/validator/email_validator.dart';
import 'package:zinjanow_app/ui/validation/validator/maxVlidator.dart';
import 'package:zinjanow_app/ui/validation/validator/minValidator.dart';
import 'package:zinjanow_app/ui/validation/validator/required_validator.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String passwordConfirm = '';
  bool _isValidName = false;
  bool _isValidEmail = false;
  bool _isValidPassword = false;
  bool _isValidPasswordComfirm = false;
  bool isButtonActive = false;

  void _setName(String value) {
    setState(() {
      name = value;
    });
  }

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

  void _setPasswordConfirm(String value) {
    setState(() {
      passwordConfirm = value;
    });
  }

  void _setIsValidName(bool isValid) {
    setState(() {
      _isValidName = isValid;
      _setButtonAvtive();
    });
  }

  void _setIsValidEmail(bool isValid) {
    setState(() {
      _isValidEmail = isValid;
      _setButtonAvtive();
    });
  }

  void _setIsValidPassword(bool isValid) {
    setState(() {
      _isValidPassword = isValid;
      _setButtonAvtive();
    });
  }

  void _setIsValidPasswordConfirm(bool isValid) {
    setState(() {
      _isValidPasswordComfirm = isValid;
      _setButtonAvtive();
    });
  }

  void _setButtonAvtive() {
    bool isValid = isAllValid();

    if(isValid && name != "" && email != "" && password != "" && passwordConfirm != "") {
      isButtonActive = true;
    } else {
      isButtonActive = false;
    }
  }

  void _register() {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const Home())
    );
  }

  void _googleAuthenticate() {
    // ここにGoogle login の処理
  }

  bool isAllValid() {
    return _isValidName && _isValidEmail && _isValidPassword && _isValidPasswordComfirm;
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
                        child: OutlineTextForm(
                          label: "Name", 
                          hintText: "Your NickName",
                          onChangeCallBack: _setName,
                          validators: [
                            RequiredValidator(),
                            MaxValidator(100)
                          ],
                          setIsValid: _setIsValidName,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: OutlineTextForm(
                          label: "Email", 
                          hintText: "Email Address",
                          onChangeCallBack: _setEmail,
                          validators: [
                            RequiredValidator(),
                            EmailValidator(),
                            MaxValidator(100)
                          ],
                          setIsValid: _setIsValidEmail,
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
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: OutlineTextForm(
                          label: "Password-comfirm", 
                          hintText: "password confirm",
                          onChangeCallBack: _setPasswordConfirm,
                          validators: [
                            RequiredValidator(),
                            ConfirmValidator(password, "パスワード"),
                            MinValidator(6),
                            MaxValidator(100)
                          ],
                          setIsValid: _setIsValidPasswordConfirm,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: RoundedButton(
                          title: "Sign Up", 
                          backGroundColor: CustomColor.buttonBlack, 
                          textColor: CustomColor.textWhite, 
                          marginTop: 0, 
                          marginBottom: 15, 
                          onPressedCallBack: _register, 
                          isActive: isButtonActive
                        ),
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
}
