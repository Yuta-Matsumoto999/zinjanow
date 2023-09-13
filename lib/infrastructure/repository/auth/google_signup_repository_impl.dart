import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/domain/repository/auth/google_signup_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';

class GoogleSignUpRepositoryImpl implements GoogleSignUpRepository {
  final SupabaseAuthDatasource _supabaseAuthDatasource;
  final AuthCheckFactory _authCheckFactory;

  GoogleSignUpRepositoryImpl({
    required SupabaseAuthDatasource supabaseAuthDatasource,
    required AuthCheckFactory authCheckFactory
  }) : _supabaseAuthDatasource = supabaseAuthDatasource,
  _authCheckFactory = authCheckFactory;

  @override
  Future<AuthCheck> googleSignUp() async {
    try {
      final res = await _supabaseAuthDatasource.googleSignUp();
      return _authCheckFactory.createFromModel(res);
    } catch (err) {
      throw Exception();
    }
  }
}