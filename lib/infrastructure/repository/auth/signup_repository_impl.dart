import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/signup_factory.dart';
import 'package:zinjanow_app/domain/repository/auth/signup_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SupabaseAuthDatasource _supabaseAuthDatasource;
  final SignUpFactory _signUpFactory;

  SignUpRepositoryImpl({
    required SupabaseAuthDatasource supabaseAuthDatasource,
    required SignUpFactory signUpFactory
  }) : _supabaseAuthDatasource = supabaseAuthDatasource,
  _signUpFactory = signUpFactory;

  @override
  Future<AuthCheck> signup(name, email, password) async {
    try {
      final res = await _supabaseAuthDatasource.signup(name, email, password);
      return _signUpFactory.createFromModel(res);
    } catch (err) {
      throw Exception();
    }
  }
}