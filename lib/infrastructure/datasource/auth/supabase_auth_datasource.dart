import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource_impl.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_check_response_model.dart';

final supabaseAuthDatasourceProvider = Provider<SupabaseAuthDatasource>(
  (ref) =>
    SupabaseAuthDatasourceImpl()
);

abstract class SupabaseAuthDatasource {
  Future<AuthCheckResponseModel> check();
  Future<AuthCheckResponseModel> login(String email, String password);
  Future<AuthCheckResponseModel> signup(String name, String email, String password);
  Future<AuthCheckResponseModel> logout();
  Future<AuthCheckResponseModel> googleSignUp();
}