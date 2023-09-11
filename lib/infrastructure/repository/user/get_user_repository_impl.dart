import 'package:zinjanow_app/domain/entity/user.dart';
import 'package:zinjanow_app/domain/factory/user/get_user_factory.dart';
import 'package:zinjanow_app/domain/repository/user/get_user_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/user/supabase_user_datasourse.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  final SupabaseUserDatesource _supabaseUserDatesource;
  final GetUserFactory _getUserFactory;

  GetUserRepositoryImpl({
    required SupabaseUserDatesource supabaseUserDatesource,
    required GetUserFactory getUserFactory
  }) : _supabaseUserDatesource = supabaseUserDatesource,
  _getUserFactory = getUserFactory;

  @override
  Future<User> getUser() async {
    try {
      final res = await _supabaseUserDatesource.getUser();
      return _getUserFactory.createFromModel(res);
    } catch(err) {
      throw Exception(err);
    }
  }
}