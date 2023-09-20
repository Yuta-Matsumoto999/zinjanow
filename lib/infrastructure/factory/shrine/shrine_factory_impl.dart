import 'package:zinjanow_app/domain/entity/shrine.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_factory.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_photo_factory.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_review_factory.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/domain/value/review.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_response_model.dart';

class ShrineFactoryImpl implements ShrineFactory {
  final ShrinePhotoFactory _shrinePhotoFactory;
  final ShrineReviewFactory _shrineReviewFactory;

  ShrineFactoryImpl({
    required ShrinePhotoFactory shrinePhotoFactory,
    required ShrineReviewFactory shrineReviewFactory
  }) : _shrinePhotoFactory = shrinePhotoFactory,
  _shrineReviewFactory = shrineReviewFactory;

  @override
  Shrine create({
    required String id, 
    required String name, 
    List<Photo>? photos,
    List<Review>? reviews,
    String? mapUrl,
    int? distance
  }) {
    return Shrine(
      id: id, 
      name: name,
      photos: photos,
      reviews: reviews,
      mapUrl: mapUrl,
      distance: distance
    );
  }

  @override
  Shrine createFromModel(ShrineResponseModel shrineResponseModel) {
    return Shrine(
      id: shrineResponseModel.id,
      name: shrineResponseModel.name,
      photos: _shrinePhotoFactory.createFromModel(shrineResponseModel.photos),
      reviews: _shrineReviewFactory.createFromModel(shrineResponseModel.reviews)
    );
  }
}