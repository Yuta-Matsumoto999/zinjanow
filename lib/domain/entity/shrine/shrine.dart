import 'package:zinjanow_app/domain/value/Photo.dart';

class Shrine {
  final String? id;
  final String? name;
  final List<Photo>? photos;
  final double? lat;
  final double? lng;
  final String? mapUrl;
  final num? rating;
  String? distance;
  String? duration;

  Shrine({
    this.id,
    this.name,
    this.photos,
    this.lat,
    this.lng,
    this.mapUrl,
    this.rating,
    this.distance,
    this.duration
  });
}