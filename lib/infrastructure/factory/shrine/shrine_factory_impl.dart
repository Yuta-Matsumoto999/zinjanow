import 'package:zinjanow_app/domain/entity/shrine/shrine.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_factory.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_photo_factory.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_response_model.dart';

class ShrineFactoryImpl implements ShrineFactory {
  final ShrinePhotoFactory _shrinePhotoFactory;

  ShrineFactoryImpl({
    required ShrinePhotoFactory shrinePhotoFactory,
  }) : _shrinePhotoFactory = shrinePhotoFactory;

  @override
  Shrine create({
    String? id, 
    String? name, 
    List<Photo>? photos,
    double? lat,
    double? lng,
    String? mapUrl,
    num? rating
  }) {
    return Shrine(
      id: id, 
      name: name,
      photos: photos,
      lat: lat,
      lng: lng,
      mapUrl: mapUrl,
      rating: rating
    );
  }

  @override
  Shrine createFromModel(ShrineResponseModel shrineResponseModel) {
    return Shrine(
      id: shrineResponseModel.id,
      name: shrineResponseModel.name,
      photos: _shrinePhotoFactory.createFromModel(shrineResponseModel.photos),
      lat: shrineResponseModel.lat,
      lng: shrineResponseModel.lng,
      mapUrl: shrineResponseModel.mapUrl,
      rating: shrineResponseModel.rating
    );
  }
}