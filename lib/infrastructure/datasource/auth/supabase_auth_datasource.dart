import 'package:zinjanow_app/infrastructure/model/auth/auth_checked_user.dart';

abstract class SupabaseAuthDatasource {
  Future<AuthCheckedUser> login(String email, String password);
}