import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/application/usecase/auth/signup_usecase_impl.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/signup_repository.dart';

final signupUsecaseProvider = Provider<SignUpUsecase>(
  (ref) => SignUpUsecaseImpl(
    signUpRepository: ref.watch(signupRepositoryProvider)
  )
);

abstract class SignUpUsecase {
  Future<AuthCheck> excute(name, email, password);
}