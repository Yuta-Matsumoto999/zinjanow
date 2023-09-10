import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/infrastructure/datasource/auth/supabase_auth_datasource_impl.dart';
import 'package:zinjanow_app/infrastructure/model/auth/auth_checked_user.dart';

final supabaseAuthDatasourceProvider = Provider<SupabaseAuthDatasource>(
  (ref) =>
    SupabaseAuthDatasourceImpl()
);

abstract class SupabaseAuthDatasource {
  Future<AuthCheckedUser> login(String email, String password);
}