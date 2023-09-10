import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/domain/repository/auth/signup_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SupabaseAuthDatasource _supabaseAuthDatasource;
  final AuthCheckFactory _authCheckFactory;

  SignUpRepositoryImpl({
    required SupabaseAuthDatasource supabaseAuthDatasource,
    required AuthCheckFactory authCheckFactory
  }) : _supabaseAuthDatasource = supabaseAuthDatasource,
  _authCheckFactory = authCheckFactory;

  @override
  Future<AuthCheck> signup(name, email, password) async {
    try {
      final res = await _supabaseAuthDatasource.signup(name, email, password);
      return _authCheckFactory.createFromModel(res);
    } catch (err) {
      throw Exception();
    }
  }
}