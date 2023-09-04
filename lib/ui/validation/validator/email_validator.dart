import 'package:zinjanow_app/ui/validation/message.dart';
import 'package:zinjanow_app/ui/validation/validator.dart';

class EmailValidator implements Validator<String> {
  @override
  bool validate(String value) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

    return emailValid;
  }

  @override
  String getMessage() {
    return Message.email;
  }
}