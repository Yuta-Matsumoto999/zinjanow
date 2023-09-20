import 'package:zinjanow_app/domain/factory/shrine/shrine_review_factory.dart';
import 'package:zinjanow_app/domain/value/review.dart';
import 'package:zinjanow_app/infrastructure/model/shrine/shrine_review_model.dart';

class ShrineReviewFactoryImpl implements ShrineReviewFactory {
  @override
  Review create({
    String? authorName, 
    String? profilePhotoUrl, 
    int? rating, 
    String? relativeTimeDescription, 
    String? text
  }) {
    return Review(
      authorName: authorName,
      profilePhotoUrl: profilePhotoUrl,
      rating: rating,
      relativeTimeDescription: relativeTimeDescription,
      text: text
    );
  }

  @override
  List<Review>? createFromModel(ShrineReviewModel? shrinReviewModel) {
    return shrinReviewModel?.reviews?.map((e) => 
      Review(
        authorName: e.authorName,
        profilePhotoUrl: e.profilePhotoUrl,
        rating: e.rating,
        relativeTimeDescription: e.relativeTimeDescription,
        text: e.text
      )
    ).toList();
  }
}