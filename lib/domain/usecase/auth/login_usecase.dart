import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';

abstract class LoginUsecase {
  Future<AuthCheck> excute(email, password);
}
