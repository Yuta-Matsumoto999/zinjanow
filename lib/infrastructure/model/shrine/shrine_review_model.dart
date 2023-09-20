import 'package:zinjanow_app/infrastructure/model/shrine/shrine_review_response_model.dart';

class ShrineReviewModel {
  final List<ShrinReviewResponseModel>? reviews;

  ShrineReviewModel({
    this.reviews
  });

  factory ShrineReviewModel.fromJson(List<dynamic>? json) {
    return ShrineReviewModel(
      reviews: json?.map((e) => 
        ShrinReviewResponseModel.fromJson(e)
      ).toList()
    );
  }
}