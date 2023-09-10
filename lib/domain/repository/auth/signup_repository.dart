import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/signup_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/auth/signup_repository_impl.dart';

final signupRepositoryProvider = Provider<SignUpRepository>(
  (ref) => SignUpRepositoryImpl(
    supabaseAuthDatasource: ref.watch(supabaseAuthDatasourceProvider), 
    signUpFactory: ref.watch(signupFactoryProvider)
  )
);

abstract class SignUpRepository {
  Future<AuthCheck> signup(name, email, password);
}