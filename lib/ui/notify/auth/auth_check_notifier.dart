import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/auth/auth_state_check_usecase.dart';
import 'package:zinjanow_app/ui/state/auth/auth_state.dart';

final authStateCheckProvider = StateNotifierProvider<AuthCheckNotifier, AsyncValue<AuthState>>(
  (ref) => AuthCheckNotifier(
    authStateCheckUsecase: ref.read(authStateCheckUsecaseProvider)
  )
);

class AuthCheckNotifier extends StateNotifier<AsyncValue<AuthState>> {
  final AuthStateCheckUsecase _authStateCheckUsecase;

  AuthCheckNotifier({
    required AuthStateCheckUsecase authStateCheckUsecase
  }) : _authStateCheckUsecase = authStateCheckUsecase,
  super(const AsyncLoading()) {
    _check();
  }

  Future<void> _check() async {
    state = await AsyncValue.guard(() async {
      final res = await _authStateCheckUsecase.excute();
      return AuthState.fromEntity(res);
    });
  }
}