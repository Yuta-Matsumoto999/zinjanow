import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/domain/value/review.dart';

class Shrine {
  final String id;
  final String name;
  final List<Photo>? photos;
  final List<Review>? reviews;
  final String? mapUrl;
  final int? distance;

  Shrine({
    required this.id,
    required this.name,
    this.photos,
    this.reviews,
    this.mapUrl,
    this.distance
  });
}