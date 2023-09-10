import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/application/usecase/auth/login_usecase_impl.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/login_repository.dart';

final loginUsecaseProvider = Provider<LoginUsecase>(
  (ref) => LoginUsecaseImpl(
    loginRepository: ref.watch(loginRepositoryProvider))
);

abstract class LoginUsecase {
  Future<AuthCheck> excute(email, password);
}
