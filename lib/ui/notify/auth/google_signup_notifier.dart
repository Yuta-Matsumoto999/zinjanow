import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/auth/google_signup_usecase.dart';
import 'package:zinjanow_app/ui/state/auth/auth_state.dart';

final googleSignUpProvider = StateNotifierProvider<GoogleSignUpNotifier, AsyncValue<AuthState>>(
  (ref) => GoogleSignUpNotifier(
    googleSignUpUsecase: ref.read(googleSignUpUsecaseProvider)
  )
);

class GoogleSignUpNotifier extends StateNotifier<AsyncValue<AuthState>> {
  final GoogleSignUpUsecase _googleSignUpUsecase;

  GoogleSignUpNotifier({
    required GoogleSignUpUsecase googleSignUpUsecase
  }) : _googleSignUpUsecase = googleSignUpUsecase,
  super(const AsyncLoading());

  Future<void> signup() async {
    state = await  AsyncValue.guard(() async {
      final res = await _googleSignUpUsecase.excute();
      return AuthState.fromEntity(res);
    });
  }
}