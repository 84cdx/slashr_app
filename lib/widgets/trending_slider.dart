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
          viewportFraction: MediaQuery.of(context).size.width >
                  MediaQuery.of(context).size.height
              ? 0.25
              : 0.5, // viewportFraction je nach Layout
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
              margin: const EdgeInsets.symmetric(
                  horizontal: 8.0), // Abstand zwischen den Postern
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 41, 41, 41), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 300,
                  width: 200, // Die feste Breite des Containers bleibt
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imageUrl}${snapshot.data[itemIndex].posterPath}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
