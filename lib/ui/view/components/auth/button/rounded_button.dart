import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/failed.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/idel.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/loading.dart';
import 'package:zinjanow_app/ui/view/components/auth/button/success.dart';

class RoundedButton extends StatefulWidget {
    final String title;
    final int backGroundColor;
    final int textColor;
    final double marginTop;
    final double marginBottom;
    final bool isActive;
    final String isLoading;
    final Function()? onPressedCallBack;
    const RoundedButton({
      Key? key,
      required this.title,
      required this.backGroundColor,
      required this.textColor,
      required this.marginTop,
      required this.marginBottom,
      required this.isActive,
      required this.isLoading,
      this.onPressedCallBack
    }) : super(key: key);
  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: widget.marginTop, bottom: widget.marginBottom),
      child: Center(
        child: SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.07,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(widget.backGroundColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: widget.isActive ? () => {widget.onPressedCallBack!()} : null,
            child: (() {
              if (widget.isLoading == "idel") {
                return Idel(title: widget.title, textColor: widget.textColor);
              } else if(widget.isLoading == "loading") {
                return Laoding(textColor: widget.textColor, backGroundColor: widget.backGroundColor);
              } else if(widget.isLoading == "success") {
                return const Success();
              } else if(widget.isLoading == "failed") {
                return Failed(title: widget.title, textColor: widget.textColor);
              }
            })(),
          ),
        ),
      )
    );
  }
}
