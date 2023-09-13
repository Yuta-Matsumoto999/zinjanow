import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/application/usecase/auth/google_signup_usecase_impl.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/google_signup_repository.dart';

final googleSignUpUsecaseProvider = Provider<GoogleSignUpUsecase>(
  (ref) => GoogleSignUpUsecaseImpl(
    googleSignUpRepository: ref.watch(googleSignUpRepositoryProvider)
  )
);

abstract class GoogleSignUpUsecase {
  Future<AuthCheck> excute();
}