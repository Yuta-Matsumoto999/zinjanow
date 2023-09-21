import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/factory/shrine/distance_factory.dart';
import 'package:zinjanow_app/domain/value/distance.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/shrine/get_distance_repository_impl.dart';

final getDistanceRepositoryProvider = Provider<GetDistanceRepository>(
  (ref) => GetDistanceRepositoryImpl(
    googleShrineDatasource: ref.watch(googleShrineDatasourceProvider), 
    distanceFactory: ref.watch(distanceFactoryProvider)
  )
);

abstract class GetDistanceRepository {
  Future<Distance> getDistance(currentLat, currentLng, lat, lng);
}