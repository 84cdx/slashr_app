import 'package:carousel_slider/carousel_slider.dart';
import 'package:media_recommendation_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:media_recommendation_app/screens/details_screen.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: snapshot.data!.length,
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            viewportFraction: 0.55,
            //enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            pageSnapping: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      movie: snapshot.data[itemIndex],
                    ),
                  ),
                );
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        '${Constants.imageUrl}${snapshot.data[itemIndex].posterPath}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
