import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/domain/value/review.dart';

class Shrine {
  final String? id;
  final String? name;
  final List<Photo>? photos;
  final List<Review>? reviews;
  final double? lat;
  final double? lng;
  final String? mapUrl;
  final int? distance;
  final num? rating;

  Shrine({
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
}