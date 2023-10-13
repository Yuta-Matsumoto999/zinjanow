import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zinjanow_app/domain/entity/shrine/current_location.dart';

part 'current_location_state.freezed.dart';

@freezed
class CurrentLocationState with _$CurrentLocationState {
  factory CurrentLocationState({
    required double lat,
    required double lng,
    required String address
  }) = _CurrentLocationState;

  factory CurrentLocationState.fromEntity(CurrentLocation currentLocation) {
    return  CurrentLocationState(
      lat: currentLocation.lat, 
      lng: currentLocation.lng,
      address: currentLocation.address
    );
  }
}