import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/view/validation/excute_validation.dart';
import 'package:zinjanow_app/ui/view/validation/validator.dart';

class OutlineTextForm extends StatefulWidget {
  final String label;
  final String hintText;
  final Function setValue;
  final List<Validator> validators;
  final Function setIsValid;
  final String buttonState;
  final bool usedPassword;
  const OutlineTextForm({
    Key? key,
    required this.label,
    required this.hintText,
    required this.setValue,
    required this.validators,
    required this.setIsValid,
    required this.buttonState,
    required this.usedPassword
  }) : super(key: key);

  @override
  State<OutlineTextForm> createState() => _OutlineTextFormState();
}

class _OutlineTextFormState extends State<OutlineTextForm> {

  String? _errorText;
  bool hideText = true;

  @override
  void initState() {
    hideText = widget.usedPassword;
    super.initState();
  }

  void setHideText() {
    setState(() {
      hideText = !hideText;
    });
  }

  void _setErrorMessage(String? value) {
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
            suffixIcon: widget.usedPassword ? IconButton(
              icon: Icon(hideText ? Icons.visibility_off : Icons.visibility, size: 18),
              onPressed: () => setHideText(),
            ) : null
          ),
          onChanged: (String value) {
            _validate(value);
          },
          enabled: widget.buttonState == "idel" ? true : false,
          obscureText: hideText,
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
    ExcuteValidate(widget.validators, widget.setValue, widget.setIsValid, _setErrorMessage).excute(value);
  }
}