import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/auth_check_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/auth/logout_repository_impl.dart';

final logoutRepositoryProvider = Provider<LogoutRepository>(
  (ref) => LogoutRepositoryImpl(
    supabaseAuthDatasource: ref.watch(supabaseAuthDatasourceProvider), 
    authCheckFactory: ref.watch(authCheckProvider)
  )
);

abstract class LogoutRepository {
  Future<AuthCheck> logout();
}