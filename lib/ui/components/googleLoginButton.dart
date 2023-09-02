import 'package:flutter/material.dart';

class GoogleLoginButton extends StatelessWidget {
  final Function() onPressedCallBack;
  const GoogleLoginButton({
    Key? key,
    required this.onPressedCallBack
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(top: 10),
      child: Center(
        child: SizedBox(
          width: size.width * 0.65,
          height: size.height * 0.065,
          child: ElevatedButton.icon(
            icon: const ImageIcon(
              AssetImage("images/google-icon-2048x2048-czn3g8x8.png")
            ),
            label: const Text('Google'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
            ),
            onPressed: onPressedCallBack(),
          ),
        ),
      )
    );
  }
}