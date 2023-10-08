
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';

part 'shrine_state.freezed.dart';

@freezed
class ShrineState with _$ShrineState {
  factory ShrineState({
    String? id,
    String? name,
    List<Photo>? photos,
    double? lat,
    double? lng,
    String? distance,
    String? duration,
    num? rating
  }) = _ShrineState;

  factory ShrineState.fromEntity(Shrine shrine) {
    return ShrineState(
      id: shrine.id,
      name: shrine.name,
      photos: shrine.photos,
      lat: shrine.lat,
      lng: shrine.lng,
      distance: shrine.distance,
      duration: shrine.duration,
      rating: shrine.rating
    );
  }
}