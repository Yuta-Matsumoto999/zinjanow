import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/auth_state_check_repository.dart';
import 'package:zinjanow_app/domain/usecase/auth/auth_state_check_usecase.dart';

class AuthStateCheckUsecaseImpl implements AuthStateCheckUsecase {
  final AuthStateCheckRepository _authStateCheckRepository;

  AuthStateCheckUsecaseImpl({
    required AuthStateCheckRepository authStateCheckRepository
  }) : _authStateCheckRepository = authStateCheckRepository;

  @override
  Future<AuthCheck> excute() async {
    return await _authStateCheckRepository.check();
  }
}