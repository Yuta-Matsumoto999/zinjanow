import 'package:zinjanow_app/infrastructure/model/shrine/shrine_photo_model.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_review_model.dart';

class ShrineResponseModel {
  final String id;
  final String name;
  final ShrinePhotoModel? photos;
  final ShrineReviewModel? reviews;
  final String? mapUrl;
  final int? distance;

  ShrineResponseModel({
    required this.id,
    required this.name,
    this.photos,
    this.reviews,
    this.mapUrl,
    this.distance
  });

  factory ShrineResponseModel.fromJson(json) {
    return ShrineResponseModel(
      id: json["place_id"], 
      name: json["name"],
      photos: ShrinePhotoModel.fromJson(json["photos"]),
      reviews: ShrineReviewModel.fromJson(json["reviews"]),
      mapUrl: json["url"],
      distance: json["distance"]
    );
  }
}