import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/user.dart';
import 'package:zinjanow_app/infrastructure/factory/user/get_user_factory_impl.dart';
import 'package:zinjanow_app/infrastructure/model/user/user_response_model.dart';

final getUserFactoryProvider = Provider<GetUserFactory>(
  (ref) => GetUserFactoryImpl()
);

abstract class GetUserFactory {
  User create({
    required String name,
    required String email,
    String? avator
  });

  User createFromModel(UserResponseModel userResponseModel);
}