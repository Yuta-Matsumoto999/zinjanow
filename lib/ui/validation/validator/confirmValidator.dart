import 'package:zinjanow_app/ui/validation/message.dart';
import 'package:zinjanow_app/ui/validation/validator.dart';

class ConfirmValidator implements Validator<String> {
  String text = "";
  String title = "";

  ConfirmValidator(this.text, this.title);

  @override
  bool validate(String value) {
    if(value != text) {
      return false;
    }

    return value.trim().isNotEmpty;
  }

  @override
  String getMessage() {
    return '$title${Message.confirm}';
  }
}