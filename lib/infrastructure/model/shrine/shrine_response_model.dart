import 'package:zinjanow_app/infrastructure/model/shrine/shrine_photo_model.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_review_model.dart';

class ShrineResponseModel {
  final String? id;
  final String? name;
  final ShrinePhotoModel? photos;
  final ShrineReviewModel? reviews;
  final double? lat;
  final double? lng;
  final String? mapUrl;
  final int? distance;
  final num? rating;

  ShrineResponseModel({
    this.id,
    this.name,
    this.photos,
    this.reviews,
    this.lat,
    this.lng,
    this.mapUrl,
    this.distance,
    this.rating
  });

  factory ShrineResponseModel.fromJson(json) {
    double lat = json["geometry"]["location"]["lat"];
    double lng = json["geometry"]["location"]["lng"];

    return ShrineResponseModel(
      id: json["place_id"], 
      name: json["name"],
      photos: ShrinePhotoModel.fromJson(json["photos"]),
      reviews: ShrineReviewModel.fromJson(json["reviews"]),
      lat: lat,
      lng: lng,
      mapUrl: json["url"],
      distance: json["distance"],
      rating: json["rating"]
    );
  }
}