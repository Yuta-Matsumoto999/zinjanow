
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/application/usecase/user/get_user_usecase_impl.dart';
import 'package:zinjanow_app/domain/entity/user.dart';
import 'package:zinjanow_app/domain/repository/user/get_user_repository.dart';

final getUserUsecaseProvider = Provider<GetUserUsecase>(
  (ref) => GetUserUsecaseImpl(
    getUserRepository: ref.watch(getUserRepositoryProvider)
  )
);

abstract class GetUserUsecase {
  Future<User> excute();
}