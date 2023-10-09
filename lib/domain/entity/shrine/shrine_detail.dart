import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/domain/value/review.dart';

class ShrineDetail {
  final String? id;
  final String? name;
  final String? address;
  final double? lat;
  final double? lng;
  final List<Photo>? photos;
  final num? rating;
  final List<Review>? reviews;
  final String? mapUrl;
  final int? user_ratings_total;
  String? distance;
  String? duration;

  ShrineDetail({
    this.id,
    this.name,
    this.address,
    this.lat,
    this.lng,
    this.photos,
    this.rating,
    this.reviews,
    this.mapUrl,
    this.user_ratings_total,
    this.distance,
    this.duration
  });
}