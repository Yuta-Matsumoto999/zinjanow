import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zinjanow_app/domain/entity/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    String? name,
    String? email,
    String? avatar
  }) = _UserState;

  factory UserState.fromEntity(User user) {
    return UserState(
      name: user.name, 
      email: user.email,
      avatar: user.avatar
    );
  }
}