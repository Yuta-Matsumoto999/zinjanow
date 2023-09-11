import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/infrastructure/datasource/user/supabase_user_datasource_impl.dart';
import 'package:zinjanow_app/infrastructure/model/user/user_response_model.dart';

final supabaseUserDatasourceProvider = Provider<SupabaseUserDatesource>(
  (ref) => SupabaseUserDatesourceImpl()
);

abstract class SupabaseUserDatesource {
  Future<UserResponseModel> getUser();
}