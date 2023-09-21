class ShrineDistanceResponseModel {
  final String? distance;
  final String? duration;

  ShrineDistanceResponseModel({
    this.distance,
    this.duration
  });

  factory ShrineDistanceResponseModel.fromJson(Map<String, dynamic> json) {
    final distance = json["distance"]["text"];
    final duration = json["duration"]["text"];

    return ShrineDistanceResponseModel(
      distance: distance,
      duration: duration
    );
  }
}