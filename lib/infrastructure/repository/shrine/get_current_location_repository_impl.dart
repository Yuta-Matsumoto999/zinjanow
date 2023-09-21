import 'package:zinjanow_app/domain/entity/shrine/current_location.dart';
import 'package:zinjanow_app/domain/factory/shrine/current_location_factory.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_current_location_repository.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';

class GetCurrentLocationRepositoryImpl implements GetCurrentLocationRepository {
  final GoogleShrineDatasource _googleShrineDatasource;
  final CurrentLocationFactory _currentLocationFactory;

  GetCurrentLocationRepositoryImpl({
    required GoogleShrineDatasource googleShrineDatasource,
    required CurrentLocationFactory currentLocationFactory
  }) : _googleShrineDatasource = googleShrineDatasource,
  _currentLocationFactory = currentLocationFactory;

  @override
  Future<CurrentLocation> getCurrentLocation() async {
    try {
      final res = await _googleShrineDatasource.getCurrentLocation();
      return _currentLocationFactory.createFromModel(res);
    } catch(err) {
      throw Exception();
    }
  }
}