
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zinjanow_app/domain/entity/shrine.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/domain/value/review.dart';

part 'shrine_state.freezed.dart';

@freezed
class ShrineState with _$ShrineState {
  factory ShrineState({
    required String id,
    required String name,
    List<Photo>? photos,
    List<Review>? reviews,
    String? mapUrl,
    int? distance
  }) = _ShrineState;

  factory ShrineState.fromEntity(Shrine shrine) {
    return ShrineState(
      id: shrine.id,
      name: shrine.name,
      photos: shrine.photos,
      reviews: shrine.reviews,
      mapUrl: shrine.mapUrl,
      distance: shrine.distance
    );
  }
}