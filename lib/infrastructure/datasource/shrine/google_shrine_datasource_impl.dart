import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zinjanow_app/infrastructure/datasource/shrine/google_shrine_datasource.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/current_location_response_model.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shirine_distance_response_model.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_model.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_response_model.dart';

class GoogleShrineDatasourceImpl implements GoogleShrineDatasource {
  final apiKey = dotenv.get("GOOGLE_MAP_API_KEY");
  final dio = Dio();

  @override
  Future<CurrentLocationResponseModel> getCurrentLocation() async {
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

      final location = {
        "lat": latitude,
        "lng": longitude
      };

      return CurrentLocationResponseModel.fromJson(location);
    } catch(err) {
      throw Exception();
    }
  }

  @override
  Future<ShrineModel> getShrines(lat, lng) async {
    try {
      // 近くの神社を取得
      final res = await dio.get(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json",
        queryParameters: {
          "keyword": "神社",
          "location": "$lat, $lng",
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

  @override
  Future<ShrineResponseModel> getShrineDetail(String placeId) async {
    try {
      final res = await dio.get(
        "https://maps.googleapis.com/maps/api/place/details/json",
        queryParameters: {
          "place_id": placeId,
          "key": apiKey
        }
      );

      return ShrineResponseModel.fromJson(res.data);
    } catch (err) {
      throw Exception();
    }
  }

  @override
  Future<ShrineDistanceResponseModel> getShrineDistance (currentLatitude, currentLongitude, shrineLatitude, shrineLongitude) async {
    try {
      final res = await dio.get(
        "https://maps.googleapis.com/maps/api/distancematrix/json",
        queryParameters: {
          "destinations": ["$shrineLatitude, $shrineLongitude"],
          "origins": ["$currentLatitude, $currentLongitude"],
          "mode": "walking",
          "key": apiKey
        }
      );

      return ShrineDistanceResponseModel.fromJson(res.data["rows"][0]["elements"][0]);
    } catch (err) {
      throw Exception();
    }
  }
}