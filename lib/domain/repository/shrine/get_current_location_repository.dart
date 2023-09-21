import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/shrine/current_location.dart';
import 'package:zinjanow_app/domain/factory/shrine/current_location_factory.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';
import 'package:zinjanow_app/infrastructure/repository/shrine/get_current_location_repository_impl.dart';

final getCurrentLocationProvider = Provider<GetCurrentLocationRepository>(
  (ref) => GetCurrentLocationRepositoryImpl(
    googleShrineDatasource: ref.watch(googleShrineDatasourceProvider), 
    currentLocationFactory: ref.watch(currentLocationFactoryProvider)
  )
);

abstract class GetCurrentLocationRepository {
  Future<CurrentLocation> getCurrentLocation();
}