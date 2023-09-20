import 'package:zinjanow_app/infrastructure/model/shrine/shrine_response_model.dart';

class ShrineModel {
  final List<ShrineResponseModel>? results;

  ShrineModel({
    this.results
  });

  factory ShrineModel.fromJson(Map<String, dynamic> json) { 
    return ShrineModel(
      results: json["results"].map<ShrineResponseModel>((e) => 
        ShrineResponseModel.fromJson(e)
      ).toList()
    );
  }
}