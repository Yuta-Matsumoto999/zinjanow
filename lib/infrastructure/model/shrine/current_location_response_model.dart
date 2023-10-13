class CurrentLocationResponseModel {
  final double lat;
  final double lng;
  final String address;

  CurrentLocationResponseModel({
    required this.lat,
    required this.lng,
    required this.address
  });

  factory CurrentLocationResponseModel.fromJson(Map<String, dynamic> json) {
    return CurrentLocationResponseModel(
      lat: json["lat"], 
      lng: json["lng"],
      address: json["address"]
    );
  }
}