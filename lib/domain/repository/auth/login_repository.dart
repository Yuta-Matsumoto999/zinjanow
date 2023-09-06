import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';

abstract class LoginRepository {
  Future<AuthCheck> login(email, password);
}
