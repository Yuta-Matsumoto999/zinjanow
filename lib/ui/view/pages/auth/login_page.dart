import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/auth/login_notifier.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/google_login_button.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/components/auth/form/outline_text_form.dart';
import 'package:zinjanow_app/ui/view/components/auth/layout.dart';
import 'package:zinjanow_app/ui/view/root/app_router.dart';
import 'package:zinjanow_app/ui/view/validation/validator/email_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/max_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/min_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/required_validator.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  bool isValidEmail = true;
  bool isValidPassword = true;
  bool isButtonActive = false;
  String? authErrorMessage = "";
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
    await ref.read(loginNotifierProvider.notifier).login(email, password);
    final loginProvider = ref.watch(loginNotifierProvider);

    loginProvider.when(data: (authState) {
      if(authState.isAuth == true) {
        _setButtonLoading("success");
        context.router.push(const RouterRoute());
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
  
  @override
  Widget build(BuildContext context) {
    return Layout(
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
                      setValue: _setEmail,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => context.router.push(const ForgetPassWordRoute()),
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
                      onPressed: () => context.router.push(const RegisterRoute()),
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
                    child: const Text("Sign in with Google", style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  const GoogleLoginButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}