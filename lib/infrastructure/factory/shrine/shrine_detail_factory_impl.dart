import 'package:zinjanow_app/domain/entity/shrine/shrine_detail.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_detail_factory.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_photo_factory.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_review_factory.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/domain/value/review.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_detail_model.dart';

class ShrineDetailFactoryImpl implements ShrineDetailFactory {
  final ShrinePhotoFactory _shrinePhotoFactory;
  final ShrineReviewFactory _shrineReviewFactory;

  ShrineDetailFactoryImpl({
    required ShrinePhotoFactory shrinePhotoFactory,
    required ShrineReviewFactory shrineReviewFactory
  }) : _shrinePhotoFactory = shrinePhotoFactory,
  _shrineReviewFactory = shrineReviewFactory;

  @override
  ShrineDetail create({
      String? id, 
      String? name, 
      String? address, 
      double? lat, 
      double? lng, 
      List<Photo>? photos, 
      num? rating, 
      List<Review>? reviews, 
      String? mapUrl,
      int? user_ratings_total
    }) {
    return ShrineDetail(
      id: id,
      name: name,
      address: address,
      lat: lat,
      lng: lng,
      photos: photos,
      rating: rating,
      reviews: reviews,
      mapUrl: mapUrl,
      user_ratings_total: user_ratings_total
    );
  }

  @override
  ShrineDetail createFromModel(ShrineDetailModel shrineDetailModel) {
    return ShrineDetail(
      id: shrineDetailModel.id,
      name: shrineDetailModel.name,
      address: shrineDetailModel.address,
      lat: shrineDetailModel.lat,
      lng: shrineDetailModel.lng,
      photos: _shrinePhotoFactory.createFromModel(shrineDetailModel.photos),
      rating: shrineDetailModel.rating,
      reviews: _shrineReviewFactory.createFromModel(shrineDetailModel.reviews),
      mapUrl: shrineDetailModel.mapUrl,
      user_ratings_total: shrineDetailModel.user_ratings_total
    );
  }
}