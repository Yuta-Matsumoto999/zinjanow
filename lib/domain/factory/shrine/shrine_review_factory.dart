import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zinjanow_app/domain/value/review.dart';
import 'package:zinjanow_app/infrastructure/factory/shrine/shrine_review_factory_impl.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_review_model.dart';

final shrineReviewFactoryProvider = Provider<ShrineReviewFactory>(
  (ref) => ShrineReviewFactoryImpl()
);

abstract class ShrineReviewFactory {
  Review create({
    String? authorName,
    String? profilePhotoUrl,
    int? rating,
    String? relativeTimeDescription,
    String? text
  });

  List<Review>? createFromModel(ShrineReviewModel? shrineReviewModel);
}