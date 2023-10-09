import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zinjanow_app/domain/entity/shrine/shrine_detail.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/domain/value/review.dart';

part 'shrine_detail_state.freezed.dart';

@freezed
class ShrineDetailState with _$ShrineDetailState {
  factory ShrineDetailState({
    String? id,
    String? name,
    String? address,
    double? lat,
    double? lng,
    List<Photo>? photos,
    num? rating,
    List<Review>? reviews,
    String? mapUrl,
    int? user_ratings_total,
    String? distance,
    String? duration
  }) = _ShrineDetailState;

  factory ShrineDetailState.fromEntity(ShrineDetail shrineDetail) {
    return ShrineDetailState(
      id: shrineDetail.id,
      name: shrineDetail.name,
      address: shrineDetail.address,
      lat: shrineDetail.lat,
      lng: shrineDetail.lng,
      photos: shrineDetail.photos,
      rating: shrineDetail.rating,
      reviews: shrineDetail.reviews,
      mapUrl: shrineDetail.mapUrl,
      user_ratings_total: shrineDetail.user_ratings_total,
      distance: shrineDetail.distance,
      duration: shrineDetail.duration
    );
  }
}