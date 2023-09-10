import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/application/usecase/auth/logout_usecase_impl.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/logout_repository.dart';

final logoutUsecaseProvider = Provider<LogoutUsecase>(
  (ref) => LogoutUsecaseImpl(
    logoutRepository: ref.watch(logoutRepositoryProvider)
  )
);

abstract class LogoutUsecase {
  Future<AuthCheck> excute();
}