
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/auth/signup_usecase.dart';
import 'package:zinjanow_app/ui/state/auth/auth_state.dart';

final signupNotifierProvider = StateNotifierProvider<SignUpNotifier, AsyncValue<AuthState>>(
  (ref) => SignUpNotifier(
    signUpUsecase: ref.read(signupUsecaseProvider)
  )
);

class SignUpNotifier extends StateNotifier<AsyncValue<AuthState>> {
  final SignUpUsecase _signUpUsecase;

  SignUpNotifier({
    required SignUpUsecase signUpUsecase
  }) : _signUpUsecase = signUpUsecase,
  super(const AsyncLoading());

  Future<void> signup(name, email, password) async {
    state = await AsyncValue.guard(() async {
      final res = await _signUpUsecase.excute(name, email, password);
      return AuthState.fromEntity(res);
    });
  }
}