import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/logout_repository.dart';
import 'package:zinjanow_app/domain/usecase/auth/logout_usecase.dart';

class LogoutUsecaseImpl implements LogoutUsecase {
  final LogoutRepository _logoutRepository;

  LogoutUsecaseImpl({
    required LogoutRepository logoutRepository
  }) : _logoutRepository = logoutRepository;

  @override
  Future<AuthCheck> excute() async {
    return await _logoutRepository.logout();
  }
}