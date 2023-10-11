import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zinjanow_app/domain/value/Photo.dart';

class ImgSlider extends StatelessWidget {
  final List<Photo> photos;
  const ImgSlider({
    Key? key,
    required this.photos,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  CarouselSlider.builder(
      itemCount: photos.length, 
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Container(
          margin: const EdgeInsets.only(right: 5),
          width: size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              photos[itemIndex].url!,
              fit: BoxFit.cover,
            ),
          )
        );
      }, 
      options: CarouselOptions(
        height: 180,
        initialPage: 1,
        viewportFraction: 0.65,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
      )
    );
  }
}