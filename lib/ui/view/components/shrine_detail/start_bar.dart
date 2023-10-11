import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zinjanow_app/core/constants/customColor.dart';

class StartBar extends StatelessWidget {
  final num? rating;
  const StartBar({
    Key? key,
    this.rating
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Color(CustomColor.mainTheme)
      ),
      itemSize: 14,
      onRatingUpdate: (rating) {
        // 
      },
      initialRating: rating!.toDouble(),
      itemCount: 5,
      allowHalfRating: true,
      ignoreGestures: true
    );
  }
}