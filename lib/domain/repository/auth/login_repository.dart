import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/auth/auth_check.dart';
import 'package:zinjanow_app/domain/factory/auth/login_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/auth/login_repository_impl.dart';

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepositoryImpl(
    supabaseAuthDatasource: ref.watch(supabaseAuthDatasourceProvider), 
    loginFactory: ref.watch(loginFactoryProvider)
  )
);
abstract class LoginRepository {
  Future<AuthCheck> login(email, password);
}
