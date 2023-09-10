import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/auth/login_usecase.dart';
import 'package:zinjanow_app/ui/state/auth/auth_state.dart';

/*
  push login button callback
*/

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, AsyncValue<AuthState>>(
  (ref) => LoginNotifier(
    loginUsecase: ref.read(loginUsecaseProvider),
  )
);

class LoginNotifier extends StateNotifier<AsyncValue<AuthState>> {
  final LoginUsecase _loginUsecase;
  LoginNotifier({
    required LoginUsecase loginUsecase,
  }) : _loginUsecase = loginUsecase,
  super(const AsyncLoading());

  Future<void> login(email, password) async {
    state = await AsyncValue.guard(() async {
      final res = await _loginUsecase.excute(email, password);
      return AuthState.fromEntity(res);
    });
  }
}