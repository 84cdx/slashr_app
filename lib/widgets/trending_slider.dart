import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: 10,
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            pageSnapping: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: const Color.fromARGB(255, 117, 117, 117),
                height: 300,
                width: 200,
              ),
            );
          }),
    );
  }
}