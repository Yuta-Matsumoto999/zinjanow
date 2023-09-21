import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource_impl.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/current_location_response_model.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_model.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_response_model.dart';

final googleShrineDatasourceProvider = Provider<GoogleShrineDatasource>(
  (ref) => GoogleShrineDatasourceImpl()
);

abstract class GoogleShrineDatasource {
  Future<CurrentLocationResponseModel> getCurrentLocation();
  Future<ShrineModel> getShrines(lat, lng);
  Future<ShrineResponseModel> getShrineDetail(String placeId);
}