import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final int color;
  final double marginTop;
  final double marginBottom;
  final Function()? onPressedCallBack;
  const RoundedButton({
    Key? key,
    required this.title,
    required this.color,
    required this.marginTop,
    required this.marginBottom,
    this.onPressedCallBack
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: Center(
        child: SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.065,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(color),
              foregroundColor: Colors.black,
              shape: const StadiumBorder(),
            ),
            child: Text(title, style: const TextStyle(
                fontSize: 16
              ),
            ),
            onPressed: () => onPressedCallBack!(),
          ),
        ),
      )
    );
  }
}