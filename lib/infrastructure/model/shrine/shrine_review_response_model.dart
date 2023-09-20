class ShrinReviewResponseModel {
  final String? authorName;
  final String? profilePhotoUrl;
  final int? rating;
  final String? relativeTimeDescription;
  final String? text;

  ShrinReviewResponseModel({
    this.authorName,
    this.profilePhotoUrl,
    this.rating,
    this.relativeTimeDescription,
    this.text
  });

  factory ShrinReviewResponseModel.fromJson(Map<String, dynamic>? json) {
    return ShrinReviewResponseModel(
      authorName: json?["author_name"],
      profilePhotoUrl: json?["profile_photo_url"],
      rating: json?["rating"],
      relativeTimeDescription: json?["relative_time_description"],
      text: json?["text"]
    );
  }
}