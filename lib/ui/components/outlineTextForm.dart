import 'package:flutter/material.dart';

class OutlineTextForm extends StatefulWidget {
  final String label;
  final String hintText;
  const OutlineTextForm({
    Key? key,
    required this.label,
    required this.hintText,
  }) : super(key: key);

  @override
  State<OutlineTextForm> createState() => _OutlineTextFormState();
}

class _OutlineTextFormState extends State<OutlineTextForm> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: Text(widget.label, style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w800,
              fontSize: 16
            ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            hintText: widget.hintText
          ),
        )
      ],
    );
  }
}