import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/usecase/user/get_user_usecase.dart';
import 'package:zinjanow_app/ui/state/user/user_state.dart';

final userNotifierProvider = StateNotifierProvider.autoDispose<UserNotifier, AsyncValue<UserState>>(
  (ref) => UserNotifier(
    getUserUsecase: ref.read(getUserUsecaseProvider)
  )
);

class UserNotifier extends StateNotifier<AsyncValue<UserState>> {
  final GetUserUsecase _getUserUsecase;

  UserNotifier({
    required GetUserUsecase getUserUsecase
  }) : _getUserUsecase = getUserUsecase,
  super(const AsyncLoading()) {
    _fetch();
  }

  Future<void> _fetch() async {
    state = await AsyncValue.guard(() async {
      final res = await _getUserUsecase.excute();
      return UserState.fromEntity(res);
    });
  }
}