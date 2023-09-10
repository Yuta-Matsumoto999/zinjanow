import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/domain/repository/auth/login_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final SupabaseAuthDatasource _supabaseAuthDatasource;
  final AuthCheckFactory _authCheckFactory;

  LoginRepositoryImpl({
    required SupabaseAuthDatasource supabaseAuthDatasource,
    required AuthCheckFactory authCheckFactory
  }) : _supabaseAuthDatasource = supabaseAuthDatasource,
  _authCheckFactory = authCheckFactory;

  @override
  Future<AuthCheck> login(email, password) async {
    try {
      final res = await _supabaseAuthDatasource.login(email, password);
      return _authCheckFactory.createFromModel(res);
    } catch(err) {
      // ここでエラーハンドリング
      throw Exception();
    }
  }
}