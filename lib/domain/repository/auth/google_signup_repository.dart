import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/auth/google_signup_repository_impl.dart';

final googleSignUpRepositoryProvider = Provider<GoogleSignUpRepository>(
  (ref) => GoogleSignUpRepositoryImpl(
    supabaseAuthDatasource: ref.watch(supabaseAuthDatasourceProvider), 
    authCheckFactory: ref.watch(authCheckProvider)
  )
);

abstract class GoogleSignUpRepository {
  Future<AuthCheck> googleSignUp();
}