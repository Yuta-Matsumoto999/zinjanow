import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/login_factory.dart';
import 'package:zinjanow_app/domain/repository/auth/login_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final SupabaseAuthDatasource _supabaseAuthDatasource;
  final LoginFactory _loginFactory;

  LoginRepositoryImpl({
    required SupabaseAuthDatasource supabaseAuthDatasource,
    required LoginFactory loginFactory
  }) : _supabaseAuthDatasource = supabaseAuthDatasource,
  _loginFactory = loginFactory;

  @override
  Future<AuthCheck> login(email, password) async {
    try {
      final res = await _supabaseAuthDatasource.login(email, password);
      return _loginFactory.createFromModel(res);
    } catch(err) {
      // ここでエラーハンドリング
      throw Exception();
    }
  }
}