import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/auth/signup_repository_impl.dart';

final signupRepositoryProvider = Provider<SignUpRepository>(
  (ref) => SignUpRepositoryImpl(
    supabaseAuthDatasource: ref.watch(supabaseAuthDatasourceProvider), 
    authCheckFactory: ref.watch(authCheckProvider)
  )
);

abstract class SignUpRepository {
  Future<AuthCheck> signup(name, email, password);
}