import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
    final String title;
    final int backGroundColor;
    final int textColor;
    final double marginTop;
    final double marginBottom;
    final bool isActive;
    final Function()? onPressedCallBack;
    const RoundedButton({
      Key? key,
      required this.title,
      required this.backGroundColor,
      required this.textColor,
      required this.marginTop,
      required this.marginBottom,
      required this.isActive,
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
          height: size.height * 0.068,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(widget.backGroundColor),
              foregroundColor: Color(widget.textColor),
              shape: const StadiumBorder(),
            ),
            onPressed: widget.isActive ? () => widget.onPressedCallBack!() : null,
            child: Text(widget.title, style: const TextStyle(
                fontSize: 16
              ),
            ),
          ),
        ),
      )
    );
  }
}
