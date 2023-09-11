import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/auth/auth_state_check_repository_impl.dart';

final authStateCheckRepositoryProvider = Provider<AuthStateCheckRepository>(
  (ref) => AuthStateCheckRepositoryImpl(
    supabaseAuthDatasource: ref.watch(supabaseAuthDatasourceProvider), 
    authCheckFactory: ref.watch(authCheckProvider)
  )
);

abstract class AuthStateCheckRepository {
  Future<AuthCheck> check();
}