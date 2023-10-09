import 'package:zinjanow_app/infrastructure/model/shrine/shrine_photo_model.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_review_model.dart';

class ShrineDetailModel {
  final String? id;
  final String? name;
  final String? address;
  final double? lat;
  final double? lng;
  final ShrinePhotoModel? photos;
  final num? rating;
  final ShrineReviewModel? reviews;
  final String? mapUrl;
  final int? user_ratings_total;

  ShrineDetailModel({
    this.id,
    this.name,
    this.address,
    this.lat,
    this.lng,
    this.photos,
    this.rating,
    this.reviews,
    this.mapUrl,
    this.user_ratings_total
  });

  factory ShrineDetailModel.fromJson(json) {
    double lat = json["geometry"]["location"]["lat"];
    double lng = json["geometry"]["location"]["lng"];

    return ShrineDetailModel(
      id: json["place_id"],
      name: json["name"],
      address: json["formatted_address"],
      lat: lat,
      lng: lng,
      photos: ShrinePhotoModel.fromJson(json["photos"]),
      rating: json["rating"],
      reviews: ShrineReviewModel.fromJson(json["reviews"]),
      mapUrl: json["url"],
      user_ratings_total: json["user_ratings_total"]
    );
  }
}

