import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/validation/excuteValidation.dart';
import 'package:zinjanow_app/ui/validation/validator.dart';

class OutlineTextForm extends StatefulWidget {
  final String label;
  final String hintText;
  final Function onChangeCallBack;
  final List<Validator> validators;
  final Function setIsValid;
  const OutlineTextForm({
    Key? key,
    required this.label,
    required this.hintText,
    required this.onChangeCallBack,
    required this.validators,
    required this.setIsValid
  }) : super(key: key);

  @override
  State<OutlineTextForm> createState() => _OutlineTextFormState();
}

class _OutlineTextFormState extends State<OutlineTextForm> {

  String? _errorText;

  void seterrorText(String? value) {
    setState(() {
      _errorText = value;
    });
  }

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
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: widget.hintText,
          ),
          onChanged: (String value) {
            _validate(value);
          },
        ),
        _errorText != null 
        ? Container(
          margin: EdgeInsets.only(top: 6),
          child: Text(
            _errorText!,
            style: const TextStyle(color: Colors.red),
          ) ,
        )
        : const SizedBox()
      ],
    );
  }

  void _validate(String value) {
    ExcuteValidate(widget.validators, widget.onChangeCallBack, widget.setIsValid, seterrorText).excute(value);
  }

  // Color _bindColor() {
  //   if(_errorText == null) {
  //     return
  //   }
  // }
}