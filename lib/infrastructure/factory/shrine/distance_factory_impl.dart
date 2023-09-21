import 'package:zinjanow_app/domain/factory/shrine/distance_factory.dart';
import 'package:zinjanow_app/domain/value/distance.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shirine_distance_response_model.dart';

class DistanceFactoryImpl implements DistanceFactory {
  @override
  Distance create({String? distance, String? duration}) {
    return Distance(
      distance: distance,
      duration: duration
    );    
  }

  @override
  Distance createFromModel(ShrineDistanceResponseModel shrineDistanceResponseModel) {
    return Distance(
      distance: shrineDistanceResponseModel.distance,
      duration: shrineDistanceResponseModel.duration
    );
  }
}