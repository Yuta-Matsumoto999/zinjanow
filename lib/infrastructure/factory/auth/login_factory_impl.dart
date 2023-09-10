import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/login_factory.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_checked_user.dart';

class LoginFactoryImpl implements LoginFactory {
  @override
  AuthCheck create({required bool isAuth, String? message}) {
    return AuthCheck(
      isAuth: isAuth,
      message: message
    );
  }

  @override
  AuthCheck createFromModel(AuthCheckedUser authCheckedUser) {
    return AuthCheck(
      isAuth: authCheckedUser.isAuth,
      message: authCheckedUser.message
    );
  }
}