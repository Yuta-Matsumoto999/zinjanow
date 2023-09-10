import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/auth/signup_notifier.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/google_login_button.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/components/auth/form/outline_text_form.dart';
import 'package:zinjanow_app/ui/view/pages/auth/login.dart';
import 'package:zinjanow_app/ui/view/pages/home.dart';
import 'package:zinjanow_app/ui/view/validation/validator/confirm_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/email_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/max_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/min_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/required_validator.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends ConsumerState<Register> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String passwordConfirm = '';
  bool isValidName = true;
  bool isValidEmail = true;
  bool isValidPassword = true;
  bool isValidPasswordComfirm = true;
  bool isButtonActive = false;
  String buttonLoading = "idel";

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
      isValidName = isValid;
      _setButtonAvtive();
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

  void _setIsValidPasswordConfirm(bool isValid) {
    setState(() {
      isValidPasswordComfirm = isValid;
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

  void _setButtonLoading(String value) {
    setState(() {
      buttonLoading = value;
    });
  }

  bool isAllValid() {
    return isValidName && isValidEmail && isValidPassword && isValidPasswordComfirm;
  }


  Future<void> _signup() async {
    _setButtonLoading("loading");
    final signupProvider = ref.watch(signupNotifierProvider.notifier);
    await ref.read(signupNotifierProvider.notifier).signup(name, email, password);

    signupProvider.state.when(data: (authState) {
      if(authState.isAuth == true) {
        _setButtonLoading("success");
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const Home())
        );
      } else {
        _setButtonLoading("idel");

        final snackbar =  SnackBar(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          content: Row(
            children: [
              const Icon(
                Icons.info,
                color: Colors.red,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(authState.message!, style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  )
                )
              )
            ],
          ),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          closeIconColor: const Color(CustomColor.snackbarCloseIconColor),
          backgroundColor: const Color(CustomColor.snackbarError)
        );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }, 
    error: (error, _) {
      //
    }, 
    loading: () {
      setState(() {
        isButtonActive = false;
      });
    });
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
                          setValue: _setName,
                          validators: [
                            RequiredValidator(),
                            MaxValidator(100)
                          ],
                          setIsValid: _setIsValidName,
                          buttonState: buttonLoading,
                          usedPassword: false,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: OutlineTextForm(
                          label: "Email", 
                          hintText: "Email Address",
                          setValue: _setEmail,
                          validators: [
                            RequiredValidator(),
                            EmailValidator(),
                            MaxValidator(100)
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
                          setValue: _setPassword,
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
                        child: OutlineTextForm(
                          label: "Password-comfirm", 
                          hintText: "password confirm",
                          setValue: _setPasswordConfirm,
                          validators: [
                            RequiredValidator(),
                            ConfirmValidator(password, "password"),
                            MinValidator(6),
                            MaxValidator(100)
                          ],
                          setIsValid: _setIsValidPasswordConfirm,
                          buttonState: buttonLoading,
                          usedPassword: true,
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
                          onPressedCallBack: _signup, 
                          isActive: isButtonActive,
                          isLoading: buttonLoading,
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
