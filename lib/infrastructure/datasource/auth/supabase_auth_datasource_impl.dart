import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_checked_user.dart';

class SupabaseAuthDatasourceImpl implements SupabaseAuthDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<AuthCheckedUser> login(email, password) async {
    try {
      final res =  await supabase.auth.signInWithPassword(
        email: email,
        password: password
      );
      return AuthCheckedUser(isAuth: true, name: "hoge", message: null);
    } on AuthException catch(err) {
      return AuthCheckedUser(isAuth: false, name: null, message: err.message);
    } catch (err) {
      // ここで通信エラーのハンドリング
      throw Exception();
    }
  }
}