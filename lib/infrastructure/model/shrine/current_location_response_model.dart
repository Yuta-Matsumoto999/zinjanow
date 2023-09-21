class CurrentLocationResponseModel {
  final double lat;
  final double lng;

  CurrentLocationResponseModel({
    required this.lat,
    required this.lng
  });

  factory CurrentLocationResponseModel.fromJson(Map<String, dynamic> json) {
    return CurrentLocationResponseModel(
      lat: json["lat"], 
      lng: json["lng"]
    );
  }
}