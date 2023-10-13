import 'package:zinjanow_app/domain/entity/shrine/current_location.dart';
import 'package:zinjanow_app/domain/factory/shrine/current_location_factory.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/current_location_response_model.dart';

class CurrentLocationFactoryImpl implements CurrentLocationFactory {
  @override
  CurrentLocation create({required double lat, required double lng, required String address}) {
    return CurrentLocation(
      lat: lat, 
      lng: lng,
      address: address
    );
  }

  @override
  CurrentLocation createFromModel(CurrentLocationResponseModel currentLocationResponseModel) {
    return CurrentLocation(
      lat: currentLocationResponseModel.lat, 
      lng: currentLocationResponseModel.lng,
      address: currentLocationResponseModel.address
    );
  }
}