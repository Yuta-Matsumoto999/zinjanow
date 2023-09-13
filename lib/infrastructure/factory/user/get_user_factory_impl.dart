import 'package:zinjanow_app/domain/entity/user.dart';
import 'package:zinjanow_app/domain/factory/user/get_user_factory.dart';
import 'package:zinjanow_app/infrastructure/model/user/user_response_model.dart';

class GetUserFactoryImpl implements GetUserFactory {
  @override
  User create({required String name, required String email, String? avator}) {
    return User(
      name: name, 
      email: email, 
      avator: avator
    );
  }

  @override
  User createFromModel(UserResponseModel userResponseModel) {
    return User(
      name: userResponseModel.name, 
      email: userResponseModel.email,
      avator: userResponseModel.avator_url
    );
  }
}