import 'package:zinjanow_app/ui/view/validation/message.dart';
import 'package:zinjanow_app/ui/view/validation/validator.dart';

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