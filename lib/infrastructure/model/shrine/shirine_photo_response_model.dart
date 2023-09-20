import 'package:flutter_dotenv/flutter_dotenv.dart';

class ShrinePhotoResponseModel {
  final String? url;

  ShrinePhotoResponseModel({
    this.url
  });

  factory ShrinePhotoResponseModel.fromJson(Map<String, dynamic>? json) {
    final photoReference = json?["photo_reference"];
    final apiKey = dotenv.get("GOOGLE_MAP_API_KEY");
    if(photoReference != null) {
      final url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=800&photo_reference=$photoReference&key=$apiKey";
      return ShrinePhotoResponseModel(
        url: url
      );
    } else {
      return ShrinePhotoResponseModel(
        url: null
      );
    }
  }
}
