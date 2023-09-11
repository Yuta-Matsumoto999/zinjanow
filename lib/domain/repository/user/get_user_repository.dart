import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/user.dart';
import 'package:zinjanow_app/domain/factory/user/get_user_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/user/supabase_user_datasourse.dart';
import 'package:zinjanow_app/infrastructure/repository/user/get_user_repository_impl.dart';

final getUserRepositoryProvider = Provider<GetUserRepository>(
  (ref) => GetUserRepositoryImpl(
    supabaseUserDatesource: ref.watch(supabaseUserDatasourceProvider), 
    getUserFactory: ref.watch(getUserFactoryProvider)
  )
);

abstract class GetUserRepository {
  Future<User> getUser();
}