import 'package:zinjanow_app/ui/view/validation/message.dart';
import 'package:zinjanow_app/ui/view/validation/validator.dart';

class RequiredValidator implements Validator<String?> {
  @override
  bool validate(String? value) {
    if(value == null) {
      return false;
    }

    return value.trim().isNotEmpty;
  }

  @override
  String getMessage() {
    return Message.reqired;
  }
}