import 'package:zinjanow_app/infrastructure/model/shrine/shirine_photo_response_model.dart';

class ShrinePhotoModel {
  final List<ShrinePhotoResponseModel>? photos;

  ShrinePhotoModel({
    this.photos
  });

  factory ShrinePhotoModel.fromJson(List<dynamic>? json) {
    return ShrinePhotoModel(
      photos: json?.map((e) =>
        ShrinePhotoResponseModel.fromJson(e)
      ).toList()
    );
  }
}