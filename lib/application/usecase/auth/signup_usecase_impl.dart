import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/signup_repository.dart';
import 'package:zinjanow_app/domain/usecase/auth/signup_usecase.dart';

class SignUpUsecaseImpl implements SignUpUsecase {
  final SignUpRepository _signUpRepository;

  SignUpUsecaseImpl({
    required SignUpRepository signUpRepository
  }) : _signUpRepository = signUpRepository;

  @override
  Future<AuthCheck> excute(name, email, password) async {
    return await _signUpRepository.signup(name, email, password);
  }
}