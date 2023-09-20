import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_model.dart';

class GoogleShrineDatasourceImpl implements GoogleShrineDatasource {
  @override
  Future<ShrineModel> getShrines() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    try {
      // 位置情報の許可
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if(!serviceEnabled) {
        return Future.error("Location services are disabled.");
      }

      locationPermission = await Geolocator.checkPermission();
      if(locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if(locationPermission == LocationPermission.denied) {
          return Future.error("Location permissions are denied");
        }
      }

      if(locationPermission == LocationPermission.deniedForever) {
        return Future.error("Location permissions are permanently denied, we cannot request permissions.");
      }

      // 現在地を取得
      final currentPosition = await Geolocator.getCurrentPosition();
      final latitude = currentPosition.latitude;
      final longitude = currentPosition.longitude;

      final apiKey = dotenv.get("GOOGLE_MAP_API_KEY");

      final dio = Dio();

      // 近くの神社を取得
      final res = await dio.get(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json",
        queryParameters: {
          "keyword": "神社",
          "location": "$latitude, $longitude",
          "language": "ja",
          "rankby": "distance",
          "key": apiKey
        }
      );

      return ShrineModel.fromJson(res.data);
    } catch(err) {
      throw Exception();
    }
  }

  // place詳細を取得
  Future<ShrineModel> getPlaceDetail(String placeId) async {
    final apiKey = dotenv.get("GOOGLE_MAP_API_KEY");

    final dio = Dio();

    final res = await dio.get(
      "https://maps.googleapis.com/maps/api/place/details/json",
      queryParameters: {
        "place_id": placeId,
        "key": apiKey
      }
    );

    return ShrineModel.fromJson(res.data);
  }

  // 現在地から検索先までの距離を取得
  Future<int> getDistance (currentLatitude, currentLongitude, shrineLatitude, shrineLongitude) async {
    return 1;
  }
}