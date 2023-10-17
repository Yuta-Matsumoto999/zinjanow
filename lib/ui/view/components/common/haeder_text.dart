import 'package:flutter/material.dart';

class HeaderText extends StatefulWidget {
  final String? name;
  const HeaderText({
    Key? key,
    this.name
  }) : super(key: key);

  @override
  State<HeaderText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Hello", style: TextStyle(
              color: Color(0xCCFDFDFE),
              fontSize: 18,
              fontWeight: FontWeight.w800
            )
          ),
          widget.name != null ?
          Text(widget.name.toString(), style: const TextStyle(
              color: Color(0xFAFDFDFE),
              fontSize: 22,
              fontWeight: FontWeight.w900
            )
          )
          : const SizedBox()
        ],
      )
      
    );
  }
}