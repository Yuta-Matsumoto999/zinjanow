import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_check_response_model.dart';

class AuthCheckFactoryImpl implements AuthCheckFactory {
  @override
  AuthCheck create({ required bool isAuth, String? message}) {
    return AuthCheck(
      isAuth: isAuth,
      message: message
    );
  }

  @override
  AuthCheck createFromModel(AuthCheckResponseModel authCheckResponseModel) {
    return AuthCheck(
      isAuth: authCheckResponseModel.isAuth,
      message: authCheckResponseModel.message
    );
  }
}