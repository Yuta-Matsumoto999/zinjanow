import 'package:zinjanow_app/domain/factory/shrine/distance_factory.dart';
import 'package:zinjanow_app/domain/repository/shrine/get_distance_repository.dart';
import 'package:zinjanow_app/domain/value/distance.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';

class GetDistanceRepositoryImpl implements GetDistanceRepository {
  final GoogleShrineDatasource _googleShrineDatasource;
  final DistanceFactory _distanceFactory;

  GetDistanceRepositoryImpl({
    required GoogleShrineDatasource googleShrineDatasource,
    required DistanceFactory distanceFactory
  }) : _googleShrineDatasource = googleShrineDatasource,
  _distanceFactory = distanceFactory;

  @override
  Future<Distance> getDistance(currentLat, currentLng, lat, lng) async {
    try {
      final res = await _googleShrineDatasource.getShrineDistance(currentLat, currentLng, lat, lng);
      return _distanceFactory.createFromModel(res);
    } catch(err) {
      throw Exception();
    }
  }
}