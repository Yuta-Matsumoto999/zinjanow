import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/rounded_button.dart';
import 'package:zinjanow_app/ui/view/components/auth/form/outline_text_form.dart';
import 'package:zinjanow_app/ui/view/components/auth/layout.dart';
import 'package:zinjanow_app/ui/view/root/app_router.dart';
import 'package:zinjanow_app/ui/view/validation/validator/email_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/max_validator.dart';
import 'package:zinjanow_app/ui/view/validation/validator/required_validator.dart';

@RoutePage()
class ForgetPassWordPage extends ConsumerStatefulWidget {
  const ForgetPassWordPage({super.key});

  @override
  ForgetPassWordPageState createState() => ForgetPassWordPageState();
}

class ForgetPassWordPageState extends ConsumerState<ForgetPassWordPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  bool isValidEmail = true;
  bool isButtonActive = false;
  String? errorMessage;
  String buttonLoading = "idel";

  void _setEmail(String value) {
    setState(() {
      email = value;
    });
  }

  void _setIsValidEmail(bool isValid) {
    setState(() {
      isValidEmail = isValid;
      _setButtonAvtive();
    });
  }

  void _setButtonAvtive() {
    if(email != "" && isValidEmail) {
      isButtonActive = true;
    }
  }

  void _setErrorMessage(String? value) {
    setState(() {
      errorMessage = value;
    });
  }

  void _setButtonLoading(String value) {
    setState(() {
      buttonLoading = value;
    });
  }

  void sendResetLink() {
    _setButtonLoading("loading");

    // ここでログイン処理

    // 成功したら -> _setButtonLoading("success");
      // Navigator.push(
      //   context, 
      //   MaterialPageRoute(builder: (context) => const CompletePasswordResetLink())
      // );
    // 失敗したら -> _setButtonLoading("failed");
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Center(
              child: Text("Forget Password", style: TextStyle(
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
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text("Please enter your registered email address. " + "\n" + "A password reset link will be sent to your email address.", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87
                    ),),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
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
                    margin: const EdgeInsets.only(top:  40),
                    child: RoundedButton(
                      title: "Send", 
                      backGroundColor: CustomColor.buttonBlack, 
                      textColor: CustomColor.textWhite, 
                      marginTop: 0, 
                      marginBottom: 15, 
                      onPressedCallBack: sendResetLink, 
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
                ],
              ),
            ),
          ),            
        ],
      ),
    );
  }
}