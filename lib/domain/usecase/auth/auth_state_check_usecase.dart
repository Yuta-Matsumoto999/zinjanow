import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/application/usecase/auth/auth_state_check_usecase_impl.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/auth_state_check_repository.dart';

final authStateCheckUsecaseProvider = Provider<AuthStateCheckUsecase>(
  (ref) => AuthStateCheckUsecaseImpl(
    authStateCheckRepository: ref.watch(authStateCheckRepositoryProvider)
  )
);

abstract class AuthStateCheckUsecase {
  Future<AuthCheck> excute();
}