import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/login_repository.dart';
import 'package:zinjanow_app/domain/usecase/auth/login_usecase.dart';

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository _loginRepository;

  LoginUsecaseImpl({
    required LoginRepository loginRepository
  }) : _loginRepository = loginRepository;

  @override
  Future<AuthCheck> excute(email, password) async {
    return await _loginRepository.login(email, password);
  }
}
