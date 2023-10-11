import 'package:flutter/material.dart';
import 'package:zinjanow_app/domain/value/review.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/review_item.dart';

class ReviewList extends StatelessWidget {
  final List<Review>? reviews;
  const ReviewList({
    Key? key,
    this.reviews
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reviews!.length,
          itemBuilder: (BuildContext context, int index) {
            return ReviewItem(
              iconUrl: reviews![index].profilePhotoUrl,
              author: reviews![index].authorName,
              text: reviews![index].text,
              rating: reviews![index].rating,
            );
          },
        ),
      )
    );
  }
}