import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_checked_user.dart';

class SupabaseAuthDatasourceImpl implements SupabaseAuthDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<AuthCheckedUser> login(email, password) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password
      );
      return AuthCheckedUser(isAuth: true, message: null);
    } on AuthException catch(err) {
      return AuthCheckedUser(isAuth: false, message: err.message);
    } catch (err) {
      // ここで通信エラーのハンドリング
      throw Exception();
    }
  }

  @override
  Future<AuthCheckedUser> signup(String name, String email, String password) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {"user_name": name}
      );
      return AuthCheckedUser(isAuth: true, message: null);
    } on AuthException catch (err) {
      return AuthCheckedUser(isAuth: false, message: err.message);
    } catch(err) {
      throw Exception();
    }
  }

  @override
  Future<AuthCheckedUser> logout() async {
    try {
      await supabase.auth.signOut();
      return AuthCheckedUser(isAuth: false, message: null);
    } on AuthException catch (err) {
      return AuthCheckedUser(isAuth: true, message: err.message);
    } catch(err) {
      throw Exception();
    }
  }
}