import 'package:flutter/material.dart';

class GoogleLoginButton extends StatelessWidget {
  final Function() onPressedCallBack;
  final String buttonState;
  const GoogleLoginButton({
    Key? key,
    required this.onPressedCallBack,
    required this.buttonState,
  }) : super(key: key);

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
          child: ElevatedButton.icon(
            icon: const ImageIcon(
              AssetImage("images/google-icon-2048x2048-czn3g8x8.png")
            ),
            label: const Text('Google'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
              splashFactory: NoSplash.splashFactory
            ),
            onPressed: buttonState == "idel" ? () => onPressedCallBack() : null,
          ),
        ),
      )
    );
  }
}