
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/domain/value/review.dart';

part 'shrine_state.freezed.dart';

@freezed
class ShrineState with _$ShrineState {
  factory ShrineState({
    String? id,
    String? name,
    List<Photo>? photos,
    List<Review>? reviews,
    double? lat,
    double? lng,
    String? mapUrl,
    String? distance,
    String? duration,
    num? rating
  }) = _ShrineState;

  factory ShrineState.fromEntity(Shrine shrine) {
    return ShrineState(
      id: shrine.id,
      name: shrine.name,
      photos: shrine.photos,
      reviews: shrine.reviews,
      lat: shrine.lat,
      lng: shrine.lng,
      mapUrl: shrine.mapUrl,
      distance: shrine.distance,
      duration: shrine.duration,
      rating: shrine.rating
    );
  }
}