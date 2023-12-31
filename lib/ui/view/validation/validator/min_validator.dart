import 'package:zinjanow_app/ui/view/validation/message.dart';
import 'package:zinjanow_app/ui/view/validation/validator.dart';

class MinValidator implements Validator<String> {
  final int minLength;

  MinValidator(this.minLength);

  @override
  bool validate(String value) {
    return value.length >= minLength;
  }

  @override
  String getMessage() {
    return '$minLength${Message.min}';
  }
}