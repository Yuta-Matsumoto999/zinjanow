import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/value/distance.dart';
import 'package:zinjanow_app/infrastructure/factory/shrine/distance_factory_impl.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shirine_distance_response_model.dart';

final distanceFactoryProvider = Provider<DistanceFactory>(
  (ref) => DistanceFactoryImpl()
);

abstract class DistanceFactory {
  Distance create({
    String? distance,
    String? duration
  });

  Distance createFromModel(ShrineDistanceResponseModel shrineDistanceResponseModel);
}