import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_check_response_model.dart';

class AuthCheckFactoryImpl implements AuthCheckFactory {
  @override
  AuthCheck create({String? message}) {
    return AuthCheck(
      message: message
    );
  }

  @override
  AuthCheck createFromModel(AuthCheckResponseModel authCheckResponseModel) {
    return AuthCheck(
      message: authCheckResponseModel.message
    );
  }
}