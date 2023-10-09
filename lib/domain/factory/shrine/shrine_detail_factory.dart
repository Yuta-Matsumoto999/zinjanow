import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/entity/shrine/shrine_detail.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_photo_factory.dart';
import 'package:zinjanow_app/domain/factory/shrine/shrine_review_factory.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';
import 'package:zinjanow_app/domain/value/review.dart';
import 'package:zinjanow_app/infrastructure/factory/shrine/shrine_detail_factory_impl.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_detail_model.dart';

final shrineDetailFactoryProvider = Provider<ShrineDetailFactory>(
  (ref) => ShrineDetailFactoryImpl(
    shrinePhotoFactory: ref.watch(shrinePhotoFactoryprovider), 
    shrineReviewFactory: ref.watch(shrineReviewFactoryProvider)
  )
);

abstract class ShrineDetailFactory {
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
  });

  ShrineDetail createFromModel(ShrineDetailModel shrineDetailModel);
}