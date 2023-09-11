import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zinjanow_app/core/exception/network_exception.dart';
import 'package:zinjanow_app/infrastructure/datasource/user/supabase_user_datasourse.dart';
import 'package:zinjanow_app/infrastructure/model/user/user_response_model.dart';

class SupabaseUserDatesourceImpl implements SupabaseUserDatesource {
  final supabase = Supabase.instance.client;

  @override
  Future<UserResponseModel> getUser() async {
    try {
      final res = await supabase.from("profiles").select();
      final model = UserResponseModel.fromJson(res[0]);
      return model;
    } catch(err) {
      throw NetworkException("通信エラー");
    }
  }
}