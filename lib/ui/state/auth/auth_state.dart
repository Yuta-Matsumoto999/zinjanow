import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool isAuth,
    String? message
  }) = _AuthState;

  factory AuthState.fromEntity(AuthCheck authCheck) {
    return AuthState(
      isAuth: authCheck.isAuth,
      message: authCheck.message
    );
  }
}