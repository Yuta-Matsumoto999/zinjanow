import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/domain/repository/auth/logout_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final SupabaseAuthDatasource _supabaseAuthDatasource;
  final AuthCheckFactory _authCheckFactory;

  LogoutRepositoryImpl({
    required SupabaseAuthDatasource supabaseAuthDatasource,
    required AuthCheckFactory authCheckFactory
  }) : _supabaseAuthDatasource = supabaseAuthDatasource,
  _authCheckFactory = authCheckFactory;

  @override
  Future<AuthCheck> logout() async {
    try{
      final res = await _supabaseAuthDatasource.logout();
      return _authCheckFactory.createFromModel(res);
    } catch (err) {
      throw Exception();
    }
  }
}