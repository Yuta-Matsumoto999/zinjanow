import 'package:zinjanow_app/ui/view/validation/message.dart';
import 'package:zinjanow_app/ui/view/validation/validator.dart';

class MaxValidator implements Validator<String> {
  final int maxLength;

  MaxValidator(this.maxLength);

  @override
  bool validate(String value) {
    return value.length <= maxLength;
  }

  @override
  String getMessage() {
    return '$maxLength${Message.max}';
  }
}