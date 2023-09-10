import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_checked_user.dart';

class AuthCheckFactoryImpl implements AuthCheckFactory {
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