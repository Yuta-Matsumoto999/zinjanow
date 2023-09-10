import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/infrastructure/factory/auth/auth_check_factory_impl.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_checked_user.dart';

final authCheckProvider = Provider(
  (ref) => AuthCheckFactoryImpl()
);

abstract class AuthCheckFactory {
  AuthCheck create({
    required bool isAuth,
    String? message
  });

  AuthCheck createFromModel(AuthCheckedUser authCheckedUser);
}