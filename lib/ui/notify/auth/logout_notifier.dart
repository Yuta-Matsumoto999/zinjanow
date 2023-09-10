import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/auth/logout_usecase.dart';
import 'package:zinjanow_app/ui/state/auth/auth_state.dart';

final logoutNotifierProvider = StateNotifierProvider<LogoutNotifier, AsyncValue<AuthState>>(
  (ref) => LogoutNotifier(
    logoutUsecase: ref.read(logoutUsecaseProvider)
  )
);

class LogoutNotifier extends StateNotifier<AsyncValue<AuthState>> {
  final LogoutUsecase _logoutUsecase;

  LogoutNotifier({
    required LogoutUsecase logoutUsecase
  }) : _logoutUsecase = logoutUsecase,
  super(const AsyncLoading());

  Future<void> logout() async {
    state = await AsyncValue.guard(() async {
      final res = await _logoutUsecase.excute();
      return AuthState.fromEntity(res);
    });
  }
}