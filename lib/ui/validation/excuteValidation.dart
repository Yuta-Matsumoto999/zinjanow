import 'package:zinjanow_app/ui/validation/validator.dart';

class ExcuteValidate<T> {
  final Function onChangeCallBack;
  final List<Validator> validators;
  final Function setIsValid;
  final Function seterrorText;

  ExcuteValidate(this.validators, this.onChangeCallBack, this.setIsValid, this.seterrorText);

  void excute(T value) {
    onChangeCallBack(value);
    final result = validators.where((validator) => validator.validate(value) == false).toList();

    if(result.isNotEmpty) {
      seterrorText(result.first.getMessage());
      setIsValid(false);
    } else {
      seterrorText(null);
      setIsValid(true);
    }
  }
}