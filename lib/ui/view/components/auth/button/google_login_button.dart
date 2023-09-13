import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';
import 'package:zinjanow_app/ui/notify/auth/google_signup_notifier.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/idel.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/loading.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/success.dart';
import 'package:zinjanow_app/ui/view/pages/home.dart';

class GoogleLoginButton extends ConsumerStatefulWidget {
  const GoogleLoginButton({super.key});

  @override
  GoogleLoginButtonState createState() => GoogleLoginButtonState();
}

class GoogleLoginButtonState extends ConsumerState<GoogleLoginButton> {
  bool isActive = true;
  String isLoading = "idel";

  void _setIsActive(bool value) {
    setState(() {
      isActive = value;
    });
  }

  void _setIsLoading(String value) {
    setState(() {
      isLoading = value;
    });
  }

  Future<void> _googleSignUp() async {
    _setIsLoading("loading");
    await ref.read(googleSignUpProvider.notifier).signup();
    final googleAuthState = ref.watch(googleSignUpProvider);

    googleAuthState.when(
      data: (state) {
        _setIsLoading("success");
        if(state.isAuth == true) {
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(builder: (context) => const Home()), 
            (route) => false
          );
        } else {
          _setIsLoading("idel");

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
                margin: const EdgeInsets.only(left: 10),
                child: Text(state.message!, style: const TextStyle(
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
        _setIsLoading("loading");
        _setIsActive(false);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(top: 10),
      child: Center(
        child: SizedBox(
          width: size.width * 0.7,
          height: size.height * 0.068,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              splashFactory: NoSplash.splashFactory
            ),
            onPressed: isActive ? () => _googleSignUp() : null,
            child: (() {
              if (isLoading == "idel") {
                return Idel(title: "Google", textColor: CustomColor.textWhite);
              } else if(isLoading == "loading") {
                return Laoding(textColor: CustomColor.textWhite, backGroundColor: CustomColor.buttonBlack);
              } else if(isLoading == "success") {
                return const Success();
              }
            })(),
          ),
        ),
      )
    );
  }
}