import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_check_response_model.dart';

class SupabaseAuthDatasourceImpl implements SupabaseAuthDatasource {
  final supabase = Supabase.instance.client;

  @override
  Future<AuthCheckResponseModel> check() async {
    try {
      final res = supabase.auth.currentSession;

      if(res != null) {
        return AuthCheckResponseModel(isAuth: true, message: null);
      } else {
        return AuthCheckResponseModel(isAuth: false, message: null);
      }
    } catch(err) {
      throw Exception();
    }
  }

  @override
  Future<AuthCheckResponseModel> login(email, password) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password
      );
      return AuthCheckResponseModel(isAuth: true, message: null);
    } on AuthException catch(err) {
      return AuthCheckResponseModel(isAuth: false, message: err.message);
    } catch (err) {
      // ここで通信エラーのハンドリング
      throw Exception();
    }
  }

  @override
  Future<AuthCheckResponseModel> signup(String name, String email, String password) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {"user_name": name, "role": "general"}
      );
      return AuthCheckResponseModel(isAuth: true, message: null);
    } on AuthException catch (err) {
      return AuthCheckResponseModel(isAuth: false, message: err.message);
    } catch(err) {
      throw Exception();
    }
  }

  @override
  Future<AuthCheckResponseModel> logout() async {
    try {
      await supabase.auth.signOut();
      return AuthCheckResponseModel(isAuth:false, message: null);
    } on AuthException catch (err) {
      return AuthCheckResponseModel(isAuth: true, message: err.message);
    } catch(err) {
      throw Exception();
    }
  }
}