import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/shrine/current_location.dart';
import 'package:zinjanow_app/infrastructure/factory/shrine/current_location_factory_impl.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/current_location_response_model.dart';

final currentLocationFactoryProvider = Provider(
  (ref) => CurrentLocationFactoryImpl()
);

abstract class CurrentLocationFactory {
  CurrentLocation create({
    required double lat,
    required double lng
  });

  CurrentLocation createFromModel(CurrentLocationResponseModel currentLocationResponseModel);
}