import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/repository/auth/google_signup_repository.dart';
import 'package:zinjanow_app/domain/usecase/auth/google_signup_usecase.dart';

class GoogleSignUpUsecaseImpl implements GoogleSignUpUsecase {
  final GoogleSignUpRepository _googleSignUpRepository;

  GoogleSignUpUsecaseImpl({
    required GoogleSignUpRepository googleSignUpRepository
  }) : _googleSignUpRepository = googleSignUpRepository;

  @override
  Future<AuthCheck> excute() async {
    return await _googleSignUpRepository.googleSignUp();
  }
}