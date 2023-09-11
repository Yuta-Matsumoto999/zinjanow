import 'package:zinjanow_app/domain/entity/user.dart';
import 'package:zinjanow_app/domain/repository/user/get_user_repository.dart';
import 'package:zinjanow_app/domain/usecase/user/get_user_usecase.dart';

class GetUserUsecaseImpl implements GetUserUsecase {
  final GetUserRepository _getUserRepository;

  GetUserUsecaseImpl({
    required GetUserRepository getUserRepository
  }) : _getUserRepository = getUserRepository;

  @override
  Future<User> excute() async {
    return _getUserRepository.getUser();
  }
}