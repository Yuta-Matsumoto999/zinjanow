import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_checked_user.dart';

abstract class LoginFactory {
  AuthCheck create({
    required bool isAuth,
    String? name,
    String? message
  });

  AuthCheck createFromModel(AuthCheckedUser authCheckedUser);
}
