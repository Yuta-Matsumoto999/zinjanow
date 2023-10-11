import 'package:flutter/material.dart';
import 'package:zinjanow_app/ui/view/components/shrine_detail/start_bar.dart';

class ReviewItem extends StatelessWidget {
  final String? iconUrl;
  final String? author;
  final String? text;
  final int? rating;

  const ReviewItem({
    Key? key,
    this.iconUrl,
    this.author,
    this.text,
    this.rating
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    height: size.height * 0.03,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        iconUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(author!, style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600 
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(rating.toString(), style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  Container(
                    child: StartBar(
                      rating: rating,
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: text!.isNotEmpty ? Text(text!) : const Text("コメントはありません。"),
          )
        ],
      ),
    );
  }
}